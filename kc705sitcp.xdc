
set_property IOSTANDARD LVCMOS25 [get_ports GMII_RSTn]
set_property IOSTANDARD LVCMOS25 [get_ports I2C_SDA]
set_property IOSTANDARD LVCMOS25 [get_ports I2C_SCL]
set_property IOSTANDARD LVDS [get_ports SYSCLK_200MP_IN]
set_property IOSTANDARD LVDS [get_ports SYSCLK_200MN_IN]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO_DIP_SW[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO_DIP_SW[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO_DIP_SW[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO_DIP_SW[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TX_CLK]
set_property IOSTANDARD LVCMOS25 [get_ports {PHY_TXD[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {PHY_TXD[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {PHY_TXD[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {PHY_TXD[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_TX_CTRL]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RX_CLK]
set_property IOSTANDARD LVCMOS25 [get_ports {PHY_RXD[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {PHY_RXD[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {PHY_RXD[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {PHY_RXD[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports PHY_RX_CTRL]
set_property IOSTANDARD LVCMOS15 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[7]}]
set_property IOSTANDARD LVCMOS15 [get_ports SW_N]

set_property PACKAGE_PIN AD11 [get_ports SYSCLK_200MN_IN]
set_property PACKAGE_PIN AD12 [get_ports SYSCLK_200MP_IN]
set_property PACKAGE_PIN L20 [get_ports GMII_RSTn]
set_property PACKAGE_PIN L21 [get_ports I2C_SDA]
set_property PACKAGE_PIN K21 [get_ports I2C_SCL]
set_property PACKAGE_PIN N27 [get_ports {PHY_TXD[0]}]
set_property PACKAGE_PIN N25 [get_ports {PHY_TXD[1]}]
set_property PACKAGE_PIN M29 [get_ports {PHY_TXD[2]}]
set_property PACKAGE_PIN L28 [get_ports {PHY_TXD[3]}]
set_property PACKAGE_PIN K30 [get_ports PHY_TX_CLK]
set_property PACKAGE_PIN M27 [get_ports PHY_TX_CTRL]
set_property PACKAGE_PIN U30 [get_ports {PHY_RXD[0]}]
set_property PACKAGE_PIN U25 [get_ports {PHY_RXD[1]}]
set_property PACKAGE_PIN T25 [get_ports {PHY_RXD[2]}]
set_property PACKAGE_PIN U28 [get_ports {PHY_RXD[3]}]
set_property PACKAGE_PIN U27 [get_ports PHY_RX_CLK]
set_property PACKAGE_PIN R28 [get_ports PHY_RX_CTRL]
set_property PACKAGE_PIN AA12 [get_ports SW_N]
set_property PACKAGE_PIN AB8 [get_ports {LED[0]}]
set_property PACKAGE_PIN AA8 [get_ports {LED[1]}]
set_property PACKAGE_PIN AC9 [get_ports {LED[2]}]
set_property PACKAGE_PIN AB9 [get_ports {LED[3]}]
set_property PACKAGE_PIN AE26 [get_ports {LED[4]}]
set_property PACKAGE_PIN G19 [get_ports {LED[5]}]
set_property PACKAGE_PIN E18 [get_ports {LED[6]}]
set_property PACKAGE_PIN F16 [get_ports {LED[7]}]
set_property PACKAGE_PIN Y28  [get_ports {GPIO_DIP_SW[3]}]
set_property PACKAGE_PIN AA28 [get_ports {GPIO_DIP_SW[2]}]
set_property PACKAGE_PIN W29  [get_ports {GPIO_DIP_SW[1]}]
set_property PACKAGE_PIN Y29  [get_ports {GPIO_DIP_SW[0]}]

create_clock -period 8.000 -name PHY_RX_CLK -waveform {0.000 4.000} [get_ports PHY_RX_CLK]
create_clock -period 5.000 -name SYSCLK_200MP_IN -waveform {0.000 2.500} [get_ports SYSCLK_200MP_IN]

set_false_path -from [get_pins GMII_1000M_reg/C]

set_max_delay -datapath_only -from [get_clocks CLK_200M_PLL] -to [get_port GMII_RSTn] 10
set_min_delay                -from [get_clocks CLK_200M_PLL] -to [get_port GMII_RSTn] 0
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 12 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]


#set_property IOB false [get_cells -hierarchical -filter {name =~ */GMII_RXCNT/IOB_RD_*}]
#set_property IOB false [get_cells -hierarchical -filter {name =~ */GMII_RXCNT/IOB_RDV}]
#set_property IOB false [get_cells -hierarchical -filter {name =~ */GMII_RXCNT/IOB_RERR}]



#set_property IOB true [get_cells -hierarchical -filter {name =~ */GMII_TXCNT/IOB_TD_*}]
#set_property IOB true [get_cells -hierarchical -filter {name =~ */GMII_TXCNT/IOB_TEN}]


set_max_delay -datapath_only -from [get_clocks SYSCLK_200MP_IN] -to [get_port I2C_SCL] 10
set_max_delay -datapath_only -from [get_clocks SYSCLK_200MP_IN] -to [get_port I2C_SDA] 10


set_input_delay -clock [get_clocks PHY_RX_CLK] -max 4.500 [get_ports {PHY_RX_CTRL {PHY_RXD[*]}}]
set_input_delay -clock [get_clocks PHY_RX_CLK] -min 3.500 [get_ports {PHY_RX_CTRL {PHY_RXD[*]}}]

set_max_delay -datapath_only -from [get_clocks CLK_125M_PLL] -to [get_ports {PHY_TXD[*]}] 4
set_max_delay -datapath_only -from [get_clocks CLK_125M_PLL] -to [get_ports PHY_TX_CTRL] 4
set_max_delay -datapath_only -from [get_clocks CLK_125M_PLL_DELAY] -to [get_ports PHY_TX_CLK] 4



