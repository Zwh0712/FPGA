# ----------------------------------------------------------------------------
# HDMI 输出引脚约束 (ATK-DF7010)
# ----------------------------------------------------------------------------
# HDMI 时钟 -> U13
set_property PACKAGE_PIN U13 [get_ports TMDS_0_clk_p]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_0_clk_p]

# HDMI 数据 (Blue) -> V13
set_property PACKAGE_PIN V13 [get_ports {TMDS_0_data_p[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_0_data_p[0]}]

# HDMI 数据 (Green) -> V15
set_property PACKAGE_PIN V15 [get_ports {TMDS_0_data_p[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_0_data_p[1]}]

# HDMI 数据 (Red) -> N18
set_property PACKAGE_PIN N18 [get_ports {TMDS_0_data_p[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_0_data_p[2]}]

# ----------------------------------------------------------------------------
# OV7670 摄像头引脚约束 (注意：名字已根据报错日志添加 _0 后缀)
# ----------------------------------------------------------------------------
# 像素时钟 PCLK -> T17
set_property PACKAGE_PIN T17 [get_ports pclk_0]
set_property IOSTANDARD LVCMOS33 [get_ports pclk_0]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pclk_0_IBUF]

# 场同步 VSYNC -> R18
set_property PACKAGE_PIN R18 [get_ports vsync_0]
set_property IOSTANDARD LVCMOS33 [get_ports vsync_0]

# 行同步 HREF -> N17
set_property PACKAGE_PIN N17 [get_ports href_0]
set_property IOSTANDARD LVCMOS33 [get_ports href_0]

# 数据线 D0-D7 (名字改成 d_0)
set_property PACKAGE_PIN U20 [get_ports {d_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d_0[0]}]

set_property PACKAGE_PIN T20 [get_ports {d_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d_0[1]}]

set_property PACKAGE_PIN W20 [get_ports {d_0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d_0[2]}]

set_property PACKAGE_PIN V20 [get_ports {d_0[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d_0[3]}]

set_property PACKAGE_PIN Y19 [get_ports {d_0[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d_0[4]}]

set_property PACKAGE_PIN Y18 [get_ports {d_0[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d_0[5]}]

set_property PACKAGE_PIN W16 [get_ports {d_0[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d_0[6]}]

set_property PACKAGE_PIN V16 [get_ports {d_0[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d_0[7]}]

# 摄像头复位 (如果有) -> P18
# set_property PACKAGE_PIN P18 [get_ports rst_n_0]
# set_property IOSTANDARD LVCMOS33 [get_ports rst_n_0]

# 摄像头休眠 (如果有) -> U19
# set_property PACKAGE_PIN U19 [get_ports pwdn_0]
# set_property IOSTANDARD LVCMOS33 [get_ports pwdn_0]

# ----------------------------------------------------------------------------
# 补救措施：防止未删除的多余端口报错
# ----------------------------------------------------------------------------
# 如果你没在 Block Design 里删掉 aRst_0，这里把它映射到 KEY1 (N15)
if {[llength [get_ports aRst_0]] > 0} {
    set_property PACKAGE_PIN N15 [get_ports aRst_0]
    set_property IOSTANDARD LVCMOS33 [get_ports aRst_0]
}

# 如果你没删掉 reset_rtl_0，把它映射到 KEY0 (N16)
if {[llength [get_ports reset_rtl_0]] > 0} {
    set_property PACKAGE_PIN N16 [get_ports reset_rtl_0]
    set_property IOSTANDARD LVCMOS33 [get_ports reset_rtl_0]
}