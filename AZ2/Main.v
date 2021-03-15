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
// CREATED		"Tue Mar 16 01:03:51 2021"

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
output reg	CLOSE;

wire	SYNTHESIZED_WIRE_25;
reg	DFF_inst2;
reg	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_1;
reg	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_30;
reg	DFF_inst6;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;

assign	OPEN = DFF_inst2;
assign	SYNTHESIZED_WIRE_28 = 1;
assign	SYNTHESIZED_WIRE_30 = 1;



assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_25 & DFF_inst2 & IN;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_26 | SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_5 =  ~SYNTHESIZED_WIRE_27;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_27 ^ SYNTHESIZED_WIRE_26;


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_28)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_26 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_28)
	begin
	SYNTHESIZED_WIRE_26 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_26 <= OUT;
	end
end


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_28)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_27 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_28)
	begin
	SYNTHESIZED_WIRE_27 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_27 <= SYNTHESIZED_WIRE_3;
	end
end


assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_29;


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_30)
begin
if (!CLRN)
	begin
	CLOSE <= 0;
	end
else
if (!SYNTHESIZED_WIRE_30)
	begin
	CLOSE <= 1;
	end
else
	begin
	CLOSE <= SYNTHESIZED_WIRE_7;
	end
end


assign	SYNTHESIZED_WIRE_17 = SYNTHESIZED_WIRE_27 | SYNTHESIZED_WIRE_29;


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_30)
begin
if (!CLRN)
	begin
	DFF_inst2 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_30)
	begin
	DFF_inst2 <= 1;
	end
else
	begin
	DFF_inst2 <= DFF_inst6;
	end
end


Counter_Up_Down_4bit	b2v_inst20(
	.CIN(SYNTHESIZED_WIRE_11),
	.DNUP(SYNTHESIZED_WIRE_12),
	.CLRN(CLRN),
	.clk(clk),
	.QA(SYNTHESIZED_WIRE_31),
	.QB(SYNTHESIZED_WIRE_33),
	.QC(SYNTHESIZED_WIRE_32),
	.QD(SYNTHESIZED_WIRE_34));

assign	SYNTHESIZED_WIRE_7 = ~(SYNTHESIZED_WIRE_31 | SYNTHESIZED_WIRE_32 | SYNTHESIZED_WIRE_33 | SYNTHESIZED_WIRE_34);


always@(posedge SYNTHESIZED_WIRE_17 or negedge CLRN or negedge SYNTHESIZED_WIRE_30)
begin
if (!CLRN)
	begin
	DFF_inst6 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_30)
	begin
	DFF_inst6 <= 1;
	end
else
	begin
	DFF_inst6 <= SYNTHESIZED_WIRE_18;
	end
end

assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_25 & T & ENT;

assign	SYNTHESIZED_WIRE_25 = ~(SYNTHESIZED_WIRE_31 & SYNTHESIZED_WIRE_34 & SYNTHESIZED_WIRE_33 & SYNTHESIZED_WIRE_32);

assign	SYNTHESIZED_WIRE_1 =  ~SYNTHESIZED_WIRE_27;


endmodule
