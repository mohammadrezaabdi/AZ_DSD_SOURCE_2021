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
// CREATED		"Sat Mar 06 16:59:51 2021"

module MUX_10t5(
	sel,
	a0,
	b0,
	a1,
	b1,
	a2,
	b2,
	a3,
	b3,
	a4,
	b4,
	o0,
	o1,
	o2,
	o3,
	o4
);


input wire	sel;
input wire	a0;
input wire	b0;
input wire	a1;
input wire	b1;
input wire	a2;
input wire	b2;
input wire	a3;
input wire	b3;
input wire	a4;
input wire	b4;
output wire	o0;
output wire	o1;
output wire	o2;
output wire	o3;
output wire	o4;

wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;




assign	SYNTHESIZED_WIRE_2 = a0 & SYNTHESIZED_WIRE_21;

assign	o0 = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_19 = b2 & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_6 = a3 & SYNTHESIZED_WIRE_21;

assign	o3 = SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_5 = b3 & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_11 = a4 & SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_10 = b4 & SYNTHESIZED_WIRE_22;

assign	o4 = SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11;

assign	SYNTHESIZED_WIRE_21 =  ~sel;

assign	SYNTHESIZED_WIRE_22 =  ~SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_1 = b0 & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_16 = a1 & SYNTHESIZED_WIRE_21;

assign	o1 = SYNTHESIZED_WIRE_15 | SYNTHESIZED_WIRE_16;

assign	SYNTHESIZED_WIRE_15 = b1 & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_20 = a2 & SYNTHESIZED_WIRE_21;

assign	o2 = SYNTHESIZED_WIRE_19 | SYNTHESIZED_WIRE_20;


endmodule
