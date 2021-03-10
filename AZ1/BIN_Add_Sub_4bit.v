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
// CREATED		"Sat Mar 06 21:00:55 2021"

module BIN_Add_Sub_4bit(
	a0,
	a1,
	a2,
	a3,
	b0,
	b1,
	b2,
	b3,
	s_na,
	c0,
	c1,
	c2,
	c3,
	cout
);


input wire	a0;
input wire	a1;
input wire	a2;
input wire	a3;
input wire	b0;
input wire	b1;
input wire	b2;
input wire	b3;
input wire	s_na;
output wire	c0;
output wire	c1;
output wire	c2;
output wire	c3;
output wire	cout;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;





Bin_Add_4bit	b2v_inst(
	.a0(a0),
	.a1(a1),
	.a2(a2),
	.a3(a3),
	.cin(s_na),
	.b0(SYNTHESIZED_WIRE_0),
	.b1(SYNTHESIZED_WIRE_1),
	.b2(SYNTHESIZED_WIRE_2),
	.b3(SYNTHESIZED_WIRE_3),
	.c0(c0),
	.c1(c1),
	.c2(c2),
	.c3(c3),
	.cout(cout));

assign	SYNTHESIZED_WIRE_0 = b0 ^ s_na;

assign	SYNTHESIZED_WIRE_1 = b1 ^ s_na;

assign	SYNTHESIZED_WIRE_2 = b2 ^ s_na;

assign	SYNTHESIZED_WIRE_3 = b3 ^ s_na;


endmodule
