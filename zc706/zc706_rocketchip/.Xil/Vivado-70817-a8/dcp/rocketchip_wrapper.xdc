set_property SRC_FILE_INFO {cfile:/scratch/skarandikar/fpga-zynq/zc706/src/constrs/base.xdc rfile:../../../src/constrs/base.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:/scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.cache/30cf66ef/labtools_xsdb_master_lib.xdc rfile:../../zc706_rocketchip.cache/30cf66ef/labtools_xsdb_master_lib.xdc id:2 scoped_inst:dbg_hub/inst} [current_design]
set_property src_info {type:XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_200_p]
set_property src_info {type:XDC file:1 line:3 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN G9 [get_ports clk_200_n]
set_property src_info {type:XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_200_n]
set_property src_info {type:XDC file:1 line:5 export:INPUT save:INPUT read:READ} [current_design]
#create_clock -period 5.000 -name main_clk [get_ports SYSCLK_P]
set_property src_info {type:XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 5.000 -name clk_200 [get_ports clk_200_p]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
# jitter attenuated clock programmed over I2C at linux boot
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AC7 [get_ports sfp_125_clk_n]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
#set_property IOSTANDARD LVDS [get_ports SI5324_OUT_C_P]
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
#set_property IOSTANDARD LVDS [get_ports SI5324_OUT_C_N]
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 8.000 -name gtrefclk -add [get_ports sfp_125_clk_p]
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
#set_false_path -from [get_clocks -include_generated_clocks independent_clock] -to [get_clocks -include_generated_clocks gtrefclk]
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
#set_false_path -from [get_clocks -include_generated_clocks gtrefclk] -to [get_clocks -include_generated_clocks independent_clock]
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
#set_property PACKAGE_PIN AK25 [get_ports SW_BUTTON_LEFT]
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
#set_property IOSTANDARD LVCMOS25 [get_ports SW_BUTTON_LEFT]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
#set_property PACKAGE_PIN K15 [get_ports SW_BUTTON_CENTER]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
#set_property IOSTANDARD LVCMOS15 [get_ports SW_BUTTON_CENTER]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
#set_property PACKAGE_PIN R27 [get_ports SW_BUTTON_RIGHT]
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
#set_property IOSTANDARD LVCMOS25 [get_ports SW_BUTTON_RIGHT]
set_property src_info {type:XDC file:1 line:28 export:INPUT save:INPUT read:READ} [current_design]
#set_property PACKAGE_PIN A8 [get_ports PL_CPU_RESET]
set_property src_info {type:XDC file:1 line:29 export:INPUT save:INPUT read:READ} [current_design]
#set_property IOSTANDARD LVCMOS15 [get_ports PL_CPU_RESET]
set_property src_info {type:XDC file:1 line:30 export:INPUT save:INPUT read:READ} [current_design]
#set_property PACKAGE_PIN AC17 [get_ports GPIO_DIP_SW2]
set_property src_info {type:XDC file:1 line:31 export:INPUT save:INPUT read:READ} [current_design]
#set_property IOSTANDARD LVCMOS25 [get_ports GPIO_DIP_SW2]
set_property src_info {type:XDC file:1 line:32 export:INPUT save:INPUT read:READ} [current_design]
#set_property PACKAGE_PIN AC16 [get_ports GPIO_DIP_SW1]
set_property src_info {type:XDC file:1 line:33 export:INPUT save:INPUT read:READ} [current_design]
#set_property IOSTANDARD LVCMOS25 [get_ports GPIO_DIP_SW1]
set_property src_info {type:XDC file:1 line:34 export:INPUT save:INPUT read:READ} [current_design]
#set_property PACKAGE_PIN AB17 [get_ports GPIO_DIP_SW0]
set_property src_info {type:XDC file:1 line:35 export:INPUT save:INPUT read:READ} [current_design]
#set_property IOSTANDARD LVCMOS25 [get_ports GPIO_DIP_SW0]
set_property src_info {type:XDC file:1 line:36 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:37 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
#GPIO_LED_RIGHT
set_property src_info {type:XDC file:1 line:39 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W21 [get_ports clk125_heartbeat]
set_property src_info {type:XDC file:1 line:40 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS25 [get_ports clk125_heartbeat]
set_property src_info {type:XDC file:1 line:41 export:INPUT save:INPUT read:READ} [current_design]
#GPIO_LED_CENTER
set_property src_info {type:XDC file:1 line:42 export:INPUT save:INPUT read:READ} [current_design]
#set_property PACKAGE_PIN G2 [get_ports unused_led_1]
set_property src_info {type:XDC file:1 line:43 export:INPUT save:INPUT read:READ} [current_design]
#set_property IOSTANDARD LVCMOS15 [get_ports unused_led_1]
set_property src_info {type:XDC file:1 line:44 export:INPUT save:INPUT read:READ} [current_design]
#GPIO_LED_LEFT
set_property src_info {type:XDC file:1 line:45 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y21 [get_ports sfp_link_status]
set_property src_info {type:XDC file:1 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS25 [get_ports sfp_link_status]
set_property src_info {type:XDC file:1 line:47 export:INPUT save:INPUT read:READ} [current_design]
#set_property PACKAGE_PIN A17 [get_ports GPIO_LED_0]
set_property src_info {type:XDC file:1 line:48 export:INPUT save:INPUT read:READ} [current_design]
#set_property IOSTANDARD LVCMOS15 [get_ports GPIO_LED_0]
set_property src_info {type:XDC file:1 line:49 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y5 [get_ports sfp_rxn]
set_property src_info {type:XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA18 [get_ports sfp_tx_disable]
set_property src_info {type:XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS25 [get_ports sfp_tx_disable]
set_property src_info {type:XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:SCOPED_XDC file:2 line:1 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:SCOPED_XDC file:2 line:2 export:INPUT save:INPUT read:READ} [current_design]
##
set_property src_info {type:SCOPED_XDC file:2 line:3 export:INPUT save:INPUT read:READ} [current_design]
## Create Clock Constraints on BSCAN ports DRCK & UPDATE
set_property src_info {type:SCOPED_XDC file:2 line:4 export:INPUT save:INPUT read:READ} [current_design]
##
current_instance dbg_hub/inst
set_property src_info {type:SCOPED_XDC file:2 line:5 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 30.000 [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/DRCK]
set_property src_info {type:SCOPED_XDC file:2 line:6 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 60.000 [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/UPDATE]
set_property src_info {type:SCOPED_XDC file:2 line:7 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:SCOPED_XDC file:2 line:8 export:INPUT save:INPUT read:READ} [current_design]
##
set_property src_info {type:SCOPED_XDC file:2 line:9 export:INPUT save:INPUT read:READ} [current_design]
## Timing Exceptions on DRCK & UPDATE clocks
set_property src_info {type:SCOPED_XDC file:2 line:10 export:INPUT save:INPUT read:READ} [current_design]
##
set_property src_info {type:SCOPED_XDC file:2 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -through [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/SHIFT]
set_property src_info {type:SCOPED_XDC file:2 line:12 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:SCOPED_XDC file:2 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -setup -from [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/UPDATE]] -to [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/DRCK]] 2
set_property src_info {type:SCOPED_XDC file:2 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/UPDATE]] -to [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/DRCK]] 1
set_property src_info {type:SCOPED_XDC file:2 line:15 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:SCOPED_XDC file:2 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_clock_groups -asynchronous -group [list [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/DRCK]] [get_clocks -of_objects [get_pins bscan_inst/SERIES7_BSCAN.bscan_inst/UPDATE]]]
set_property src_info {type:SCOPED_XDC file:2 line:17 export:INPUT save:INPUT read:READ} [current_design]

