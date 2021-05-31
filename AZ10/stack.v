module Stack (rstn,
              data_in,
              push,
              pop,
              clk,
              data_out,
              full,
              empty);
    
    parameter STACK_DEPTH = 8;
    parameter WORD_LEN    = 8;
    
    input wire rstn, push, pop, clk;
    input wire[WORD_LEN-1:0] data_in;
    output full, empty;
    output reg [WORD_LEN-1:0] data_out;
    
    reg[$clog2(STACK_DEPTH):0] stack_ptr;
    reg[WORD_LEN-1:0] memory [0:STACK_DEPTH-1];
    
    assign empty = (stack_ptr == 0) ? 1'b1 : 1'b0;
    assign full  = (stack_ptr == STACK_DEPTH) ? 1'b1 : 1'b0;

    wire [WORD_LEN-1:0]top = memory[stack_ptr-1];
    
    // stack reset
    task reset_memory;
        integer i;
        begin
            for (i = 0; i < STACK_DEPTH;i++) begin
                memory[i] <= {WORD_LEN{1'b0}};
            end
            stack_ptr <= 0;
        end
    endtask
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            reset_memory;
        end
        else begin
            // pushing into stack
            if (push && !pop && !full) begin
                memory[stack_ptr] <= data_in;
                stack_ptr         <= stack_ptr + 1;
            end
            // pop from stack
            if (pop && !push && !empty) begin
                data_out  <= memory[stack_ptr - 1];
                stack_ptr <= stack_ptr - 1;
            end
        end
        
    end
    
    //debugging
    always @(*)
        $display($time, "\t [STACK] rstn = %b, stack_ptr = %d, top = %d, data_in = %d, push = %b, pop = %b, data_out = %d, full = %b, empty = %b", rstn, stack_ptr, top, data_in, push, pop, data_out, full, empty);

endmodule
