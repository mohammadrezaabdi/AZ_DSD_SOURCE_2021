module testbench;
	parameter clk_c = 10;
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
		forever clk = #(clk_c/2) ~clk;
	end

	
	initial begin
		CLRN = 0;
		OUT = 0;
		T = 1;
		#clk_c	CLRN = 1;
		
		// filling up the room
		$display("filling up the room!");
		fill;

		// room capasity limit
		$display("trying to enter the room after its getting filled");
		req_enter;
		
		// exiting from room
		$display("exiting the room");
		exit;

		$display("trying to enter the room again after one person left the room");
		req_enter;

		$display("entering the room");
		enter;

		// clear the room
		$display("making the room clear again");
		empty;
		
		// visiting time is over
		#(clk_c) T=0;

		// trying to enter the room after the visiting hour
		$display("trying to enter the room after the visiting hour");
		req_enter;

		
		
		#2000 T=T;
		$finish;
	end
	
	initial
		$monitor($time, "	counter:%b%b%b%b, IN:%b, OUT:%b, ENT:%b, T:%b, CLRN:%b, OPEN:%b, CLOSE:%b", main.b2v_inst.QD, main.b2v_inst.QC, main.b2v_inst.QB, main.b2v_inst.QA, IN, OUT, ENT, T, CLRN, OPEN, CLOSE);
	

	task enter;
	begin
		IN = 0;
		ENT = 0;
		#clk_c ENT = 1;
		#clk_c 
			IN = 1;
			ENT = 0;
		#clk_c IN = 0;
	end
	endtask
	
	task req_enter;
	begin
		IN = 0;
		ENT = 0;
		#clk_c ENT = 1;
		#clk_c
			ENT = 0;
		#clk_c IN = 0;
	end
	endtask
	
	task exit;
	begin
		OUT = 0;
		#clk_c OUT = 1;
		#clk_c OUT = 0;
	end
	endtask

	task fill;
	begin
		for (i=0; i<15;i=i+1) begin
			enter;
		end
	end
	endtask
	
	task empty;
	begin
		for (i=0; i<15;i=i+1) begin
			exit;
		end
	end
	endtask
	
	
endmodule