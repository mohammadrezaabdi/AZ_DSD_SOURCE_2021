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
// CREATED		"Sat Mar 06 15:24:09 2021"

module Bin_Add_4bit(
	a0,
	a1,
	a2,
	a3,
	b0,
	b1,
	b2,
	b3,
	cin,
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
input wire	cin;
output wire	c0;
output wire	c1;
output wire	c2;
output wire	c3;
output wire	cout;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





FA	b2v_inst(
	.A(a0),
	.B(b0),
	.Cin(cin),
	.S(c0),
	.Cout(SYNTHESIZED_WIRE_0));


FA	b2v_inst1(
	.A(a1),
	.B(b1),
	.Cin(SYNTHESIZED_WIRE_0),
	.S(c1),
	.Cout(SYNTHESIZED_WIRE_1));


FA	b2v_inst2(
	.A(a2),
	.B(b2),
	.Cin(SYNTHESIZED_WIRE_1),
	.S(c2),
	.Cout(SYNTHESIZED_WIRE_2));


FA	b2v_inst3(
	.A(a3),
	.B(b3),
	.Cin(SYNTHESIZED_WIRE_2),
	.S(c3),
	.Cout(cout));


endmodule
