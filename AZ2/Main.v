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
// CREATED		"Wed Mar 10 15:12:06 2021"

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

wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
reg	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_8;
reg	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_24 = 1;
assign	SYNTHESIZED_WIRE_25 = 0;
assign	SYNTHESIZED_WIRE_28 = 1;
assign	SYNTHESIZED_WIRE_29 = 1;




\4count 	b2v_inst(
	.LDN(SYNTHESIZED_WIRE_24),
	.B(SYNTHESIZED_WIRE_25),
	.A(SYNTHESIZED_WIRE_25),
	.D(SYNTHESIZED_WIRE_25),
	.CIN(SYNTHESIZED_WIRE_4),
	.DNUP(SYNTHESIZED_WIRE_5),
	.CLK(clk),
	.SETN(SYNTHESIZED_WIRE_24),
	.C(SYNTHESIZED_WIRE_25),
	.CLRN(CLRN),
	.QA(SYNTHESIZED_WIRE_30),
	.QB(SYNTHESIZED_WIRE_32),
	.QC(SYNTHESIZED_WIRE_31),
	.QD(SYNTHESIZED_WIRE_33)
	);

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_26 | SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_27 ^ SYNTHESIZED_WIRE_26;


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
	SYNTHESIZED_WIRE_27 <= IN;
	end
end



always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_29)
begin
if (!CLRN)
	begin
	OPEN <= 0;
	end
else
if (!SYNTHESIZED_WIRE_29)
	begin
	OPEN <= 1;
	end
else
	begin
	OPEN <= SYNTHESIZED_WIRE_11;
	end
end


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_29)
begin
if (!CLRN)
	begin
	CLOSE <= 0;
	end
else
if (!SYNTHESIZED_WIRE_29)
	begin
	CLOSE <= 1;
	end
else
	begin
	CLOSE <= SYNTHESIZED_WIRE_13;
	end
end


assign	SYNTHESIZED_WIRE_13 = ~(SYNTHESIZED_WIRE_30 | SYNTHESIZED_WIRE_31 | SYNTHESIZED_WIRE_32 | SYNTHESIZED_WIRE_33);



assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_19 & T & ENT;

assign	SYNTHESIZED_WIRE_19 = ~(SYNTHESIZED_WIRE_30 & SYNTHESIZED_WIRE_33 & SYNTHESIZED_WIRE_32 & SYNTHESIZED_WIRE_31);

assign	SYNTHESIZED_WIRE_8 =  ~SYNTHESIZED_WIRE_27;


endmodule
