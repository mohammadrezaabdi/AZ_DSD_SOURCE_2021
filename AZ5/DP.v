`define ST_INIT     2'b00
`define ST_ADD      2'b10
`define ST_SUB      2'b11
`define ST_SHIFT    2'b11


module DP (state, IN1,IN2, OUT, signal);
    parameter BIT_LEN = 4;
    
    input [1:0]state;
    input [BIT_LEN-1:0]IN1;
    input [BIT_LEN-1:0]IN2;

    output [2*BIT_LEN-1:0]OUT;
    output [1:0]signal;

    reg [BIT_LEN-1:0]A;
    reg [BIT_LEN-1:0]B;
    reg [BIT_LEN-1:0]X;
    
    integer count;
    wire FIN;
    
    assign OUT = {X,B};
    assign FIN = (count == 0);
    assign signal = {B[0],FIN};
    
    always @(state) begin
        case (state)
            `ST_INIT:
            begin
                count = BIT_LEN;
                A = IN1;                
                B = IN2;
                X = 0;
            end
            `ST_ADD:
            begin
                X=X+A;
            end
            `ST_SUB:
                X=X-A;
            
            `ST_SHIFT:
            begin
                {X,B} = {X[BIT_LEN-1],X,B[BIT_LEN-1:1]};
                count = count -1; 
            end
        endcase
    end

endmodule
