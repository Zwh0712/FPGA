module led_multi_clock(
    input  wire sys_clk,      // 系统时钟 50MHz
    input  wire sys_rst_n,    // 系统复位 (低电平有效)
    output reg  [1:0] led     // 2个LED灯
);

    // 定义时间常数 (50MHz时钟下)
    // 0.5秒 = 25,000,000 个周期
    parameter CNT_MAX_0 = 26'd24_999_999; 
    // 0.25秒 = 12,500,000 个周期
    parameter CNT_MAX_1 = 26'd12_499_999;

    // 定义两个计数器
    reg [25:0] cnt0;
    reg [25:0] cnt1;

    // ---------------------------------------------------------
    // 逻辑块1：控制 LED[0] (慢速: 0.5s 翻转)
    // ---------------------------------------------------------
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            cnt0   <= 26'd0;
            led[0] <= 1'b1;  // 复位时灭 (假设高电平亮，视电路而定，通常ZYNQ板是高电平亮)
        end
        else if (cnt0 == CNT_MAX_0) begin
            cnt0   <= 26'd0;
            led[0] <= ~led[0]; // 翻转状态
        end
        else begin
            cnt0   <= cnt0 + 1'b1;
        end
    end

    // ---------------------------------------------------------
    // 逻辑块2：控制 LED[1] (快速: 0.25s 翻转)
    // ---------------------------------------------------------
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            cnt1   <= 26'd0;
            led[1] <= 1'b0;  // 复位时亮 (故意设置初始状态不同)
        end
        else if (cnt1 == CNT_MAX_1) begin
            cnt1   <= 26'd0;
            led[1] <= ~led[1]; // 翻转状态
        end
        else begin
            cnt1   <= cnt1 + 1'b1;
        end
    end

endmodule