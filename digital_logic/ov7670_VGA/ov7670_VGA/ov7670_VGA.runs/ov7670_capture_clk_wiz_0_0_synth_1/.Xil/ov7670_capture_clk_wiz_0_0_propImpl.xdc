set_property SRC_FILE_INFO {cfile:d:/FPGA/FPGA/digital_logic/ov7670_VGA/ov7670_VGA/ov7670_VGA.gen/sources_1/bd/ov7670_capture/ip/ov7670_capture_clk_wiz_0_0/ov7670_capture_clk_wiz_0_0.xdc rfile:../../../ov7670_VGA.gen/sources_1/bd/ov7670_capture/ip/ov7670_capture_clk_wiz_0_0/ov7670_capture_clk_wiz_0_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
