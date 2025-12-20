vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_8
vlib modelsim_lib/msim/processing_system7_vip_v1_0_10
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/v_tc_v6_2_1
vlib modelsim_lib/msim/v_tc_v6_1_13
vlib modelsim_lib/msim/v_vid_in_axi4s_v4_0_9
vlib modelsim_lib/msim/v_axi4s_vid_out_v4_0_11
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_22
vlib modelsim_lib/msim/fifo_generator_v13_2_5
vlib modelsim_lib/msim/axi_data_fifo_v2_1_21
vlib modelsim_lib/msim/axi_crossbar_v2_1_23
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/lib_fifo_v1_0_14
vlib modelsim_lib/msim/blk_mem_gen_v8_4_4
vlib modelsim_lib/msim/lib_bmg_v1_0_13
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/axi_datamover_v5_1_24
vlib modelsim_lib/msim/axi_vdma_v6_3_10
vlib modelsim_lib/msim/axis_infrastructure_v1_1_0
vlib modelsim_lib/msim/axis_register_slice_v1_1_22
vlib modelsim_lib/msim/axis_subset_converter_v1_1_22
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_22

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 modelsim_lib/msim/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 modelsim_lib/msim/processing_system7_vip_v1_0_10
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap v_tc_v6_2_1 modelsim_lib/msim/v_tc_v6_2_1
vmap v_tc_v6_1_13 modelsim_lib/msim/v_tc_v6_1_13
vmap v_vid_in_axi4s_v4_0_9 modelsim_lib/msim/v_vid_in_axi4s_v4_0_9
vmap v_axi4s_vid_out_v4_0_11 modelsim_lib/msim/v_axi4s_vid_out_v4_0_11
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_22 modelsim_lib/msim/axi_register_slice_v2_1_22
vmap fifo_generator_v13_2_5 modelsim_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 modelsim_lib/msim/axi_data_fifo_v2_1_21
vmap axi_crossbar_v2_1_23 modelsim_lib/msim/axi_crossbar_v2_1_23
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap lib_fifo_v1_0_14 modelsim_lib/msim/lib_fifo_v1_0_14
vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4
vmap lib_bmg_v1_0_13 modelsim_lib/msim/lib_bmg_v1_0_13
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_24 modelsim_lib/msim/axi_datamover_v5_1_24
vmap axi_vdma_v6_3_10 modelsim_lib/msim/axi_vdma_v6_3_10
vmap axis_infrastructure_v1_1_0 modelsim_lib/msim/axis_infrastructure_v1_1_0
vmap axis_register_slice_v1_1_22 modelsim_lib/msim/axis_register_slice_v1_1_22
vmap axis_subset_converter_v1_1_22 modelsim_lib/msim/axis_subset_converter_v1_1_22
vmap axi_protocol_converter_v2_1_22 modelsim_lib/msim/axi_protocol_converter_v2_1_22

vlog -work xilinx_vip  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xilinx_vip "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/ov7670_capture/ip/ov7670_capture_processing_system7_0_0/sim/ov7670_capture_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work v_tc_v6_2_1  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/cd2e/hdl/v_tc_v6_2_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/ov7670_capture/ip/ov7670_capture_v_tc_0_0/sim/ov7670_capture_v_tc_0_0.vhd" \

vcom -work v_tc_v6_1_13  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/b92e/hdl/v_tc_v6_1_vh_rfs.vhd" \

vlog -work v_vid_in_axi4s_v4_0_9  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/b2aa/hdl/v_vid_in_axi4s_v4_0_vl_rfs.v" \

vlog -work v_axi4s_vid_out_v4_0_11  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/1a1e/hdl/v_axi4s_vid_out_v4_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/ov7670_capture/ip/ov7670_capture_v_axi4s_vid_out_0_0/sim/ov7670_capture_v_axi4s_vid_out_0_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/ClockGen.vhd" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/SyncAsync.vhd" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/SyncAsyncReset.vhd" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/DVI_Constants.vhd" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/OutputSERDES.vhd" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/TMDS_Encoder.vhd" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d57c/src/rgb2dvi.vhd" \
"../../../bd/ov7670_capture/ip/ov7670_capture_rgb2dvi_0_0/sim/ov7670_capture_rgb2dvi_0_0.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/ov7670_capture/ip/ov7670_capture_clk_wiz_0_0/ov7670_capture_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/ov7670_capture/ip/ov7670_capture_clk_wiz_0_0/ov7670_capture_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/ov7670_capture/ip/ov7670_capture_rst_ps7_0_100M_0/sim/ov7670_capture_rst_ps7_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_23  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/ov7670_capture/ip/ov7670_capture_xbar_0/sim/ov7670_capture_xbar_0.v" \

vcom -work lib_pkg_v1_0_2  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_fifo_v1_0_14  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \

vlog -work blk_mem_gen_v8_4_4  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vcom -work lib_bmg_v1_0_13  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/af67/hdl/lib_bmg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_24  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/4ab6/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vlog -work axi_vdma_v6_3_10  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl/axi_vdma_v6_3_rfs.v" \

vcom -work axi_vdma_v6_3_10  -93 \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl/axi_vdma_v6_3_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/ov7670_capture/ip/ov7670_capture_axi_vdma_0_3/sim/ov7670_capture_axi_vdma_0_3.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/ov7670_capture/ip/ov7670_capture_ov7670_driver_0_0/sim/ov7670_capture_ov7670_driver_0_0.v" \

vlog -work axis_infrastructure_v1_1_0  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_register_slice_v1_1_22  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ebcc/hdl/axis_register_slice_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tdata_ov7670_capture_axis_subset_converter_0_0.v" \
"../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tuser_ov7670_capture_axis_subset_converter_0_0.v" \
"../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tstrb_ov7670_capture_axis_subset_converter_0_0.v" \
"../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tkeep_ov7670_capture_axis_subset_converter_0_0.v" \
"../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tid_ov7670_capture_axis_subset_converter_0_0.v" \
"../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tdest_ov7670_capture_axis_subset_converter_0_0.v" \
"../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/tlast_ov7670_capture_axis_subset_converter_0_0.v" \

vlog -work axis_subset_converter_v1_1_22  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/69d9/hdl/axis_subset_converter_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/hdl/top_ov7670_capture_axis_subset_converter_0_0.v" \
"../../../bd/ov7670_capture/ip/ov7670_capture_axis_subset_converter_0_0/sim/ov7670_capture_axis_subset_converter_0_0.v" \

vlog -work axi_protocol_converter_v2_1_22  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/ec67/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/34f8/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/d0f7" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/7860/hdl" "+incdir+../../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ipshared/8713/hdl" "+incdir+D:/xilinx_down/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/ov7670_capture/ip/ov7670_capture_auto_pc_0/sim/ov7670_capture_auto_pc_0.v" \
"../../../bd/ov7670_capture/ip/ov7670_capture_auto_pc_1/sim/ov7670_capture_auto_pc_1.v" \
"../../../bd/ov7670_capture/sim/ov7670_capture.v" \

vlog -work xil_defaultlib \
"glbl.v"

