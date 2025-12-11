module top_adder(
    input        sys_clk,
    input        sys_rst_n,
    input        key_in,      // 你的按键 (KEY1)
    
    // 连接到外接模块的物理引脚
    output [3:0] seg_sel,     // 位选
    output [7:0] seg_led      // 段选
);

    // 1. 按键消抖
    wire key_pulse;
    key_debounce u_key (
        .sys_clk   (sys_clk),
        .sys_rst_n (sys_rst_n),
        .key_in    (key_in),
        .key_flag  (key_pulse),
        .key_value () // 悬空
    );

    // 2. 加法器逻辑
    reg [7:0] num_a;
    reg [7:0] num_b;
    wire [8:0] sum;

    // 为了演示，我们让 num_b 固定为 10，num_a 每次按键加 1
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            num_a <= 8'd0;
            num_b <= 8'd10;
        end
        else if(key_pulse) begin
            num_a <= num_a + 1'b1;
        end
    end

    assign sum = num_a + num_b; // 求和

    // 3. 转 BCD 码
    wire [19:0] disp_data;
    bin_to_bcd u_bcd (
        .bin_in (sum),
        .bcd_out(disp_data)
    );

    // 4. 数码管显示
    seg_driver u_seg (
        .sys_clk   (sys_clk),
        .sys_rst_n (sys_rst_n),
        .data_in   (disp_data),
        .seg_sel   (seg_sel),
        .seg_led   (seg_led)
    );

endmodule
