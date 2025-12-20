`timescale 1ns / 1ps

module ov7670_driver(
    // 强制声明：这是一个时钟接口
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 pclk CLK" *)
    // 强制声明：这个时钟关联 m_axis 总线
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axis" *)
    input  wire        pclk,        
    
    input  wire        rst_n,
    // ... 下面不用动 ...
    input  wire        vsync,       // 摄像头场同步 (连接 OV7670 VSYNC)
    input  wire        href,        // 摄像头行参考 (连接 OV7670 HREF)
    input  wire [7:0]  d,           // 摄像头 8位数据 (连接 OV7670 D0-D7)
    
    // AXI4-Stream 接口 (连接 VDMA S_AXIS_S2MM)
    output reg  [15:0] m_axis_tdata,    // 16位像素数据
    output reg         m_axis_tvalid,   // 数据有效信号
    output reg         m_axis_tlast,    // 行结束信号 (这里给0，VDMA靠计数)
    output reg         m_axis_tuser     // 帧开始信号 (SOF - Start of Frame)
    );

    // 参数：是否交换高低字节
    parameter SWAP_BYTES = 0;

    // 内部寄存器
    reg [7:0]  d_latch;
    reg        byte_toggle; 
    reg        sof_wait;    // 帧同步标志

    // -------------------------------------------------------------------------
    // 逻辑一：帧同步标志控制 (只在这里修改 sof_wait)
    // -------------------------------------------------------------------------
    reg vsync_d;
    always @(posedge pclk) begin
        if (!rst_n) begin
            vsync_d  <= 1'b0;
            sof_wait <= 1'b0;
        end else begin
            vsync_d <= vsync;
            
            // 1. 检测 VSYNC 下降沿：新的一帧开始了 -> 置位标志
            if (vsync_d == 1'b1 && vsync == 1'b0) begin
                sof_wait <= 1'b1; 
            end
            
            // 2. 只有当确实发送了 TUSER 后，才清除标志
            // 注意：我们通过检测 tvalid 和 tuser 同时为高来判断是否发送成功
            else if (m_axis_tvalid && m_axis_tuser) begin
                sof_wait <= 1'b0;
            end
            
            // 3. 异常保护：如果帧结束了还没发出去，也强制清除
            else if (vsync == 1'b1) begin
                sof_wait <= 1'b0;
            end
        end
    end

    // -------------------------------------------------------------------------
    // 逻辑二：数据采集与输出 (只读取 sof_wait，绝不修改它)
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
            // 默认拉低 Valid 和 User
            m_axis_tvalid <= 1'b0;
            m_axis_tuser  <= 1'b0;

            if (href) begin
                if (byte_toggle == 1'b0) begin
                    // 第1个周期：锁存数据
                    d_latch <= d;
                    byte_toggle <= 1'b1;
                end else begin
                    // 第2个周期：拼接输出
                    if (SWAP_BYTES == 0)
                        m_axis_tdata <= {d_latch, d};
                    else
                        m_axis_tdata <= {d, d_latch};
                    
                    m_axis_tvalid <= 1'b1; // 输出有效
                    byte_toggle   <= 1'b0;

                    // 这里的关键修改：只读取 sof_wait
                    // 如果标志位是1，说明这是本帧的第一个像素，发送 TUSER
                    if (sof_wait) begin
                        m_axis_tuser <= 1'b1;
                    end
                end
            end else begin
                byte_toggle <= 1'b0;
            end
        end
    end

endmodule