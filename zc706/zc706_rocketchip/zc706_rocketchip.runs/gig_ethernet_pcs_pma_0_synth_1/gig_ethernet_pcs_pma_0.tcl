# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z045ffg900-2
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:zc706:part0:1.0 [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]

read_ip /scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0.xci
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property is_locked true [get_files /scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0.xci]

set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.cache/wt [current_project]
set_property parent.project_dir /scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip [current_project]
catch { write_hwdef -file gig_ethernet_pcs_pma_0.hwdef }
synth_design -top gig_ethernet_pcs_pma_0 -part xc7z045ffg900-2 -mode out_of_context

rename_ref -prefix_all gig_ethernet_pcs_pma_0_
write_checkpoint -noxdef gig_ethernet_pcs_pma_0.dcp
report_utilization -file gig_ethernet_pcs_pma_0_utilization_synth.rpt -pb gig_ethernet_pcs_pma_0_utilization_synth.pb
if { [catch {
  file copy -force /scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.runs/gig_ethernet_pcs_pma_0_synth_1/gig_ethernet_pcs_pma_0.dcp /scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0.dcp
  write_verilog -force -mode synth_stub /scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0_stub.v
  write_vhdl -force -mode synth_stub /scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0_stub.vhdl
  write_verilog -force -mode funcsim /scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0_funcsim.v
  write_vhdl -force -mode funcsim /scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0_funcsim.vhdl
} _RESULT ] } { 
  send_msg_id runtcl-3 error "Unable to successfully create or copy supporting IP files."
  return -code error
}
