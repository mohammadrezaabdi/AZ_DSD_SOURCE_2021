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
		sleep;

		// room capasity limit
		$display("trying to enter the room after its getting filled");
		req_enter;
		sleep;

		// exiting from room
		$display("exiting the room");
		exit;
		sleep;

		// entering the room again
		$display("trying to enter the room again after one person left the room");
		req_enter;

		$display("just wating for a friend!");
		sleep;
		$display($time, "	counter:%b%b%b%b, IN:%b, OUT:%b, ENT:%b, T:%b, CLRN:%b, OPEN:%b, CLOSE:%b", main.b2v_inst20.QD, main.b2v_inst20.QC, main.b2v_inst20.QB, main.b2v_inst20.QA, IN, OUT, ENT, T, CLRN, OPEN, CLOSE);


		$display("entering the room");
		enter;
		sleep;

		// clear the room
		$display("shouting every one out!");
		empty;
		sleep;

		// mester A enters the room
		$display("mester A enters the room!");
		full_enter;
		sleep;

		// mester B enters while A leaves the room
		$display("mester B enters while A leaves the room!");
		ENT = 1;
		#(clk_c)
		ENT = 0;
		IN = 1;
		OUT = 1;
		#(clk_c)
		IN = 0;
		OUT = 0;

		// visiting time is over
		#(clk_c) T=0;

		// trying to enter the room after the visiting hour
		$display("trying to enter the room after the visiting hour");
		req_enter;

		// trying to bypass the door system and enter when the door closed!
		$display("trying to bypass the door system and enter when the door closed!");
		enter;
		
		sleep;
		$finish;
	end
	
	initial
		$monitor($time, "	counter:%b%b%b%b, IN:%b, OUT:%b, ENT:%b, T:%b, CLRN:%b, OPEN:%b, CLOSE:%b", main.b2v_inst20.QD, main.b2v_inst20.QC, main.b2v_inst20.QB, main.b2v_inst20.QA, IN, OUT, ENT, T, CLRN, OPEN, CLOSE);
	

	task full_enter;
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
	
	task enter;
	begin
		IN = 0;
		#clk_c IN = 1;
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
			full_enter;
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

	task sleep;
	begin
		#(10*clk_c) T=T;
	end
	endtask

	
	
	
endmodule