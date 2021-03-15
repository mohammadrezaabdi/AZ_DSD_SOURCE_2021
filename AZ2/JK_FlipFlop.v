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
// CREATED		"Tue Mar 16 01:13:27 2021"

module JK_FlipFlop(
	J,
	clk,
	K,
	CLRN,
	Q,
	nQ
);


input wire	J;
input wire	clk;
input wire	K;
input wire	CLRN;
output wire	Q;
output wire	nQ;

wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_21;

assign	Q = SYNTHESIZED_WIRE_16;
assign	nQ = SYNTHESIZED_WIRE_20;
assign	SYNTHESIZED_WIRE_17 = 1;



assign	SYNTHESIZED_WIRE_21 =  ~clk;

assign	SYNTHESIZED_WIRE_20 = ~(SYNTHESIZED_WIRE_16 & SYNTHESIZED_WIRE_17 & SYNTHESIZED_WIRE_2);

assign	SYNTHESIZED_WIRE_19 = ~(SYNTHESIZED_WIRE_18 & SYNTHESIZED_WIRE_4);

assign	SYNTHESIZED_WIRE_18 = ~(SYNTHESIZED_WIRE_19 & SYNTHESIZED_WIRE_17 & SYNTHESIZED_WIRE_7);

assign	SYNTHESIZED_WIRE_7 = ~(clk & K & SYNTHESIZED_WIRE_16);

assign	SYNTHESIZED_WIRE_4 = ~(SYNTHESIZED_WIRE_20 & J & clk);

assign	SYNTHESIZED_WIRE_16 = ~(SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_11);


assign	SYNTHESIZED_WIRE_2 = ~(SYNTHESIZED_WIRE_18 & SYNTHESIZED_WIRE_21);

assign	SYNTHESIZED_WIRE_11 = ~(SYNTHESIZED_WIRE_21 & SYNTHESIZED_WIRE_19);


endmodule
