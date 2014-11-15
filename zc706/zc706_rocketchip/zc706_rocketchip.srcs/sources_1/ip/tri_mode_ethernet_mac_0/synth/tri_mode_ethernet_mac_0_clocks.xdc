
############################################################
# Obtain input clocks from top level XDC                         #
############################################################
set ip_gtx_clk     [get_clocks -of_objects [get_ports gtx_clk]]

set ip_cpu_clk  [get_clocks -of_objects [get_ports s_axi_aclk]]

#
####
#######
##########
#############
#################
#BLOCK CONSTRAINTS


############################################################
# Crossing of Clock Domain Constraints: please do not edit #
############################################################

set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/*statistics_counters/response_toggle_reg}] -to [get_cells {tri_mode_ethernet_mac_0_core/*statistics_counters/sync_response/data_sync_reg0}] 6 -datapath_only
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/*statistics_counters/request_toggle_reg}] -to [get_cells {tri_mode_ethernet_mac_0_core/*statistics_counters/sync_request/data_sync_reg0}] 6 -datapath_only
# set a false path for the IPIF
set_max_delay -from [get_cells {axi4_lite_ipif/axi_lite_top/*/bus2ip_addr_reg_reg[*]}] -to $ip_gtx_clk 6 -datapath_only

# set a false path for the static config registers
set_false_path -from [get_cells {tri_mode_ethernet_mac_0_core/*managen/conf/int_*reg[*]}] -to $ip_gtx_clk
set_false_path -from [get_cells {tri_mode_ethernet_mac_0_core/*managen/conf/int_*reg}] -to $ip_gtx_clk

# set a false path for the clock path from the address filter dist rams
# the paths we care about timing are either the write interface OR the read interface
# this path is from the write to the read which should be ignored
set_false_path -from $ip_cpu_clk -to  [get_cells {tri_mode_ethernet_mac_0_core/addr_filter_top/address_filter_inst/*addr*/bit_match*reg[*]}]


