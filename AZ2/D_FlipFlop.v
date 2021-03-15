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
// CREATED		"Mon Mar 15 23:00:00 2021"

module D_FlipFlop(
	D,
	clk,
	CLRN,
	Q,
	nQ
);


input wire	D;
input wire	clk;
input wire	CLRN;
output wire	Q;
output wire	nQ;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;

assign	Q = SYNTHESIZED_WIRE_9;
assign	nQ = SYNTHESIZED_WIRE_11;



assign	SYNTHESIZED_WIRE_2 = ~(SYNTHESIZED_WIRE_0 & clk);

assign	SYNTHESIZED_WIRE_0 =  ~D;

assign	SYNTHESIZED_WIRE_14 = ~(SYNTHESIZED_WIRE_13 & CLRN & SYNTHESIZED_WIRE_2);

assign	SYNTHESIZED_WIRE_13 = ~(SYNTHESIZED_WIRE_14 & SYNTHESIZED_WIRE_4);

assign	SYNTHESIZED_WIRE_4 = ~(clk & D);

assign	SYNTHESIZED_WIRE_10 = ~(SYNTHESIZED_WIRE_14 & SYNTHESIZED_WIRE_15);

assign	SYNTHESIZED_WIRE_15 =  ~clk;

assign	SYNTHESIZED_WIRE_12 = ~(SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_13);

assign	SYNTHESIZED_WIRE_11 = ~(SYNTHESIZED_WIRE_9 & CLRN & SYNTHESIZED_WIRE_10);

assign	SYNTHESIZED_WIRE_9 = ~(SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_12);


endmodule
