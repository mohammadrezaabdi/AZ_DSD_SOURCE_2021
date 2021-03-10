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
// CREATED		"Sat Mar 06 21:24:27 2021"

module Main(
	a00,
	a01,
	a02,
	a03,
	a10,
	a11,
	a12,
	a13,
	a20,
	a21,
	a22,
	a23,
	a30,
	a31,
	a32,
	a33,
	div_11_n3,
	o
);


input wire	a00;
input wire	a01;
input wire	a02;
input wire	a03;
input wire	a10;
input wire	a11;
input wire	a12;
input wire	a13;
input wire	a20;
input wire	a21;
input wire	a22;
input wire	a23;
input wire	a30;
input wire	a31;
input wire	a32;
input wire	a33;
input wire	div_11_n3;
output wire	o;

wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;

assign	SYNTHESIZED_WIRE_26 = 0;




BCD_Add	b2v_inst(
	.a0(a00),
	.a1(a01),
	.a2(a02),
	.a3(a03),
	.cin(SYNTHESIZED_WIRE_26),
	.b0(a20),
	.b1(a21),
	.b2(a22),
	.b3(a23),
	.s0(SYNTHESIZED_WIRE_5),
	.s1(SYNTHESIZED_WIRE_6),
	.s2(SYNTHESIZED_WIRE_7),
	.s3(SYNTHESIZED_WIRE_8),
	.cout(SYNTHESIZED_WIRE_33));


BCD_Add_Sub	b2v_inst1(
	.s_na(div_11_n3),
	.a0(SYNTHESIZED_WIRE_1),
	.a1(SYNTHESIZED_WIRE_2),
	.a2(SYNTHESIZED_WIRE_3),
	.a3(SYNTHESIZED_WIRE_4),
	.b0(SYNTHESIZED_WIRE_5),
	.b1(SYNTHESIZED_WIRE_6),
	.b2(SYNTHESIZED_WIRE_7),
	.b3(SYNTHESIZED_WIRE_8),
	.c0(SYNTHESIZED_WIRE_27),
	.c1(SYNTHESIZED_WIRE_28),
	.c2(SYNTHESIZED_WIRE_29),
	.c3(SYNTHESIZED_WIRE_30),
	.c_s(SYNTHESIZED_WIRE_32));


MUX_2t1	b2v_inst2(
	.sel(div_11_n3),
	.a(SYNTHESIZED_WIRE_9),
	.b(SYNTHESIZED_WIRE_10),
	.o(o));


BCD_Add	b2v_inst3(
	.a0(a10),
	.a1(a11),
	.a2(a12),
	.a3(a13),
	.cin(SYNTHESIZED_WIRE_26),
	.b0(a30),
	.b1(a31),
	.b2(a32),
	.b3(a33),
	.s0(SYNTHESIZED_WIRE_1),
	.s1(SYNTHESIZED_WIRE_2),
	.s2(SYNTHESIZED_WIRE_3),
	.s3(SYNTHESIZED_WIRE_4),
	.cout(SYNTHESIZED_WIRE_31));



ISDIV3	b2v_inst5(
	.a0(SYNTHESIZED_WIRE_27),
	.a1(SYNTHESIZED_WIRE_28),
	.a2(SYNTHESIZED_WIRE_29),
	.a3(SYNTHESIZED_WIRE_30),
	.c0(SYNTHESIZED_WIRE_31),
	.c1(SYNTHESIZED_WIRE_32),
	.c2(SYNTHESIZED_WIRE_33),
	.o(SYNTHESIZED_WIRE_9));


ISDIV11	b2v_inst7(
	.a0(SYNTHESIZED_WIRE_27),
	.a1(SYNTHESIZED_WIRE_28),
	.a2(SYNTHESIZED_WIRE_29),
	.a3(SYNTHESIZED_WIRE_30),
	.s(SYNTHESIZED_WIRE_32),
	.c0(SYNTHESIZED_WIRE_33),
	.c1(SYNTHESIZED_WIRE_31),
	.o(SYNTHESIZED_WIRE_10));


endmodule
