set_property SRC_FILE_INFO {cfile:/scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/synth/gig_ethernet_pcs_pma_0.xdc rfile:../../../zc706_rocketchip.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/synth/gig_ethernet_pcs_pma_0.xdc id:1 order:EARLY} [current_design]
set_property SRC_FILE_INFO {cfile:/scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0_board.xdc rfile:../../../zc706_rocketchip.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0_board.xdc id:2 order:EARLY used_in_board:yes prop_thru_buffer:yes} [current_design]
set_property src_info {type:XDC file:1 line:60 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 6.000 -datapath_only -from [get_pins -hier -filter { name =~ */MDIO_INTERFACE_*/MDIO_OUT_reg/C } ]
set_property src_info {type:XDC file:1 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 6.000 -datapath_only -from [get_pins -hier -filter { name =~ */MDIO_INTERFACE_*/MDIO_TRI_reg/C } ]
set_property src_info {type:XDC file:2 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC GTXE2_CHANNEL_X0Y10 [get_cells -hi -regexp {.*transceiver_inst/gtwizard_inst/.*GTWIZARD_i/gt.e2_i}]
