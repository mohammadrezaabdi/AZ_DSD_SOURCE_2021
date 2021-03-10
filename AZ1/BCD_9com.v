// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
// CREATED		"Sat Mar 06 16:40:01 2021"

module BCD_9com(
	a3,
	a2,
	a1,
	a0,
	c3,
	c2,
	c1,
	c0
);


input wire	a3;
input wire	a2;
input wire	a1;
input wire	a0;
output wire	c3;
output wire	c2;
output wire	c1;
output wire	c0;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;

assign	c1 = a1;



assign	c2 = a2 ^ a1;

assign	SYNTHESIZED_WIRE_2 =  ~a1;

assign	c3 = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_2;

assign	c0 =  ~a0;

assign	SYNTHESIZED_WIRE_1 =  ~a2;

assign	SYNTHESIZED_WIRE_0 =  ~a3;


endmodule
