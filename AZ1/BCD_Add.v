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
// CREATED		"Sat Mar 06 15:43:37 2021"

module BCD_Add(
	a0,
	a1,
	a2,
	a3,
	b0,
	b1,
	b2,
	b3,
	cin,
	cout,
	s0,
	s1,
	s2,
	s3
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
output wire	cout;
output wire	s0;
output wire	s1;
output wire	s2;
output wire	s3;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;

assign	cout = SYNTHESIZED_WIRE_20;
assign	SYNTHESIZED_WIRE_19 = 0;




Bin_Add_4bit	b2v_inst(
	.a0(a0),
	.a1(a1),
	.a2(a2),
	.a3(a3),
	.cin(cin),
	.b0(b0),
	.b1(b1),
	.b2(b2),
	.b3(b3),
	.c0(SYNTHESIZED_WIRE_0),
	.c1(SYNTHESIZED_WIRE_16),
	.c2(SYNTHESIZED_WIRE_17),
	.c3(SYNTHESIZED_WIRE_18),
	.cout(SYNTHESIZED_WIRE_13));


Bin_Add_4bit	b2v_inst1(
	.a0(SYNTHESIZED_WIRE_0),
	.a1(SYNTHESIZED_WIRE_16),
	.a2(SYNTHESIZED_WIRE_17),
	.a3(SYNTHESIZED_WIRE_18),
	.cin(SYNTHESIZED_WIRE_19),
	.b0(SYNTHESIZED_WIRE_19),
	.b1(SYNTHESIZED_WIRE_20),
	.b2(SYNTHESIZED_WIRE_20),
	.b3(SYNTHESIZED_WIRE_19),
	.c0(s0),
	.c1(s1),
	.c2(s2),
	.c3(s3)
	);

assign	SYNTHESIZED_WIRE_14 = SYNTHESIZED_WIRE_16 & SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_17 & SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_13 | SYNTHESIZED_WIRE_14 | SYNTHESIZED_WIRE_15;



endmodule
