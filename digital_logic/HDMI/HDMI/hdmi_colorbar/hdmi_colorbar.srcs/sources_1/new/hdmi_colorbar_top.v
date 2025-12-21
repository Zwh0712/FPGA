`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/21 13:08:18
// Design Name: 
// Module Name: hdmi_colorbar_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hdmi_colorbar_top(
    input           sys_clk,
    input           sys_rst_n,
    output          tmds_clk_p,       //TMDS 时钟通道
    output          tmds_clk_n,
    output  [2:0]   tmds_data_p,       //TMDS数据通道
    output  [2:0]   tmds_data_n,
    output          tmds_oen        //TMDS输出使能 
    );
   
//wire define
wire        pixel_clk;
wire        pixel_clk_5x;
wire        clk_locked;

wire [10:0] pixel_xpos_w;
wire [10:0] pixel_ypos_vs;
wire [23:0] pixel_data_w;

wire        video_hs;
wire        video_vs;
wire        video_de;
wire [23:0] video_rgb;

//例化MMCM/PLL  IP核

clk_wiz_0   clk_wiz_0(
    .clk_in1        (sys_clk),          //像素时钟
    .clk_out1       (pixel_clk),        //5倍像素时钟
    .clk_out2       (pixel_clk_5x),
    
    .reset          (~sys_rst_n),
    .locked         (clk_locked)
);

//例化视频显示驱动模块

video_drver  u_video_driver(
    .pixel_clk      (pixel_clk),
    .sys_rst_n      (sys_rst_n)
    
);

endmodule
