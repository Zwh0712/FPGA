n `if` statement usually creates a 2-to-1 multiplexer, selecting one input if the condition is true, and the other input if the condition is false.

!["D:\Git文件管理\笔记\VHDL学习\photoes\a4129d5226650141a3201a36e5bc36c9.png"](D:\Git文件管理\笔记\VHDL学习\photoes\a4129d5226650141a3201a36e5bc36c9.png)

```verilog
always @(*) begin
    if (condition) begin
        out = x;
    end
    else begin
        out = y;
    end
end
```

This is equivalent to using a continuous `assign`ment with a conditional operator:

```
assign out = (condition) ? x : y;
```

However, the procedural `if` statement provides a new way to make mistakes. The circuit is combinational only if `out` is always assigned a value.

### A bit of practice

Build a 2-to-1 mux that chooses between `a` and `b`. Choose `b` if *both* `sel_b1` and `sel_b2` are true. Otherwise, choose `a`. Do the same twice, once using `assign` statements and once using a procedural if statement.

| sel_b1 | sel_b2 | out_assign out_always |
| :----- | :----- | :-------------------- |
| 0      | 0      | a                     |
| 0      | 1      | a                     |
| 1      | 0      | a                     |
| 1      | 1      | b                     |






module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    

```verilog
// 组合逻辑 always 块：使用 sel_b1 和 sel_b2 共同判断
always @(*) begin
    // 示例逻辑：当 sel_b1 和 sel_b2 都为 1 时选择 b，否则选择 a
    if(sel_b1 && sel_b2) begin  // 双条件判断
        out_always = b;
    end else begin
        out_always = a;
    end
end

// 连续赋值：与 always 块逻辑一致
assign out_assign = (sel_b1 && sel_b2) ? b : a;
```

endmodule`

![](D:\Git文件管理\笔记\VHDL学习\photoes\微信图片_20251117154533_152_47.png)

