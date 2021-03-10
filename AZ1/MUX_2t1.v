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
// CREATED		"Sat Mar 06 18:45:19 2021"

module MUX_2t1(
	sel,
	a,
	b,
	o
);


input wire	sel;
input wire	a;
input wire	b;
output wire	o;

wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_4;




assign	SYNTHESIZED_WIRE_2 = a & SYNTHESIZED_WIRE_5;

assign	o = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_5 =  ~sel;

assign	SYNTHESIZED_WIRE_4 =  ~SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_1 = b & SYNTHESIZED_WIRE_4;


endmodule
