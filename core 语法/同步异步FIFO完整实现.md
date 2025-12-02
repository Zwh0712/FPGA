# FIFO 是数据缓冲和跨时钟域传输的核心。我们将它分为同步 FIFO和异步 FIFO



## 第一部分：FIFO 的核心模型

不管是同步还是异步，FIFO 的本质都像一个环形停车场：

存储介质 (RAM)：停车场的车位。

写指针 (Write Pointer)：管理员 A，负责指引新车停到哪一个空位。

读指针 (Read Pointer)：管理员 B，负责指引哪辆车该开出去了。

状态信号 (Full / Empty)：

Empty (空)：写指针追上了读指针（所有车都开走了）。

Full (满)：写指针绕了一圈，又追上了读指针（没地方停了）。

## 第二部分：同步 FIFO (Synchronous FIFO)

### 1.“多一位”技巧 (Bit Extension)

这是最简单的工程实现方法。 假设你的 FIFO 深度是 8 (需要 3 bit 地址: 000~111)。 我们在设计指针时，故意定义为 4 bit。

低 3 位：作为真实的 RAM 地址。

最高位 (第 4 位)：作为“绕圈标志”。

判空判满规则：

Empty：指针完全相等（包括最高位）。即 wr_ptr == rd_ptr。

Full：最高位不同，其余位相同（意味着写指针刚好多跑了一圈）。即 wr_ptr[MSB] != rd_ptr[MSB] 且 wr_ptr[rest] == rd_ptr[rest]。



### 2.同步 FIFO 代码模版

```verilog
module sync_fifo #(
    parameter WIDTH = 8,  // 数据位宽
    parameter DEPTH = 16  // 深度 (必须是2的幂)
)(
    input  wire clk,
    input  wire rst_n,
    input  wire wr_en,
    input  wire [WIDTH-1:0] data_in,
    input  wire rd_en,
    output reg  [WIDTH-1:0] data_out,
    output wire full,
    output wire empty
);

    // 地址宽度 log2(16) = 4
    // 指针宽度需要多一位 = 5
    localparam ADDR_WIDTH = $clog2(DEPTH); 
    
    reg [ADDR_WIDTH:0] wr_ptr; // 5位宽
    reg [ADDR_WIDTH:0] rd_ptr; // 5位宽
    
    // 定义存储器 (RAM)
    reg [WIDTH-1:0] mem [DEPTH-1:0];

    // 1. 写操作
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            wr_ptr <= 0;
        else if (wr_en && !full) begin
            mem[wr_ptr[ADDR_WIDTH-1:0]] <= data_in; // 写入低位地址
            wr_ptr <= wr_ptr + 1;
        end
    end

    // 2. 读操作
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rd_ptr <= 0;
            data_out <= 0;
        end else if (rd_en && !empty) begin
            data_out <= mem[rd_ptr[ADDR_WIDTH-1:0]]; // 读取低位地址
            rd_ptr <= rd_ptr + 1;
        end
    end

    // 3. 空满判断 (核心逻辑)
    assign empty = (wr_ptr == rd_ptr);
    
    // 满：最高位不同，其余位相同
    assign full  = (wr_ptr[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]) && 
                   (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);

endmodule
```

## 第三部分：异步 FIFO (Asynchronous FIFO) —— 大Boss

场景：读时钟 (rd_clk) 和写时钟 (wr_clk) 不同。例如 FPGA 采集数据 (100MHz) 发送给 PC (USB 60MHz)。

核心问题： 你不能直接比较 wr_ptr 和 rd_ptr，因为它们属于不同的“时空”。如果直接把写指针拉到读时钟域去比较，会产生亚稳态 (Metastability)，导致系统崩溃。

解决方案三部曲：

格雷码 (Gray Code)：指针必须用格雷码传输。

原因：二进制 011 变 100 有 3 位同时变化。如果不巧在变化的瞬间采样，可能采到 000 到 111 之间的任何乱码。格雷码每次只变 1 位，出错了最多也就是“这一个时钟没读到”，指针原地不动，不会跑飞。

两级同步器 (2-stage Synchronizer)：打两拍。

把对方的格雷码指针，用自己的时钟打两拍，消除亚稳态。

悲观策略：

判满：在写时钟域判断。需要把读指针同步过来。就算读指针因为同步延迟了还没更新，导致我以为满了（其实刚读走一个），这也只是晚一点写入，数据是安全的。

判空：在读时钟域判断。需要把写指针同步过来。

异步 FIFO 总体架构图解

写时钟域 (wr_clk)                      读时钟域 (rd_clk)
[写指针(Bin)] --转Gray--> [写指针(Gray)] ==================> [两级DFF同步] --> [同步后的写指针]
      |                                                                             |
      v                                                                             v
   [RAM] <====================================================================== 判空逻辑 (Empty?)
      ^                                                                             |
      |                                                                             |
   判满逻辑 (Full?) <=========================================================== [读指针(Gray)]
      ^                                                                             ^
      |                                                                             |
[同步后的读指针] <-- [两级DFF同步] <================== [读指针(Gray)] <--转Gray-- [读指针(Bin)]



#### 异步 FIFO 核心代码 (精简版)

为了彻底掌握，我们需要理解格雷码的判满条件。

- **格雷码判空**：完全相等 (`w_gray == r_gray`).

- **格雷码判满**：最高位不同，次高位不同，其余位相同。 (这是一个

  ```verilog
  module async_fifo #(
      parameter WIDTH = 8,
      parameter DEPTH = 16
  )(
      input wire wr_clk, wr_rst_n, wr_en,
      input wire [WIDTH-1:0] data_in,
      output wire full,
      
      input wire rd_clk, rd_rst_n, rd_en,
      output reg [WIDTH-1:0] data_out,
      output wire empty
  );
  
      localparam A_WIDTH = $clog2(DEPTH);
  
      // 指针定义 (需要二进制用来算地址，需要格雷码用来跨时钟)
      reg [A_WIDTH:0] wr_ptr_bin, wr_ptr_gray;
      reg [A_WIDTH:0] rd_ptr_bin, rd_ptr_gray;
      
      // 同步寄存器 (把对方的格雷码拿过来打两拍)
      reg [A_WIDTH:0] wr_ptr_gray_d1, wr_ptr_gray_d2; // 在读时钟域里的写指针
      reg [A_WIDTH:0] rd_ptr_gray_d1, rd_ptr_gray_d2; // 在写时钟域里的读指针
  
      // RAM (双端口)
      reg [WIDTH-1:0] mem [DEPTH-1:0];
  
      // ==============================================
      // 1. 写时钟域 (Write Domain)
      // ==============================================
      
      // 二进制转格雷码公式: (bin >> 1) ^ bin
      wire [A_WIDTH:0] wr_ptr_gray_next = (wr_ptr_bin + 1) ^ ((wr_ptr_bin + 1) >> 1);
  
      always @(posedge wr_clk or negedge wr_rst_n) begin
          if (!wr_rst_n) begin
              wr_ptr_bin  <= 0;
              wr_ptr_gray <= 0;
          end else if (wr_en && !full) begin
              mem[wr_ptr_bin[A_WIDTH-1:0]] <= data_in;
              wr_ptr_bin  <= wr_ptr_bin + 1;
              wr_ptr_gray <= wr_ptr_gray_next; // 更新格雷码
          end
      end
  
      // 把读指针同步过来 (Sync Read Ptr to Write Domain)
      always @(posedge wr_clk or negedge wr_rst_n) begin
          if (!wr_rst_n) begin
              rd_ptr_gray_d1 <= 0;
              rd_ptr_gray_d2 <= 0;
          end else begin
              rd_ptr_gray_d1 <= rd_ptr_gray;    // 第一拍
              rd_ptr_gray_d2 <= rd_ptr_gray_d1; // 第二拍 (用这个做判断)
          end
      end
  
      // 判满条件 (格雷码)：最高位不同，次高位不同，剩余位相同
      assign full = (wr_ptr_gray == {~rd_ptr_gray_d2[A_WIDTH:A_WIDTH-1], rd_ptr_gray_d2[A_WIDTH-2:0]});
  
      // ==============================================
      // 2. 读时钟域 (Read Domain)
      // ==============================================
      
      wire [A_WIDTH:0] rd_ptr_gray_next = (rd_ptr_bin + 1) ^ ((rd_ptr_bin + 1) >> 1);
  
      always @(posedge rd_clk or negedge rd_rst_n) begin
          if (!rd_rst_n) begin
              rd_ptr_bin  <= 0;
              rd_ptr_gray <= 0;
              // data_out <= 0; // 可选复位
          end else if (rd_en && !empty) begin
              data_out    <= mem[rd_ptr_bin[A_WIDTH-1:0]];
              rd_ptr_bin  <= rd_ptr_bin + 1;
              rd_ptr_gray <= rd_ptr_gray_next;
          end
      end
  
      // 把写指针同步过来 (Sync Write Ptr to Read Domain)
      always @(posedge rd_clk or negedge rd_rst_n) begin
          if (!rd_rst_n) begin
              wr_ptr_gray_d1 <= 0;
              wr_ptr_gray_d2 <= 0;
          end else begin
              wr_ptr_gray_d1 <= wr_ptr_gray;
              wr_ptr_gray_d2 <= wr_ptr_gray_d1;
          end
      end
  
      // 判空条件 (格雷码)：完全相同
      assign empty = (rd_ptr_gray == wr_ptr_gray_d2);
  
  endmodule
  
  ```



## 第四部分：总结与避坑

1**为什么异步 FIFO 必须深度是 2 的幂？** (`2^n`)

- 因为这能让二进制指针自然溢出（从 `111` 变回 `000`），配合格雷码的连续性。如果是深度 10，二进制跳变不规则，格雷码就会断层，导致出错。

**延迟效应**：

- 因为有两级同步器，状态标志是**有延迟的**。

- *Empty 信号*：写指针同步过来需要时间。可能已经写入数据了，但 Empty 还没拉低。这没关系（本来就是空的，多空一会儿没事）。

- *Full 信号*：读指针同步过来需要时间。可能已经读走数据了，但 Full 还没拉低。这也没关系（只是暂时不能写，不会覆盖数据）。

  

彻底掌握异步 FIFO 最好的方法是**仿真**。

```verilog
`timescale 1ns / 1ps

module tb_async_fifo;

    // --- 1. 参数定义 ---
    parameter WIDTH = 8;
    parameter DEPTH = 16; // 深度16

    // --- 2. 信号定义 ---
    // 写时钟域
    reg wr_clk;
    reg wr_rst_n;
    reg wr_en;
    reg [WIDTH-1:0] data_in;
    wire full;

    // 读时钟域
    reg rd_clk;
    reg rd_rst_n;
    reg rd_en;
    wire [WIDTH-1:0] data_out;
    wire empty;

    // --- 3. 实例化 DUT (Device Under Test) ---
    async_fifo #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) u_fifo (
        .wr_clk(wr_clk), .wr_rst_n(wr_rst_n), .wr_en(wr_en), .data_in(data_in), .full(full),
        .rd_clk(rd_clk), .rd_rst_n(rd_rst_n), .rd_en(rd_en), .data_out(data_out), .empty(empty)
    );

    // --- 4. 时钟生成 (关键点) ---
    // 写时钟：100MHz (周期 10ns)
    initial wr_clk = 0;
    always #5 wr_clk = ~wr_clk; 

    // 读时钟：40MHz (周期 25ns) -> 读得慢，容易满
    initial rd_clk = 0;
    always #12.5 rd_clk = ~rd_clk;

    // --- 5. 辅助任务 (让主代码更干净) ---
    
    // 任务：写入一个数据
    task write_data(input [WIDTH-1:0] val);
        begin
            @(posedge wr_clk); // 等待写时钟上升沿
            if (!full) begin
                wr_en <= 1'b1;
                data_in <= val;
            end else begin
                $display("Warning: FIFO is Full, skipped write %d", val);
                wr_en <= 1'b0;
            end
            @(posedge wr_clk); // 保持一个周期
            wr_en <= 1'b0;
        end
    endtask

    // 任务：读取一个数据
    task read_data();
        begin
            @(posedge rd_clk); // 等待读时钟上升沿
            if (!empty) begin
                rd_en <= 1'b1;
            end else begin
                $display("Warning: FIFO is Empty, skipped read");
                rd_en <= 1'b0;
            end
            @(posedge rd_clk);
            rd_en <= 1'b0;
        end
    endtask

    // --- 6. 主测试流程 ---
    integer i;
    
    initial begin
        // A. 初始化
        wr_rst_n = 0; rd_rst_n = 0;
        wr_en = 0; rd_en = 0; data_in = 0;
        
        // B. 释放复位 (先放一段时间)
        #100;
        wr_rst_n = 1; rd_rst_n = 1;
        #50;
        $display("--- Simulation Start ---");

        // C. 场景一：连续写入，直到写满 (Write until Full)
        $display("Step 1: Burst Write (Filling FIFO)");
        // 深度是16，我们尝试写18个数据，看看后两个会不会被丢弃，以及full信号表现
        for (i = 0; i < 18; i = i + 1) begin
            write_data(i); 
            // 这里不加延时，尽量快速连续写入
        end
        
        #100; // 休息一下

        // D. 场景二：连续读取，直到读空 (Read until Empty)
        $display("Step 2: Burst Read (Emptying FIFO)");
        for (i = 0; i < 18; i = i + 1) begin
            read_data();
        end

        #100;

        // E. 场景三：同时读写 (Concurrent Read/Write)
        $display("Step 3: Concurrent Write and Read");
        fork 
            // 使用 fork-join 并行执行两个块
            begin
                repeat(10) write_data($random);
            end
            begin
                #20; // 稍微晚一点开始读
                repeat(10) read_data();
            end
        join

        #200;
        $display("--- Simulation Done ---");
        $stop;
    end

endmodule
```

### 2. 仿真时你要观察的 3 个关键点

当你打开波形窗口 (Waveform Viewer) 时，不要只看数据对不对，要盯着这三个现象看，这才是异步 FIFO 的精髓：

#### ① Full 信号的产生 (Step 1)

- **现象**：你会看到 `wr_ptr` 一直在增加。当写进第 16 个数据时，`full` 信号会变高。
- **关键**：此时你再尝试写入（第 17、18 个数据），`wr_ptr` 应该**停止不动**，数据不会被覆盖。这是代码中 `if (wr_en && !full)` 的功劳。

#### ② Empty 信号的“滞后”消除 (Step 2)

- **现象**：当你开始读取数据时，`data_out` 会依次变化。当读完最后一个数据，`empty` 会变高。
- **注意**：看波形细节！在 `empty` 拉高的一瞬间，`rd_ptr` 追上了 `wr_ptr`。

#### ③ 标志位的延迟 (重点！面试考点)

- **Full 的解除**：
  - 假设 FIFO 满了 (`Full=1`)。
  - 这时，读时钟那边读取了一个数据 (`rd_en=1`)。
  - **问题**：`Full` 信号会立刻变低吗？
  - **观察**：**不会！** 它会延迟几个 `wr_clk` 周期。
  - **原因**：读指针 (`rd_ptr`) 需要经过“两级同步器”才能传到写时钟域。在传过来之前，写逻辑还以为 FIFO 是满的。
  - **结论**：这就是“悲观”设计。明明有空位了，但我还是显示满，不让你写。这很安全，不会溢出，只是稍微牺牲了一点吞吐量。