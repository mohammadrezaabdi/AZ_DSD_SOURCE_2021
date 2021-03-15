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
// CREATED		"Mon Mar 15 22:59:50 2021"

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

wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_18;

assign	Q = SYNTHESIZED_WIRE_14;
assign	nQ = SYNTHESIZED_WIRE_17;



assign	SYNTHESIZED_WIRE_18 =  ~clk;

assign	SYNTHESIZED_WIRE_17 = ~(SYNTHESIZED_WIRE_14 & CLRN & SYNTHESIZED_WIRE_1);

assign	SYNTHESIZED_WIRE_16 = ~(SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_3);

assign	SYNTHESIZED_WIRE_15 = ~(SYNTHESIZED_WIRE_16 & CLRN & SYNTHESIZED_WIRE_5);

assign	SYNTHESIZED_WIRE_5 = ~(clk & K & SYNTHESIZED_WIRE_14);

assign	SYNTHESIZED_WIRE_3 = ~(SYNTHESIZED_WIRE_17 & J & clk);

assign	SYNTHESIZED_WIRE_14 = ~(SYNTHESIZED_WIRE_17 & SYNTHESIZED_WIRE_9);

assign	SYNTHESIZED_WIRE_1 = ~(SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_18);

assign	SYNTHESIZED_WIRE_9 = ~(SYNTHESIZED_WIRE_18 & SYNTHESIZED_WIRE_16);


endmodule
