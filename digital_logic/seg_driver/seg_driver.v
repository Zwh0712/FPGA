module seg_driver(
    input             sys_clk,      
    input             sys_rst_n,    
    input      [15:0] data_in,      
    input      [3:0]  point_on,     
    output reg [3:0]  seg_sel,      
    output reg [7:0]  seg_led       
);

    parameter CNT_MAX = 16'd49_999; 

    // 1. 扫描定时器 (不变)
    reg [15:0] cnt_scan;
    wire       scan_tick;
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) cnt_scan <= 16'd0;
        else if (cnt_scan == CNT_MAX) cnt_scan <= 16'd0;
        else cnt_scan <= cnt_scan + 1'b1;
    end
    assign scan_tick = (cnt_scan == CNT_MAX);

    // 2. 状态切换 (不变)
    reg [1:0] state; 
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) state <= 2'd0;
        else if (scan_tick) state <= state + 1'b1;
    end

    // 3. 位选逻辑 (*** 修改点 1：改为共阴极逻辑 ***)
    // 共阴极：公共端接地(0)为选中，不选中给(1)
    
    reg [3:0] num_disp; 
    reg       dot_disp; 

    always @(*) begin
        case (state)
            2'd0: begin 
                seg_sel  = 4'b1110;          // <--- 修改：0选中第0位
                num_disp = data_in[3:0];     
                dot_disp = point_on[0];      
            end
            2'd1: begin 
                seg_sel  = 4'b1101;          // <--- 修改：0选中第1位
                num_disp = data_in[7:4];
                dot_disp = point_on[1];
            end
            2'd2: begin 
                seg_sel  = 4'b1011;          // <--- 修改：0选中第2位
                num_disp = data_in[11:8];
                dot_disp = point_on[2];
            end
            2'd3: begin 
                seg_sel  = 4'b0111;          // <--- 修改：0选中第3位
                num_disp = data_in[15:12];
                dot_disp = point_on[3];
            end
            default: begin
                seg_sel  = 4'b1111;          // 全不选
                num_disp = 4'd0;
                dot_disp = 1'b0;
            end
        endcase
    end

    // 4. 段码译码 (不变，字形定义本身是高电平有效的)
    reg [6:0] seg_decode; 
    always @(*) begin
        case (num_disp)
            4'h0: seg_decode = 7'b011_1111; 
            4'h1: seg_decode = 7'b000_0110; 
            4'h2: seg_decode = 7'b101_1011; 
            4'h3: seg_decode = 7'b100_1111; 
            4'h4: seg_decode = 7'b110_0110; 
            4'h5: seg_decode = 7'b110_1101; 
            4'h6: seg_decode = 7'b111_1101; 
            4'h7: seg_decode = 7'b000_0111; 
            4'h8: seg_decode = 7'b111_1111; 
            4'h9: seg_decode = 7'b110_1111; 
            4'hA: seg_decode = 7'b111_0111; 
            4'hB: seg_decode = 7'b111_1100; 
            4'hC: seg_decode = 7'b011_1001; 
            4'hD: seg_decode = 7'b101_1110; 
            4'hE: seg_decode = 7'b111_1001; 
            4'hF: seg_decode = 7'b111_0001; 
            default: seg_decode = 7'b000_0000;
        endcase
    end

    // 5. 最终输出拼装 (*** 修改点 2：共阴极不需要取反 ***)
    // 共阴极：段选给高电平(1)点亮
    always @(*) begin
        // 去掉了波浪号 ~
        seg_led = {dot_disp, seg_decode}; 
    end

endmodule
