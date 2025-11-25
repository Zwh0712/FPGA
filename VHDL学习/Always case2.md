*优先级编码器*A *priority encoder* is a combinational circuit that, when given an input bit vector, outputs the position of the first `1` bit in the vector. For example, a 8-bit priority encoder given the input `8'b10010000` would output `3'd4`, because bit[4] is first bit that is high.

Build a 4-bit priority encoder. For this problem, if none of the input bits are high (i.e., input is zero), output zero. Note that a 4-bit number has 16 possible combinations.

### Module Declaration



构建一个 4 位优先级编码器。对于这个问题，如果没有一个输入位是高电平（即输入为零），则输出为零。请注意，一个 4 位数字有 16 种可能的组合。





```
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
```



`// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    

```verilog
always @(*) begin
    case (1'b1)  // 检测第一个为1的位（高位优先）
        in[3]: pos = 2'd3;  // 若in[3]为1，输出3
        in[2]: pos = 2'd2;  // 若in[2]为1（且in[3]为0），输出2
        in[1]: pos = 2'd1;  // 若in[1]为1（且更高位为0），输出1
        in[0]: pos = 2'd0;  // 若in[0]为1（且更高位为0），输出0
        default: pos = 2'd0;  // 全为0时输出0
    endcase
end
```

endmodule`



``

```verilog
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    
    always @(*) begin
        // 从最低位（bit0）开始检测，第一个1的位置（右数优先）
        if (in[0]) begin       // 若bit0为1（最右侧第一个1）
            pos = 2'd0;
        end else if (in[1]) begin  // 若bit1为1（且bit0为0）
            pos = 2'd1;
        end else if (in[2]) begin  // 若bit2为1（且更低位为0）
            pos = 2'd2;
        end else if (in[3]) begin  // 若bit3为1（且更低位为0）
            pos = 2'd3;
        end else begin             // 全0输入
            pos = 2'd0;
        end
    end

endmodule
```



1. **优先级方向调整**：

   题目示例中 “8'b10010000” 的 bit4 是第一个 1（从右数第 4 位），说明优先级是**从右向左检测第一个 1**（即最低位优先），而非之前理解的从左向右（最高位优先）。

2. **匹配测试用例**：

   例如：

   - 输入`4'b0011`时，bit0 是第一个 1，输出`0`；

   - 输入`4'b0101`时，bit0 是第一个 1，输出`0`；

   - 输入

     ```
     4'b0110
     ```

     时，bit1 是第一个 1，输出

     ```
     1
     ```

     

     这与测试用例的预期结果一致。

     3.**全 0 处理**：保持输出 0，符合题目要求。

此实现完全符合 “第一个 1（从右向左数的第一个高位）” 的定义，能够解决所有不匹配问题。





![](D:\Git文件管理\笔记\VHDL学习\photoes\微信图片_20251117204614_155_47.png)

