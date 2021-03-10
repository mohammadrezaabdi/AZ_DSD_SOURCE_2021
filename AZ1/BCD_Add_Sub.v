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
// CREATED		"Sat Mar 06 17:44:14 2021"

module BCD_Add_Sub(
	a0,
	a1,
	a2,
	a3,
	b0,
	b1,
	b2,
	b3,
	s_na,
	c_s,
	c0,
	c1,
	c2,
	c3
);


input wire	a0;
input wire	a1;
input wire	a2;
input wire	a3;
input wire	b0;
input wire	b1;
input wire	b2;
input wire	b3;
input wire	s_na;
output wire	c_s;
output wire	c0;
output wire	c1;
output wire	c2;
output wire	c3;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;

assign	SYNTHESIZED_WIRE_39 = 0;
assign	SYNTHESIZED_WIRE_16 = 0;
assign	SYNTHESIZED_WIRE_46 = 0;




MUX_10t5	b2v_inst(
	.sel(s_na),
	.a0(b0),
	.b0(SYNTHESIZED_WIRE_0),
	.a1(b1),
	.b1(SYNTHESIZED_WIRE_1),
	.a2(b2),
	.b2(SYNTHESIZED_WIRE_2),
	.a3(b3),
	.b3(SYNTHESIZED_WIRE_3),
	.a4(SYNTHESIZED_WIRE_39),
	.b4(SYNTHESIZED_WIRE_39),
	.o0(SYNTHESIZED_WIRE_17),
	.o1(SYNTHESIZED_WIRE_18),
	.o2(SYNTHESIZED_WIRE_19),
	.o3(SYNTHESIZED_WIRE_20)
	);


BCD_9com	b2v_inst1(
	.a3(b3),
	.a2(b2),
	.a1(b1),
	.a0(b0),
	.c3(SYNTHESIZED_WIRE_3),
	.c2(SYNTHESIZED_WIRE_2),
	.c1(SYNTHESIZED_WIRE_1),
	.c0(SYNTHESIZED_WIRE_0));



MUX_10t5	b2v_inst100(
	.sel(s_na),
	.a0(SYNTHESIZED_WIRE_40),
	.b0(SYNTHESIZED_WIRE_7),
	.a1(SYNTHESIZED_WIRE_41),
	.b1(SYNTHESIZED_WIRE_9),
	.a2(SYNTHESIZED_WIRE_42),
	.b2(SYNTHESIZED_WIRE_11),
	.a3(SYNTHESIZED_WIRE_43),
	.b3(SYNTHESIZED_WIRE_13),
	.a4(SYNTHESIZED_WIRE_44),
	.b4(SYNTHESIZED_WIRE_45),
	.o0(c0),
	.o1(c1),
	.o2(c2),
	.o3(c3),
	.o4(c_s));


BCD_Add	b2v_inst2(
	.a0(a0),
	.a1(a1),
	.a2(a2),
	.a3(a3),
	.cin(SYNTHESIZED_WIRE_16),
	.b0(SYNTHESIZED_WIRE_17),
	.b1(SYNTHESIZED_WIRE_18),
	.b2(SYNTHESIZED_WIRE_19),
	.b3(SYNTHESIZED_WIRE_20),
	.s0(SYNTHESIZED_WIRE_40),
	.s1(SYNTHESIZED_WIRE_41),
	.s2(SYNTHESIZED_WIRE_42),
	.s3(SYNTHESIZED_WIRE_43),
	.cout(SYNTHESIZED_WIRE_44));

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_40 ^ SYNTHESIZED_WIRE_45;


Bin_Add_4bit	b2v_inst3(
	.a0(SYNTHESIZED_WIRE_46),
	.a1(SYNTHESIZED_WIRE_45),
	.a2(SYNTHESIZED_WIRE_46),
	.a3(SYNTHESIZED_WIRE_45),
	.cin(SYNTHESIZED_WIRE_44),
	.b0(SYNTHESIZED_WIRE_28),
	.b1(SYNTHESIZED_WIRE_29),
	.b2(SYNTHESIZED_WIRE_30),
	.b3(SYNTHESIZED_WIRE_31),
	.c0(SYNTHESIZED_WIRE_7),
	.c1(SYNTHESIZED_WIRE_9),
	.c2(SYNTHESIZED_WIRE_11),
	.c3(SYNTHESIZED_WIRE_13)
	);



assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_41 ^ SYNTHESIZED_WIRE_45;

assign	SYNTHESIZED_WIRE_30 = SYNTHESIZED_WIRE_42 ^ SYNTHESIZED_WIRE_45;

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_43 ^ SYNTHESIZED_WIRE_45;

assign	SYNTHESIZED_WIRE_45 =  ~SYNTHESIZED_WIRE_44;


endmodule
