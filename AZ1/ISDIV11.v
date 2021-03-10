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
// CREATED		"Mon Mar 08 19:35:30 2021"

module ISDIV11(
	a0,
	a1,
	a2,
	a3,
	c0,
	c1,
	s,
	o
);


input wire	a0;
input wire	a1;
input wire	a2;
input wire	a3;
input wire	c0;
input wire	c1;
input wire	s;
output wire	o;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_20 = 0;




BIN_Add_Sub_4bit	b2v_inst(
	.a0(a0),
	.a1(a1),
	.a2(a2),
	.a3(a3),
	.s_na(SYNTHESIZED_WIRE_0),
	.b0(SYNTHESIZED_WIRE_20),
	.b1(SYNTHESIZED_WIRE_21),
	.b2(SYNTHESIZED_WIRE_20),
	.b3(SYNTHESIZED_WIRE_21),
	.c0(SYNTHESIZED_WIRE_22),
	.c1(SYNTHESIZED_WIRE_25),
	.c2(SYNTHESIZED_WIRE_23),
	.c3(SYNTHESIZED_WIRE_24),
	.cout(SYNTHESIZED_WIRE_9));

assign	SYNTHESIZED_WIRE_12 = s ~^ c0;

assign	SYNTHESIZED_WIRE_10 = SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_23 | SYNTHESIZED_WIRE_24 | SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_9 | SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_19 =  ~SYNTHESIZED_WIRE_11;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_12 ^ c1;

assign	SYNTHESIZED_WIRE_21 = c0 ^ c1;

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_22 & SYNTHESIZED_WIRE_25 & SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_15 =  ~SYNTHESIZED_WIRE_23;

assign	o = SYNTHESIZED_WIRE_18 | SYNTHESIZED_WIRE_19;



endmodule
