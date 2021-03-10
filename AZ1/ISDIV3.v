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
// CREATED		"Sat Mar 06 21:23:12 2021"

module ISDIV3(
	a0,
	a1,
	a2,
	a3,
	c0,
	c1,
	c2,
	o
);


input wire	a0;
input wire	a1;
input wire	a2;
input wire	a3;
input wire	c0;
input wire	c1;
input wire	c2;
output wire	o;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_14 = 0;




HA	b2v_inst(
	.A(c1),
	.B(c2),
	.S(SYNTHESIZED_WIRE_0),
	.Cout(SYNTHESIZED_WIRE_1));


Bin_Add_4bit	b2v_inst1(
	.a0(a0),
	.a1(a1),
	.a2(a2),
	.a3(a3),
	.cin(c0),
	.b0(SYNTHESIZED_WIRE_0),
	.b1(SYNTHESIZED_WIRE_1),
	.b2(SYNTHESIZED_WIRE_14),
	.b3(SYNTHESIZED_WIRE_14),
	.c0(SYNTHESIZED_WIRE_4),
	.c1(SYNTHESIZED_WIRE_6),
	.c2(SYNTHESIZED_WIRE_5),
	.c3(SYNTHESIZED_WIRE_7)
	);



HA	b2v_inst4(
	.A(SYNTHESIZED_WIRE_4),
	.B(SYNTHESIZED_WIRE_5),
	.S(SYNTHESIZED_WIRE_8),
	.Cout(SYNTHESIZED_WIRE_10));


HA	b2v_inst5(
	.A(SYNTHESIZED_WIRE_6),
	.B(SYNTHESIZED_WIRE_7),
	.S(SYNTHESIZED_WIRE_9),
	.Cout(SYNTHESIZED_WIRE_11));

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_8 ^ SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_10 ^ SYNTHESIZED_WIRE_11;

assign	o = ~(SYNTHESIZED_WIRE_12 | SYNTHESIZED_WIRE_13);


endmodule
