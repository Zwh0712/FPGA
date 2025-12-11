# 时钟和复位
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { sys_clk }];
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports { sys_clk }];
set_property -dict { PACKAGE_PIN N16 IOSTANDARD LVCMOS33 } [get_ports { sys_rst_n }];

# 按键 KEY1
set_property -dict { PACKAGE_PIN L14 IOSTANDARD LVCMOS33 } [get_ports { key_in }];

# ------------------------------------------------------------
# 数码管位选 (Digit Select) - 你的杜邦线接哪里了？
# ------------------------------------------------------------
# 假设 seg_sel[0] 接的是模块上的 DIG4 (个位)
set_property -dict { PACKAGE_PIN M19 IOSTANDARD LVCMOS33 } [get_ports { seg_sel[0] }];
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { seg_sel[1] }];
set_property -dict { PACKAGE_PIN V20 IOSTANDARD LVCMOS33 } [get_ports { seg_sel[2] }];
set_property -dict { PACKAGE_PIN W18 IOSTANDARD LVCMOS33 } [get_ports { seg_sel[3] }];

# ------------------------------------------------------------
# 数码管段选 (Segment) - 你的杜邦线接哪里了？
# ------------------------------------------------------------
set_property -dict { PACKAGE_PIN U20 IOSTANDARD LVCMOS33 } [get_ports { seg_led[0] }]; # 对应 a
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports { seg_led[1] }]; # 对应 b
set_property -dict { PACKAGE_PIN P18 IOSTANDARD LVCMOS33 } [get_ports { seg_led[2] }]; # 对应 c
set_property -dict { PACKAGE_PIN T20 IOSTANDARD LVCMOS33 } [get_ports { seg_led[3] }]; # 对应 d
set_property -dict { PACKAGE_PIN M20 IOSTANDARD LVCMOS33 } [get_ports { seg_led[4] }]; # 对应 e
set_property -dict { PACKAGE_PIN N18 IOSTANDARD LVCMOS33 } [get_ports { seg_led[5] }]; # 对应 f
set_property -dict { PACKAGE_PIN W20 IOSTANDARD LVCMOS33 } [get_ports { seg_led[6] }]; # 对应 g
set_property -dict { PACKAGE_PIN P19 IOSTANDARD LVCMOS33 } [get_ports { seg_led[7] }]; # 对应 dp