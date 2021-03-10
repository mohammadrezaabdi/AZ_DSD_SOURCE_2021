module testbench;

	reg IN, OUT, ENT, clk, T, CLRN;
	wire OPEN, CLOSE;
	integer i;
	
	Main main(
	IN,
	OUT,
	ENT,
	clk,
	T,
	CLRN,
	OPEN,
	CLOSE
	);
	
	initial begin
		clk = 0;
		forever clk = #5 ~clk;
	end

	
	initial begin
		CLRN = 0;
		OUT = 0;
		
		for (i=0; i<20;i=i+1) begin
			#10
			IN = 0;
			#50
			CLRN = 1;
			T = 1;
			ENT = 1;
			#50
			ENT = 0;
			IN = 1;
			// OUT = 1;
		end
		// #50
		// CLRN = 1;
		// T = 1;
		// ENT = 1;
		// #50
		// ENT = 0;
		// IN = 1;
		// #50
		$stop;
	end
	
	initial
		$monitor($time, "	counter:%b%b%b%b, IN:%b, OUT:%b, ENT:%b, T:%b, CLRN:%b, OPEN:%b, CLOSE:%b", main.b2v_inst.QD, main.b2v_inst.QC, main.b2v_inst.QB, main.b2v_inst.QA, IN, OUT, ENT, T, CLRN, OPEN, CLOSE);
	

endmodule