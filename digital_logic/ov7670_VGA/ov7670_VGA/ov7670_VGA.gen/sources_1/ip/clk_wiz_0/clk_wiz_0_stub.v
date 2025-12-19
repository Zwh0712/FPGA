// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Dec 18 16:20:32 2025
// Host        : zhaowenheng running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/FPGA/FPGA/digital_logic/ov7670_VGA/ov7670_VGA/ov7670_VGA.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_24m, clk_25m, reset, locked, sys_clk)
/* synthesis syn_black_box black_box_pad_pin="clk_24m,clk_25m,reset,locked,sys_clk" */;
  output clk_24m;
  output clk_25m;
  input reset;
  output locked;
  input sys_clk;
endmodule
