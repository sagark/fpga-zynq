set_property SRC_FILE_INFO {cfile:/scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0.xdc rfile:../../../zc706_rocketchip.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property SRC_FILE_INFO {cfile:/scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_clocks.xdc rfile:../../../zc706_rocketchip.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_clocks.xdc id:2 order:LATE scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:36 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/flow/rx_pause/pause*to_tx_reg[*]}] -to [get_cells {tri_mode_ethernet_mac_0_core/flow/tx_pause/count_set*reg}] 32 -datapath_only
set_property src_info {type:SCOPED_XDC file:1 line:37 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/flow/rx_pause/pause*to_tx_reg[*]}] -to [get_cells {tri_mode_ethernet_mac_0_core/flow/tx_pause/pause_count*reg[*]}] 32 -datapath_only
set_property src_info {type:SCOPED_XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/flow/rx_pause/pause_req_to_tx_int_reg}] -to [get_cells {tri_mode_ethernet_mac_0_core/flow/tx_pause/sync_good_rx/data_sync_reg0}] 6 -datapath_only
set_property src_info {type:SCOPED_XDC file:1 line:42 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/*statistics_counters/rd_data_ref_reg[*]}] -to [get_cells {tri_mode_ethernet_mac_0_core/*statistics_counters/ip2bus_data_reg[*]}] 6 -datapath_only
set_property src_info {type:SCOPED_XDC file:1 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/addr_filter_top/addr_regs.promiscuous_mode_reg_reg}] -to [get_cells {tri_mode_ethernet_mac_0_core/addr_filter_top/address_filter_inst/resync_promiscuous_mode/data_sync_reg0}] 6 -datapath_only
set_property src_info {type:SCOPED_XDC file:1 line:50 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/*managen/conf/update_pause_ad_int_reg}] -to [get_cells {tri_mode_ethernet_mac_0_core/addr_filter_top/address_filter_inst/sync_update/data_sync_reg0}] 6 -datapath_only
set_property src_info {type:SCOPED_XDC file:2 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/*statistics_counters/response_toggle_reg}] -to [get_cells {tri_mode_ethernet_mac_0_core/*statistics_counters/sync_response/data_sync_reg0}] 6 -datapath_only
set_property src_info {type:SCOPED_XDC file:2 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_0_core/*statistics_counters/request_toggle_reg}] -to [get_cells {tri_mode_ethernet_mac_0_core/*statistics_counters/sync_request/data_sync_reg0}] 6 -datapath_only
set_property src_info {type:SCOPED_XDC file:2 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {axi4_lite_ipif/axi_lite_top/*/bus2ip_addr_reg_reg[*]}] -to [get_clocks -of_objects [get_ports gtx_clk]] 6 -datapath_only
