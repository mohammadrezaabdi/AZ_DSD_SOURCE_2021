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
// CREATED		"Tue Mar 16 01:22:52 2021"

module JK_FllpFiop(
	CLRN,
	J,
	CLK,
	K,
	QN,
	Q
);


input wire	CLRN;
input wire	J;
input wire	CLK;
input wire	K;
output wire	QN;
output wire	Q;

wire	SYNTHESIZED_WIRE_0;
reg	JKFF_2;

assign	Q = JKFF_2;
assign	SYNTHESIZED_WIRE_0 = 1;




always@(posedge CLK or negedge CLRN or negedge SYNTHESIZED_WIRE_0)
begin
if (!CLRN)
	begin
	JKFF_2 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_0)
	begin
	JKFF_2 <= 1;
	end
else
	begin
	JKFF_2 <= ~JKFF_2 & J | JKFF_2 & ~K;
	end
	end
end

assign	QN =  ~JKFF_2;



endmodule
