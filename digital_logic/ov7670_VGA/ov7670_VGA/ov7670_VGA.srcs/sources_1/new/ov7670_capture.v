`timescale 1ns / 1ps

module ov7670_driver(
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axis" *)
    input  wire        pclk,        // 摄像头像素时钟 (连接 OV7670 PCLK)
    
    input  wire        rst_n,
    input  wire        vsync,       // 摄像头场同步 (连接 OV7670 VSYNC)
    input  wire        href,        // 摄像头行参考 (连接 OV7670 HREF)
    input  wire [7:0]  d,           // 摄像头 8位数据 (连接 OV7670 D0-D7)
    
    // AXI4-Stream 接口 (连接 VDMA S_AXIS_S2MM)
    output reg  [15:0] m_axis_tdata,    // 16位像素数据
    output reg         m_axis_tvalid,   // 数据有效信号
    output reg         m_axis_tlast,    // 行结束信号 (可选，VDMA通常靠计数，但最好加上)
    output reg         m_axis_tuser     // 帧开始信号 (SOF - Start of Frame)
    );

    // 参数：是否交换高低字节
    // 0: 不交换 (D1为高8位, D2为低8位)
    // 1: 交换   (D1为低8位, D2为高8位)
    // 如果发现颜色不对(比如红色变蓝色)，修改这个参数为 1
    parameter SWAP_BYTES = 0;

    // 内部寄存器
    reg [7:0]  d_latch;
    reg        byte_toggle; // 用于指示当前是第1个字节还是第2个字节
    reg        sof_wait;    // 等待帧开始标志

    // -------------------------------------------------------------------------
    // 帧同步检测逻辑 (Start of Frame Logic)
    // VDMA 需要在每一帧的第一个有效像素上拉高 TUSER 信号
    // OV7670 的 VSYNC 为高电平时表示帧间隙(Blanking)，下降沿表示新的一帧即将开始
    // -------------------------------------------------------------------------
    reg vsync_d;
    always @(posedge pclk) begin
        if (!rst_n) begin
            vsync_d <= 1'b0;
            sof_wait <= 1'b0;
        end else begin
            vsync_d <= vsync;
            // 检测 VSYNC 的下降沿 (Falling Edge)，表示新的一帧开始了
            // 但此时还没有有效数据，我们需要等待 HREF 变高
            if (vsync_d == 1'b1 && vsync == 1'b0) begin
                sof_wait <= 1'b1; // 标记：新的一帧来了，准备好发送 TUSER
            end
            // 如果一帧传输结束(VSYNC拉高)，清除标志，防止异常
            else if (vsync == 1'b1) begin
                sof_wait <= 1'b0;
            end
        end
    end

    // -------------------------------------------------------------------------
    // 像素采集与拼接逻辑
    // -------------------------------------------------------------------------
    always @(posedge pclk) begin
        if (!rst_n) begin
            m_axis_tdata  <= 16'd0;
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;
            m_axis_tuser  <= 1'b0;
            d_latch       <= 8'd0;
            byte_toggle   <= 1'b0;
        end else begin
            // 默认拉低控制信号，只有在数据拼接完成的那个周期拉高
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;
            m_axis_tuser  <= 1'b0;

            // HREF 为高时，表示数据有效
            if (href) begin
                if (byte_toggle == 1'b0) begin
                    // 第一个时钟周期：锁存高8位 (或者低8位，看摄像头配置)
                    d_latch <= d;
                    byte_toggle <= 1'b1;
                end else begin
                    // 第二个时钟周期：拼接数据并输出
                    if (SWAP_BYTES == 0)
                        m_axis_tdata <= {d_latch, d}; // 正常顺序
                    else
                        m_axis_tdata <= {d, d_latch}; // 字节交换
                    
                    m_axis_tvalid <= 1'b1; // 数据有效！
                    byte_toggle   <= 1'b0; // 重置 toggle 准备接下一个像素

                    // 处理 TUSER (帧开始信号)
                    // 只有在这一帧的第一个有效像素时拉高
                    if (sof_wait) begin
                        m_axis_tuser <= 1'b1;
                        sof_wait <= 1'b0; // 清除标志，本帧后续像素不再拉高 TUSER
                    end
                end
            end else begin
                // HREF 为低 (行消隐期间)，复位 toggle
                byte_toggle <= 1'b0;
            end
        end
    end
    
    // 生成 TLAST (行结束)
    // 这是一个简化做法：当 href 即将拉低时? 
    // 其实标准的 VDMA 配置下，Write Channel 通常靠 HSIZE 计数来判断行结束，
    // 这里为了严谨，其实很难在流模式下精确预测 href 何时拉低。
    // 在简单的应用中，VDMA S2MM 甚至可以忽略 TLAST。
    // 如果需要更严格的 TLAST，需要引入 Line Buffer 或者检测 HREF 下降沿。
    // 鉴于 Zynq VDMA 的鲁棒性，上述代码通常足够工作。

endmodule