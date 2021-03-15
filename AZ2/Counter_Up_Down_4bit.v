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
// CREATED		"Tue Mar 16 01:26:55 2021"

module Counter_Up_Down_4bit(
	clk,
	CLRN,
	CIN,
	DNUP,
	QA,
	QB,
	QC,
	QD
);


input wire	clk;
input wire	CLRN;
input wire	CIN;
input wire	DNUP;
output wire	QA;
output wire	QB;
output wire	QC;
output wire	QD;

wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_25;

assign	QA = SYNTHESIZED_WIRE_16;
assign	QB = SYNTHESIZED_WIRE_25;
assign	QC = SYNTHESIZED_WIRE_7;




JK_FllpFiop	b2v_inst1(
	.J(CIN),
	.CLK(clk),
	.K(CIN),
	.CLRN(CLRN),
	.Q(SYNTHESIZED_WIRE_16),
	.QN(SYNTHESIZED_WIRE_8));


JK_FllpFiop	b2v_inst10(
	.J(SYNTHESIZED_WIRE_26),
	.CLK(clk),
	.K(SYNTHESIZED_WIRE_26),
	.CLRN(CLRN),
	.Q(QD)
	);

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_27;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_28 & SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_8 & DNUP;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_30;

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_11 & CIN;

assign	SYNTHESIZED_WIRE_32 = SYNTHESIZED_WIRE_12 & CIN;


JK_FllpFiop	b2v_inst3(
	.J(SYNTHESIZED_WIRE_31),
	.CLK(clk),
	.K(SYNTHESIZED_WIRE_31),
	.CLRN(CLRN),
	.Q(SYNTHESIZED_WIRE_25),
	.QN(SYNTHESIZED_WIRE_20));

assign	SYNTHESIZED_WIRE_26 = SYNTHESIZED_WIRE_15 & CIN;

assign	SYNTHESIZED_WIRE_30 = SYNTHESIZED_WIRE_16 & SYNTHESIZED_WIRE_17;

assign	SYNTHESIZED_WIRE_17 =  ~DNUP;


JK_FllpFiop	b2v_inst6(
	.J(SYNTHESIZED_WIRE_32),
	.CLK(clk),
	.K(SYNTHESIZED_WIRE_32),
	.CLRN(CLRN),
	.Q(SYNTHESIZED_WIRE_7),
	.QN(SYNTHESIZED_WIRE_2));

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_29;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_27 | SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_30 & SYNTHESIZED_WIRE_25;


endmodule
