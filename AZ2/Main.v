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
// CREATED		"Tue Mar 16 01:35:47 2021"

module Main(
	IN,
	OUT,
	ENT,
	clk,
	T,
	CLRN,
	OPEN,
	CLOSE
);


input wire	IN;
input wire	OUT;
input wire	ENT;
input wire	clk;
input wire	T;
input wire	CLRN;
output wire	OPEN;
output wire	CLOSE;

wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_21;

assign	OPEN = SYNTHESIZED_WIRE_1;



assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_28 & SYNTHESIZED_WIRE_1 & IN;

assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_9 =  ~SYNTHESIZED_WIRE_30;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_30 ^ SYNTHESIZED_WIRE_29;


D_FlipFiop	b2v_inst14(
	.D(OUT),
	.CLK(clk),
	.CLRN(CLRN),
	.Q(SYNTHESIZED_WIRE_29)
	);


D_FlipFiop	b2v_inst15(
	.D(SYNTHESIZED_WIRE_7),
	.CLK(SYNTHESIZED_WIRE_8),
	.CLRN(CLRN),
	.Q(SYNTHESIZED_WIRE_12)
	);

assign	SYNTHESIZED_WIRE_7 = SYNTHESIZED_WIRE_9 | SYNTHESIZED_WIRE_31;


D_FlipFiop	b2v_inst17(
	.D(SYNTHESIZED_WIRE_11),
	.CLK(clk),
	.CLRN(CLRN),
	.Q(CLOSE)
	);


D_FlipFiop	b2v_inst18(
	.D(SYNTHESIZED_WIRE_12),
	.CLK(clk),
	.CLRN(CLRN),
	.Q(SYNTHESIZED_WIRE_1)
	);

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_30 | SYNTHESIZED_WIRE_31;


Counter_Up_Down_4bit	b2v_inst20(
	.CIN(SYNTHESIZED_WIRE_15),
	.DNUP(SYNTHESIZED_WIRE_16),
	.CLRN(CLRN),
	.clk(clk),
	.QA(SYNTHESIZED_WIRE_32),
	.QB(SYNTHESIZED_WIRE_34),
	.QC(SYNTHESIZED_WIRE_33),
	.QD(SYNTHESIZED_WIRE_35));

assign	SYNTHESIZED_WIRE_11 = ~(SYNTHESIZED_WIRE_32 | SYNTHESIZED_WIRE_33 | SYNTHESIZED_WIRE_34 | SYNTHESIZED_WIRE_35);


D_FlipFiop	b2v_inst5(
	.D(SYNTHESIZED_WIRE_21),
	.CLK(clk),
	.CLRN(CLRN),
	.Q(SYNTHESIZED_WIRE_30)
	);

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_28 & T & ENT;

assign	SYNTHESIZED_WIRE_28 = ~(SYNTHESIZED_WIRE_32 & SYNTHESIZED_WIRE_35 & SYNTHESIZED_WIRE_34 & SYNTHESIZED_WIRE_33);

assign	SYNTHESIZED_WIRE_3 =  ~SYNTHESIZED_WIRE_30;


endmodule
