module Stack (rstn,
              data_in,
              push,
              pop,
              clk,
              data_out,
              full,
              empty);
    
    parameter DEPTH     = 8;
    parameter BANDWIDTH = 8;
    
    input wire rstn, push, pop, clk;
    input wire[BANDWIDTH-1:0] data_in;
    output full, empty;
    output reg [BANDWIDTH-1:0] data_out;
    
    reg[$clog2(DEPTH):0] stack_ptr;
    reg[BANDWIDTH-1:0] memory [0:DEPTH-1];
    
    assign empty = (stack_ptr == 0) ? 1'b1 : 1'b0;
    assign full  = (stack_ptr == DEPTH) ? 1'b1 : 1'b0;
    
    // stack reset
    task reset_memory;
        integer i;
        begin
            for (i = 0; i < DEPTH;i++) begin
                memory[i] = {BANDWIDTH{1'b0}};
            end
            stack_ptr = 0;
        end
    endtask
    
    always @(posedge clk or negedge rstn) begin
        if (rstn) begin
            reset_memory;
        end
        else begin
            // pushing into stack 
            if (push && !pop && !full) begin
                memory[stack_ptr] = data_in;
                stack_ptr         = stack_ptr + 1;
            end
            // pop from stack
            if (pop && !push && !empty) begin
                data_out  = memory[stack_ptr - 1];
                stack_ptr = stack_ptr - 1;
            end
        end
    end
endmodule
