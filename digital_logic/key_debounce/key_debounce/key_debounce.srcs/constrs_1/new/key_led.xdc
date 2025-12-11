# 时钟和复位 (同上一个实验)
set_property -dict { PACKAGE_PIN U18  IOSTANDARD LVCMOS33 } [get_ports { sys_clk }];
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports { sys_clk }];
set_property -dict { PACKAGE_PIN N16  IOSTANDARD LVCMOS33 } [get_ports { sys_rst_n }];

# ----------------------------------------------------------------------------
# 新增：输入按键 KEY1
# ----------------------------------------------------------------------------
# 只有在原理图确认 KEY1 是 N16 后才写这一行！
set_property -dict { PACKAGE_PIN L14  IOSTANDARD LVCMOS33 } [get_ports { key_in_raw }];

# ----------------------------------------------------------------------------
# 输出 LED
# ----------------------------------------------------------------------------
set_property -dict { PACKAGE_PIN H15  IOSTANDARD LVCMOS33 } [get_ports { led_out }];