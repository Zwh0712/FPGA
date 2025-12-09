module div_3(
    input           clk_in,
    input           rst_n,
    output          clk_out
);

    reg [1:0] r_cnt;

    // 1. 计数器逻辑 (保持你原来的写法)
    always @(posedge clk_in or negedge rst_n) begin
        if(!rst_n)
            r_cnt <= 2'd0;
        else 
            r_cnt <= (r_cnt == 2'd2) ? 2'd0 : r_cnt + 1;
    end

    reg clk_p;
    reg clk_n;

    // 2. 上升沿产生脉冲 clk_p
    // 当计数为 2 时拉高，其余时间拉低 (高电平占 1/3)
    always @(posedge clk_in or negedge rst_n) begin
        if(!rst_n)
            clk_p <= 1'b0;
        else if (r_cnt == 2'd2) 
            clk_p <= 1'b1;
        else 
            clk_p <= 1'b0;
    end

    // 3. 下降沿产生脉冲 clk_n
    // 同样在计数为 2 时拉高 (注意：r_cnt 是在上升沿变的，所以在下降沿采样的 r_cnt 值还是 2)
    always @(negedge clk_in or negedge rst_n) begin
        if(!rst_n)
            clk_n <= 1'b0;
        else if (r_cnt == 2'd2) 
            clk_n <= 1'b1;
        else 
            clk_n <= 1'b0;
    end

    // 4. 组合输出
    // 错开半个周期的两个脉冲相“或”，得到 1.5 个周期的高电平
    assign clk_out = clk_p | clk_n;

endmodule

// generate testbench for module div_3
