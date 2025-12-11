module bin_to_bcd(
    input  [8:0] bin_in,    // 9位二进制 (最大511)
    output [19:0] bcd_out   // 输出给驱动模块的格式 {千, 百, 十, 个}
);
    reg [3:0] bcd_hun;
    reg [3:0] bcd_ten;
    reg [3:0] bcd_one;

    always @(*) begin
        bcd_hun = bin_in / 100;
        bcd_ten = (bin_in % 100) / 10;
        bcd_one = bin_in % 10;
    end

    // 拼装输出，千位补0
    assign bcd_out = {4'd0, bcd_hun, bcd_ten, bcd_one};
endmodule

