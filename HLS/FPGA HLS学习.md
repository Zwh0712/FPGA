# FPGA HLS学习



## 简介

​	FPGA 设计中从底层向上一共存在着四种抽象层级，依次为：结构性的、RTL、行为性的和高层。

​	HLS 设计的主要输入是一个 C/C++/SystemC 设计，以及一个基于 C 的测试集（TestBench）。

	在对 HLS 设计进行综合之前我们要先对其进行“功能性验证”，也就是 C 仿真，其目的是验证 HLS
​	输入的 C/C++代码的功能是否正确。验证的方式就是在 TestBench 中调用 C 设计的函数，然后将其输出与“黄
金参考”进行比对，如果与黄金参考有差异就需要先对 C 设计进行修改调试。

​	综合过程结束后，可以在Xilinx HLS中进行C/RTL协同仿真，进一步验证综合得到的RTL设计的正确性。在这个过程中Xilinx HLS 会自动产生一个RTL设计提供输入，然后拿他的输出与预期的值做对比。C功能性验证与C/RTL协同仿真的的区别如下图所示：

![tu1](D:\FPGA\FPGA\HLS\photo\tu1.png)

​	原始测试集是用户输入的测试文件 TestBench。而右侧的。C/RTL 协同仿真所需的 RTL 测试集是由 Xilinx HLS 自动产生的。除了对功能进行验证，我们还要评估 RTL 设计的实现和性能。

## 接口综合

在HLS中，我所需要设计的主要有两个·方面：

​	1、设计顶层连接（也就是设计接口）

​		开发接口主要有三类

​			Clock and Reset Interface：时钟与复位接口是自动生成，不可修改的

​			Block Level Interface：块级接口可综合，只作用于顶层函数或者顶层函数的返回值（不作用于顶层函数的参数），该协议只有三种，分别是： ap_ctrl_hs、 ap_ctrl_none、 ap_ctrl_chain。

​			Port Level Interface：端口级接口可综合，数量较多，只作用于顶层函数的参数。				

​	2、设计要实现的算法（也就是设计想实现的功能）



## 接口描述

在 HLS (High-Level Synthesis) 开发中，理解接口（Interface）是将 C/C++ 代码成功转化为硬件 IP 的核心。HLS 工具（如 Xilinx Vitis HLS）的任务就是把软件函数翻译成硬件模块，而接口定义了外界（其他模块或 CPU）如何与这个硬件模块进行交互。

正如你所说，接口主要分为三类。虽然时钟和复位通常是自动生成的，但理解它们对于整个系统集成至关重要。

以下是这三类接口的详细技术解析：

------



### 1. Clock and Reset Interface (时钟与复位接口)



这是硬件电路运行的“心跳”和“起跑线”。

- **特点**：通常由 HLS 工具**自动添加**，不需要你在 C/C++ 代码的参数列表中显式声明。
- **ap_clk (Clock)**：系统时钟信号。所有寄存器的翻转、状态机的跳转都参考这个信号的上升沿。
- **ap_rst / ap_rst_n (Reset)**：复位信号。
  - 用于将 IP 内部的状态机和寄存器恢复到初始状态。
  - 可以在 HLS 设置中配置为**高电平有效 (Active High)** 或 **低电平有效 (Active Low, _n)**。
  - 也可以配置为同步复位或异步复位。

> **注意**：虽然你不能用 Pragma 改变它们的“协议”，但它们是综合后电路必不可少的物理端口。

------



### 2. Block Level Interface (块级接口)



**Block Level Interface** 控制的是**整个 IP 核（Function）的状态**。它决定了 IP 什么时候开始工作、什么时候结束、以及当前是否空闲。

在 Verilog 层面，这通常体现为一组握手信号。

#### 常见协议模式：

- ap_ctrl_hs (Handshake - 默认)

  这是最常用的模式，包含以下四个关键信号：

  - **`ap_start` (Input)**: CPU 或上游模块拉高此信号，告诉 IP “开始干活”。
  - **`ap_idle` (Output)**: 指示 IP 当前是否处于空闲状态（即还没开始干活，或者干完活了）。
  - **`ap_ready` (Output)**: 指示 IP 已经读入了输入数据，可以接受下一组新的输入（Pipeline 模式下很有用）。
  - **`ap_done` (Output)**: 指示 IP 已经完成了当前任务，输出结果有效。

- **`ap_ctrl_chain` (Chaining)**

  - 在 `ap_ctrl_hs` 的基础上增加了一个 `ap_continue` 输入信号。
  - **用途**：用于将多个 IP 级联起来。只有当下游模块说“我准备好接收了 (`ap_continue = 1`)”，当前模块才会完成并拉高 `ap_done`。这是实现模块间**反压 (Back-pressure)** 的关键。

- **`ap_ctrl_none` (No Control)**

  - 没有任何握手信号。
  - IP 上电后只要有数据就一直跑，或者只跑一次。通常用于不需要 CPU 干预的纯数据流处理模块。

- **`s_axilite` (AXI4-Lite Slave)**

  - **极度重要**。这会将上述的 `start`, `done`, `idle` 等信号映射到一个 AXI-Lite 寄存器空间中。
  - **场景**：当你使用 Zynq 或 MicroBlaze 时，CPU 可以通过写寄存器（地址偏移 0x00）来启动 IP，或者轮询寄存器来检查 IP 是否做完了。

------



### 3. Port Level Interface (端口级接口，端口较多，只作用于顶层函数的参数)



​	**Port Level Interface** 对应 C/C++ 函数中的**参数 (Arguments)** 和 **返回值 (Return)**。它决定了数据是如何进入和离开 IP 的。

​	HLS 会根据参数的数据类型（标量、数组、指针、结构体）和你的 `#pragma` 指令来决定具体的硬件协议。

#### A. 标量 (Scalars) & 传值调用

例如：`void func(int a, int b, int *c)` 中的 `a` 和 `b`。

- **`ap_none`**：
  - **硬件**：纯导线，没有握手信号。
  - **缺点**：IP 可能会读取到不稳定的数据（如果发送端在 IP 读取的瞬间改变了数据）。
  - **适用**：常量输入，或者你确信数据绝对稳定的情况。
- **`ap_stable`**：
  - 告诉 HLS 工具：“这个输入在 IP 运行期间不会变”。HLS 就不会给它加额外的寄存器或扇出优化。
  - **适用**：配置寄存器、模式选择开关。
- **`ap_vld` (Valid)**：
  - **硬件**：数据线 + 1 个 `valid` 信号。
  - **逻辑**：当 `valid` 为高时，IP 读取数据。
- **`ap_ack` (Acknowledge)**：
  - **硬件**：数据线 + 1 个 `ack` 信号。
  - **逻辑**：IP 读完数据后，给发送端回一个 `ack`。
- **`ap_hs` (Handshake)**：
  - `ap_vld` + `ap_ack` 的组合。最安全的双向握手。



#### B. 数组与指针 (Arrays & Pointers)

例如：`void func(int data[100])` 或 `void func(int *data)`。

​	**`ap_bram`**:

- **含义**：标准的块存储器接口。
- **信号**：包含地址(Addr)、片选(CE)、写使能(WE)、输入数据(Din)、输出数据(Dout)。
- **特点**：在 Vivado IP Integrator 里，这些信号会被打包成一根线，方便连接标准的 BRAM 控制器。

- **`ap_memory` (BRAM/RAM 接口)**
  - 这是默认生成的接口。
  - **硬件信号**：`addr` (地址), `ce` (片选), `we` (写使能), `d_i` (输入), `d_o` (输出)。
  - **场景**：IP 需要随机访问数据，适合连接 BRAM。
- **`ap_fifo` (FIFO 接口)**
  - **硬件信号**：`dout`, `empty_n`, `read` (读端) 或 `din`, `full_n`, `write` (写端)。
  - **场景**：数据是顺序进入、顺序处理的（流式处理）。HLS 此时不生成地址线，效率更高。
- **`m_axi` (AXI4 Master)**
  - **最强大也是最复杂的接口**。
  - **功能**：让 IP 具备 DMA 功能，可以直接去读取 DDR 内存。
  - **硬件**：生成全套 AXI4 总线信号（AR, R, AW, W, B 五个通道）。
  - **场景**：处理图像、大量数据搬运。通常结合 `memcpy` 使用。



#### C. AXI-Stream (`axis`)



- 针对 `hls::stream` 类型的数据。

- **硬件**：`TDATA`, `TVALID`, `TREADY`, `TLAST` (可选), `TKEEP` (可选)。

- **场景**：视频流处理、网络包处理。这是 FPGA 内部模块间高速传输的标准方式。

  

## 如何选择

在 HLS 代码中，我们通常使用 Pragma 来指定接口。这就好比你在画电路图时选择用什么连接器。

**一个典型的图像处理 IP 接口配置示例：**

C++

```c++
void image_filter(
    hls::stream<pix_t> &in_stream,   // 数据流输入 -> axis (AXI Stream)
    hls::stream<pix_t> &out_stream,  // 数据流输出 -> axis (AXI Stream)
    int threshold,                   // 阈值设置 -> s_axilite (CPU 写寄存器配置)
    int rows,                        // 图像行数 -> s_axilite
    int cols                         // 图像列数 -> s_axilite
) {
    // 定义 Block Level 接口为 s_axilite，这样 CPU 可以控制 start/stop
    #pragma HLS INTERFACE s_axilite port=return bundle=control

    // 定义数据端口
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream

    // 定义参数端口映射到 AXI Lite 寄存器
    #pragma HLS INTERFACE s_axilite port=threshold bundle=control
    #pragma HLS INTERFACE s_axilite port=rows bundle=control
    #pragma HLS INTERFACE s_axilite port=cols bundle=control

    // ... 算法代码 ...
}
```

- **Block Level (return)**: 决定了“谁”来控制 IP 的启动（通常是 CPU 或者是自动运行）。
- **Port Level (args)**: 决定了数据是“流进来”(Stream)、“从内存搬过来”(Master AXI)、还是“存在片上内存里被读”(BRAM)。

## 简单示例

一个简单的c设计的顶层函数

```c
void find_average_of_best_X( int *average, int samples[8],int X)
{
		//主题函数（声明，子函数调用等等。）
}
```

三个变量分别被综合成了两个输入、以及一个输出，而具体输入输出的控制还要根据所用的协议来具体观察。

![](D:\FPGA\FPGA\HLS\photo\tu3.png)

​	图中为是函数 find_average_of_best_X()经 HLS 综合出来的完整的 RTL 模块的接口图。从图中可以看到由函数的三个参数所综合出来的接口分别拥有了各自的协议，如 ap_memory 协议、ap_none 协议和 ap_vld协议。同时模块还多出来了一些端口，如 ap_clk 和 ap_rst 等，它们使用的是 ap_ctrl_hs 协议。

## 	算法综合

​	算法综合主要关注设计的功能，设计所期望的行为，它是由C/C++所描述的。

### 	算法综合主要包括三个阶段，依次是：

#### 	1.解析出数据通路和控制电路；

​		1.综合的第一步,读取C/C++代码，将数据分离，识别所有数据运算以及数据传输。

​		例如：代码里有 c = a + b，工具就知道需要一个“加法器”。代码里有数组 arr[i]，工具就知道需要“存储单元”和“地址线”。

​		2.控制电路是大脑。用来识别程序的流程控制结构，从而转换为有限状态机，再有状态机指挥控制电路。

#### 	2.调度与绑定；

​		1.调度解决了电路时序的快慢以及消耗资源的大小。将每一个操作分派到具体的时钟周期中。

​		2.决定因素为FPGA的型号以及想要得到的最终优化目标。

举个例子：

```c
x = a + b; // 第1周期
y = c + d; // 第2周期
```

不优化：用两个加法器

优化：用一个加法器，第一个周期算x,第二个周期算y。

#### 	3.优化；

​	前两个阶段主要为了生成一个能用的电路，而这一阶段就是为了让电路“好用”这就依赖我们写的#pragam指令

​	吞吐量优先 (Throughput / Pipelining)：

​		手段：流水线 (Pipelining)。虽然做完一个任务还需要那么多时间，但我让任务源源不断地进来。

​	并行度优先 (Latency / Unrolling)：

​		手段：循环展开 (Loop Unrolling) 和 数组划分 (Array Partitioning)。直接增加硬件资源，以此换取速度。

#### 	总结

| **阶段**                                 | **核心任务**                                         | **输出结果**                | **对应的设计问题**                                 |
| ---------------------------------------- | ---------------------------------------------------- | --------------------------- | -------------------------------------------------- |
| **1. 解析 (Extraction)**                 | 读代码，分清运算(Data)和逻辑(Control)                | CDFG (控制数据流图)         | 我的代码里有哪些加减乘除？有哪些 IF/FOR？          |
| **2. 调度与绑定 (Scheduling & Binding)** | **调度**：定时间 (Cycle) **绑定**：定硬件 (Resource) | 状态机 (FSM) + 数据通路网表 | 这些运算分几个时钟周期跑完？ 我要用几个 DSP 模块？ |
| **3. 优化 (Optimization)**               | 根据约束调整结构 (流水线、展开)                      | 优化后的 RTL 模型           | 怎么让吞吐率 (II) 达到 1？ 怎么让延时更低？        |

![tu4](D:\FPGA\FPGA\HLS\photo\tu4.png)

## HLS库

	Xilinx HLS 中包含了一系列的 C 库（包括 C 和 C++），方便对一些常用的硬件结构或功能使用 C/C++

进行建模，并且能够综合成 RTL。在 Vitis HLS 中提供的 C 库有下面几种类型：

### 1、任意精度数据类型库：

​	任意精度的数据类型使 C++数据类型位宽有更小的变量，从而提高性能并减少硬件面积。

### 2、HLS Stream 库：

​	用于建模和编译流数据结构，在代码中包含库头文件，就可以在设计中使用每个C库。

### 3、HLS Math 数学库：

​	用于指定标准数学运算，用于合成 RTL 并在 Xilinx 设备上实现。广泛支持标准C(math.h)和 C++(cmath.h)数学库的综合。

包含功能有：abs，atan，atanf，atan2，atan2，ceil,ceilf，copysign，copysignf，cos，cosf，coshf，expf，fabs，fabsf，floorf，fmax，fmin，logf，fpclassify，isfinite，isinf，isnan，isnormal，log，log10，modf，modff，recip，recipf，round，rsqrt，rsqrtf，1/sqrt，signbit，sin，sincos，sincosf，sinf,sinhf，sqrt，tan，tanf，trunc。

### 4、HLS IP 库：

| **库头文件 (.h)**    | **功能描述 (Function)**                      | **对应的底层硬件 (Underlying Hardware)** | **核心优势 (Why use it?)**                                   |
| -------------------- | -------------------------------------------- | ---------------------------------------- | ------------------------------------------------------------ |
| **`hls_fft.h`**      | **快速傅里叶变换** 将时域信号转为频域信号。  | **Xilinx FFT LogiCORE IP**               | 调用 FPGA 内部专用硬件核，比手写 C 循环快得多，且精度更高。  |
| **`hls_fir.h`**      | **FIR 滤波器** 数字信号滤波（如去噪）。      | **Xilinx FIR Compiler IP**               | 自动利用 FPGA 的 **DSP48**（乘加器）资源，实现高效流水线处理。 |
| **`hls_dds.h`**      | **DDS 信号发生器** 产生高精度的正弦/余弦波。 | **Xilinx DDS Compiler IP**               | 利用查找表 (LUT) 或 CORDIC 算法生成波形，避免消耗大量逻辑资源去算 `sin()`。 |
| **`ap_shift_reg.h`** | **移位寄存器** 实现数据的延迟队列。          | **Xilinx SRL 原语** (Shift Register LUT) | **极度省面积**。强制使用 LUT（查找表）来存数据，而不是浪费宝贵的触发器 (Flip-Flops)。 |

### 5、HLS 线性代数库：

​	cholesky，cholesky_inverse，matrix_multiply，qrf，qr_inverse，svd

### 6、HLS DSP

​	atan2，awgn，cmpy，convolution_encoder，nco，qam_demod，qam_mod，sqrt，viterbi_decoder，(hls_dsp.h)。



## HLS入门示例
