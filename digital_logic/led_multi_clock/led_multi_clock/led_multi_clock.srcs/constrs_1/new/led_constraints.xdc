# ----------------------------------------------------------------------------
# 时钟约束 (Clock Constraints)
# ----------------------------------------------------------------------------
# 绑定 U18 引脚到 sys_clk 端口，电平标准 3.3V
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports sys_clk]

# 定义时钟频率为 50MHz (周期 20ns)
create_clock -period 20.000 -name sys_clk_pin -waveform {0.000 10.000} -add [get_ports sys_clk]


# ----------------------------------------------------------------------------
# 复位约束 (Reset Constraints) - 使用 KEY0
# ----------------------------------------------------------------------------
# 绑定 N15 引脚到 sys_rst_n 端口
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports sys_rst_n]


# ----------------------------------------------------------------------------
# LED约束 (LED Constraints)
# ----------------------------------------------------------------------------
# 绑定 H15 到 led[0]
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {led[0]}]

# 绑定 L15 到 led[1]
set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports {led[1]}]

