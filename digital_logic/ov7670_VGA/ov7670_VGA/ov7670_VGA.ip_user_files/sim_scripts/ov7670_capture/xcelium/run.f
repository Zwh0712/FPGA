-makelib xcelium_lib/xilinx_vip -sv \
  "D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_8 -sv \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_10 -sv \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/ov7670_capture/ip/ov7670_capture_processing_system7_0_0/sim/ov7670_capture_processing_system7_0_0.v" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/v_tc_v6_2_1 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/cd2e/hdl/v_tc_v6_2_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/ov7670_capture/ip/ov7670_capture_v_tc_0_0/sim/ov7670_capture_v_tc_0_0.vhd" \
-endlib
-makelib xcelium_lib/v_tc_v6_1_13 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/b92e/hdl/v_tc_v6_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/v_vid_in_axi4s_v4_0_9 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/b2aa/hdl/v_vid_in_axi4s_v4_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/v_axi4s_vid_out_v4_0_11 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/1a1e/hdl/v_axi4s_vid_out_v4_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/ov7670_capture/ip/ov7670_capture_v_axi4s_vid_out_0_0/sim/ov7670_capture_v_axi4s_vid_out_0_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/ClockGen.vhd" \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/SyncAsync.vhd" \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/SyncAsyncReset.vhd" \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/DVI_Constants.vhd" \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/OutputSERDES.vhd" \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/TMDS_Encoder.vhd" \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/rgb2dvi.vhd" \
  "../../../bd/ov7670_capture/ip/ov7670_capture_rgb2dvi_0_0/sim/ov7670_capture_rgb2dvi_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/ov7670_capture/ip/ov7670_capture_clk_wiz_0_0/ov7670_capture_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/ov7670_capture/ip/ov7670_capture_clk_wiz_0_0/ov7670_capture_clk_wiz_0_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/ov7670_capture/ip/ov7670_capture_rst_ps7_0_100M_0/sim/ov7670_capture_rst_ps7_0_100M_0.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_22 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_21 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_23 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/ov7670_capture/ip/ov7670_capture_xbar_0/sim/ov7670_capture_xbar_0.v" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_14 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/lib_bmg_v1_0_13 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/af67/hdl/lib_bmg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_datamover_v5_1_24 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/4ab6/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_vdma_v6_3_10 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl/axi_vdma_v6_3_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vdma_v6_3_10 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl/axi_vdma_v6_3_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/ov7670_capture/ip/ov7670_capture_axi_vdma_0_3/sim/ov7670_capture_axi_vdma_0_3.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/ov7670_capture/ip/ov7670_capture_ov7670_driver_0_0/sim/ov7670_capture_ov7670_driver_0_0.v" \
-endlib
-makelib xcelium_lib/axis_infrastructure_v1_1_0 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axis_register_slice_v1_1_22 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ebcc/hdl/axis_register_slice_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tdata_ov7670_capture_axis_subset_converter_0_0.v" \
  "../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tuser_ov7670_capture_axis_subset_converter_0_0.v" \
  "../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tstrb_ov7670_capture_axis_subset_converter_0_0.v" \
  "../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tkeep_ov7670_capture_axis_subset_converter_0_0.v" \
  "../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tid_ov7670_capture_axis_subset_converter_0_0.v" \
  "../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tdest_ov7670_capture_axis_subset_converter_0_0.v" \
  "../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tlast_ov7670_capture_axis_subset_converter_0_0.v" \
-endlib
-makelib xcelium_lib/axis_subset_converter_v1_1_22 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/69d9/hdl/axis_subset_converter_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/top_ov7670_capture_axis_subset_converter_0_0.v" \
  "../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/sim/ov7670_capture_axis_subset_converter_0_0.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_22 \
  "../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/ov7670_capture/ip/ov7670_capture_auto_pc_0/sim/ov7670_capture_auto_pc_0.v" \
  "../../../bd/ov7670_capture/ip/ov7670_capture_auto_pc_1/sim/ov7670_capture_auto_pc_1.v" \
  "../../../bd/ov7670_capture/sim/ov7670_capture.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

