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
// CREATED		"Tue Mar 16 00:32:41 2021"

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
output reg	QD;

reg	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_29;
reg	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
reg	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;

assign	QA = SYNTHESIZED_WIRE_27;
assign	QB = SYNTHESIZED_WIRE_35;
assign	QC = SYNTHESIZED_WIRE_30;
assign	SYNTHESIZED_WIRE_33 = 1;



assign	SYNTHESIZED_WIRE_5 =  ~SYNTHESIZED_WIRE_27;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_29 & SYNTHESIZED_WIRE_30;

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_5 & DNUP;

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_31 | SYNTHESIZED_WIRE_32;


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_33)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_27 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_33)
	begin
	SYNTHESIZED_WIRE_27 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_27 <= ~SYNTHESIZED_WIRE_27 & CIN | SYNTHESIZED_WIRE_27 & ~CIN;
	end
	end
end



always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_33)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_35 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_33)
	begin
	SYNTHESIZED_WIRE_35 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_35 <= ~SYNTHESIZED_WIRE_35 & SYNTHESIZED_WIRE_34 | SYNTHESIZED_WIRE_35 & ~SYNTHESIZED_WIRE_34;
	end
	end
end

assign	SYNTHESIZED_WIRE_22 =  ~SYNTHESIZED_WIRE_35;


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_33)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_30 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_33)
	begin
	SYNTHESIZED_WIRE_30 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_30 <= ~SYNTHESIZED_WIRE_30 & SYNTHESIZED_WIRE_36 | SYNTHESIZED_WIRE_30 & ~SYNTHESIZED_WIRE_36;
	end
	end
end

assign	SYNTHESIZED_WIRE_0 =  ~SYNTHESIZED_WIRE_30;


always@(posedge clk or negedge CLRN or negedge SYNTHESIZED_WIRE_33)
begin
if (!CLRN)
	begin
	QD <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_33)
	begin
	QD <= 1;
	end
else
	begin
	QD <= ~QD & SYNTHESIZED_WIRE_37 | QD & ~SYNTHESIZED_WIRE_37;
	end
	end
end

assign	SYNTHESIZED_WIRE_34 = SYNTHESIZED_WIRE_18 & CIN;

assign	SYNTHESIZED_WIRE_36 = SYNTHESIZED_WIRE_19 & CIN;

assign	SYNTHESIZED_WIRE_37 = SYNTHESIZED_WIRE_20 & CIN;

assign	SYNTHESIZED_WIRE_32 = SYNTHESIZED_WIRE_27 & SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_21 =  ~DNUP;

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_22 & SYNTHESIZED_WIRE_31;

assign	SYNTHESIZED_WIRE_19 = SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_29;

assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_32 & SYNTHESIZED_WIRE_35;


endmodule
