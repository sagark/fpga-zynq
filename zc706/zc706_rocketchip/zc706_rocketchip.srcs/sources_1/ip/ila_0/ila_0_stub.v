// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (lin64) Build 932637 Wed Jun 11 13:12:34 MDT 2014
// Date        : Mon Nov 17 18:30:33 2014
// Host        : a8 running 64-bit Ubuntu 14.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /scratch/skarandikar/fpga-zynq/zc706/zc706_rocketchip/zc706_rocketchip.srcs/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2014.2" *)
module ila_0(clk, trig_in, trig_in_ack, probe0, probe1, probe2, probe3, probe4, probe5, probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15, probe16, probe17, probe18, probe19, probe20, probe21, probe22, probe23)
/* synthesis syn_black_box black_box_pad_pin="clk,trig_in,trig_in_ack,probe0[7:0],probe1[0:0],probe2[0:0],probe3[0:0],probe4[7:0],probe5[0:0],probe6[0:0],probe7[0:0],probe8[11:0],probe9[0:0],probe10[0:0],probe11[31:0],probe12[0:0],probe13[0:0],probe14[1:0],probe15[0:0],probe16[0:0],probe17[11:0],probe18[0:0],probe19[0:0],probe20[31:0],probe21[1:0],probe22[0:0],probe23[0:0]" */;
  input clk;
  input trig_in;
  output trig_in_ack;
  input [7:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
  input [0:0]probe3;
  input [7:0]probe4;
  input [0:0]probe5;
  input [0:0]probe6;
  input [0:0]probe7;
  input [11:0]probe8;
  input [0:0]probe9;
  input [0:0]probe10;
  input [31:0]probe11;
  input [0:0]probe12;
  input [0:0]probe13;
  input [1:0]probe14;
  input [0:0]probe15;
  input [0:0]probe16;
  input [11:0]probe17;
  input [0:0]probe18;
  input [0:0]probe19;
  input [31:0]probe20;
  input [1:0]probe21;
  input [0:0]probe22;
  input [0:0]probe23;
endmodule
