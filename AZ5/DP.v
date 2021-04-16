`define ST_INIT     3'b000
`define ST_ADD      3'b001
`define ST_SUB      3'b010
`define ST_SHIFT    3'b011
`define ST_CHOOSE   3'b100

module DP (control,
           IN1,
           IN2,
           OUT,
           status,
           EF,
           rstn,
           clk);
    parameter BIT_LEN = 4;
    
    input [2:0]control;
    input [BIT_LEN-1:0]IN1;
    input [BIT_LEN-1:0]IN2;
    input clk, rstn;
    
    output [2*BIT_LEN-1:0]OUT;
    output [2:0]status;
    output EF;
    output reg BO;
    
    reg [BIT_LEN-1:0] A, B, X;
    reg[$clog2(BIT_LEN):0] cont;
    
    assign OUT    = (EF)? {X,B}: OUT;
    assign status = {B[0], BO,EF};
    assign EF     = (cont == 0);
    
    always @(posedge clk, negedge rstn) begin
        if (!rstn) begin
            A    <= IN1;
            B    <= IN2;
            X    <= 0;
            cont <= BIT_LEN;
            BO   <= 0;
        end
        else begin
            case (control)
                `ST_INIT:
                begin
                    cont <= BIT_LEN;
                    A    <= IN1;
                    B    <= IN2;
                    X    <= 0;
                    BO   <= 0;
                end
                `ST_ADD:
                begin
                    X <= X + A;
                end
                `ST_SUB:
                begin
                    X <= X - A;
                end
                `ST_SHIFT:
                begin
                    BO    <= B[0];
                    {X,B} <= {X[BIT_LEN-1], X, B[BIT_LEN-1:1]};
                    cont  <= cont - 1;
                end
                `ST_CHOOSE:
                begin
                    //do nothing
                end
            endcase
        end
    end
    
endmodule
