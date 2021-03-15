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
// CREATED		"Mon Mar 15 23:44:27 2021"

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
output reg	OPEN;
output reg	CLOSE;

reg	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_0;
reg	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_27;
reg	DFF_inst6;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_25 = 1;
assign	SYNTHESIZED_WIRE_27 = 1;



assign	SYNTHESIZED_WIRE_10 = SYNTHESIZED_WIRE_23 | SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_3 =  ~SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_24 ^ SYNTHESIZED_WIRE_23;


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_25)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_23 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_25)
	begin
	SYNTHESIZED_WIRE_23 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_23 <= OUT;
	end
end


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_25)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_24 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_25)
	begin
	SYNTHESIZED_WIRE_24 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_24 <= IN;
	end
end


assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_26;


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_27)
begin
if (!CLRN)
	begin
	CLOSE <= 0;
	end
else
if (!SYNTHESIZED_WIRE_27)
	begin
	CLOSE <= 1;
	end
else
	begin
	CLOSE <= SYNTHESIZED_WIRE_5;
	end
end


assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_24 | SYNTHESIZED_WIRE_26;


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_27)
begin
if (!CLRN)
	begin
	OPEN <= 0;
	end
else
if (!SYNTHESIZED_WIRE_27)
	begin
	OPEN <= 1;
	end
else
	begin
	OPEN <= DFF_inst6;
	end
end


Counter_Up_Down_4bit	b2v_inst20(
	.CIN(SYNTHESIZED_WIRE_9),
	.DNUP(SYNTHESIZED_WIRE_10),
	.CLRN(CLRN),
	.clk(clk),
	.QA(SYNTHESIZED_WIRE_28),
	.QB(SYNTHESIZED_WIRE_30),
	.QC(SYNTHESIZED_WIRE_29),
	.QD(SYNTHESIZED_WIRE_31));

assign	SYNTHESIZED_WIRE_5 = ~(SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_30 | SYNTHESIZED_WIRE_31);


always@(posedge SYNTHESIZED_WIRE_15 or negedge CLRN or negedge SYNTHESIZED_WIRE_27)
begin
if (!CLRN)
	begin
	DFF_inst6 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_27)
	begin
	DFF_inst6 <= 1;
	end
else
	begin
	DFF_inst6 <= SYNTHESIZED_WIRE_16;
	end
end

assign	SYNTHESIZED_WIRE_26 = SYNTHESIZED_WIRE_18 & T & ENT;

assign	SYNTHESIZED_WIRE_18 = ~(SYNTHESIZED_WIRE_28 & SYNTHESIZED_WIRE_31 & SYNTHESIZED_WIRE_30 & SYNTHESIZED_WIRE_29);

assign	SYNTHESIZED_WIRE_0 =  ~SYNTHESIZED_WIRE_24;


endmodule
