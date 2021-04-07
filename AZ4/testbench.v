module testbench;

       parameter clk_c = 10;
       parameter BANDWIDTH = 4;
       parameter DEPTH = 8;
       reg rstn, s_push, s_pop, clk;
       reg[BANDWIDTH-1:0] data_in;
       wire full, empty;
       wire [BANDWIDTH-1:0] data_out;
       integer i;

       Stack #(.DEPTH(DEPTH),.BANDWIDTH(BANDWIDTH)) stack0 (
        .rstn(rstn),
        .data_in(data_in),
        .push(s_push),
        .pop(s_pop),
        .clk(clk),
        .data_out(data_out),
        .full(full),
        .empty(empty));
    
    
    initial begin
        clk         = 0;
        forever clk = #(clk_c/2) ~clk;
    end
    
    initial begin
        rstn = 1;
        #clk_c    rstn = 0;

        // fill the stack    
        $display("fill the stack");    
        for (i=0; i<DEPTH;i=i+1) begin
            #clk_c push(i+1);
        end

        // try to push again: stack is full
        $display("try to push again: stack is full");
        #clk_c push(4'b1001);
        
        // empty stack
        $display("empty stack");
        for (i=0; i<DEPTH;i=i+1) begin
            #clk_c pop;
        end
        
        // try to pop again: stack is empty
        $display("try to pop again: stack is empty");
        #clk_c pop;

        $finish;
                    
    end

    initial
        $monitor($time,"\tpush=%b, pop=%b, data_in=%d, stack_ptr=%d, empty=%b, full=%b, data_out=%d", s_push, s_pop, data_in, stack0.stack_ptr, empty, full, data_out);


        
    task push;
        input [BANDWIDTH-1:0]data;
        begin
            s_push    = 0;
            s_pop     = 0;
            rstn    = 1;
            data_in = data;
            #clk_c
            s_push = 1;
        end
    endtask
    
    task pop;
        begin
            s_push       = 0;
            s_pop        = 0;
            rstn       = 1;
            #clk_c
            s_pop = 1;
        end
    endtask
    
endmodule //testbench
