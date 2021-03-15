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
// CREATED		"Mon Mar 15 23:35:02 2021"

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

wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_26;

assign	QA = SYNTHESIZED_WIRE_19;
assign	QB = SYNTHESIZED_WIRE_26;
assign	QC = SYNTHESIZED_WIRE_6;




JK_FlipFlop	b2v_inst(
	.J(CIN),
	.clk(SYNTHESIZED_WIRE_27),
	.K(CIN),
	.CLRN(CLRN),
	.Q(SYNTHESIZED_WIRE_19),
	.nQ(SYNTHESIZED_WIRE_7));

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_34 = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_29 & SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_32 = SYNTHESIZED_WIRE_7 & DNUP;

assign	SYNTHESIZED_WIRE_27 = CIN & clk;


JK_FlipFlop	b2v_inst18(
	.J(SYNTHESIZED_WIRE_30),
	.clk(SYNTHESIZED_WIRE_27),
	.K(SYNTHESIZED_WIRE_30),
	.CLRN(CLRN),
	.Q(SYNTHESIZED_WIRE_26),
	.nQ(SYNTHESIZED_WIRE_21));


JK_FlipFlop	b2v_inst19(
	.J(SYNTHESIZED_WIRE_31),
	.clk(SYNTHESIZED_WIRE_27),
	.K(SYNTHESIZED_WIRE_31),
	.CLRN(CLRN),
	.Q(SYNTHESIZED_WIRE_6),
	.nQ(SYNTHESIZED_WIRE_1));

assign	SYNTHESIZED_WIRE_30 = SYNTHESIZED_WIRE_32 | SYNTHESIZED_WIRE_33;


JK_FlipFlop	b2v_inst20(
	.J(SYNTHESIZED_WIRE_34),
	.clk(SYNTHESIZED_WIRE_27),
	.K(SYNTHESIZED_WIRE_34),
	.CLRN(CLRN),
	.Q(QD)
	);

assign	SYNTHESIZED_WIRE_33 = SYNTHESIZED_WIRE_19 & SYNTHESIZED_WIRE_20;

assign	SYNTHESIZED_WIRE_20 =  ~DNUP;

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_21 & SYNTHESIZED_WIRE_32;

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_29;

assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_33 & SYNTHESIZED_WIRE_26;


endmodule
