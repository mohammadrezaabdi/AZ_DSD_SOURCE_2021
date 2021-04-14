`define ST_INIT     3'b000
`define ST_ADD      3'b001
`define ST_SUB      3'b010
`define ST_SHIFT    3'b011

module DP (control,
           IN1,
           IN2,
           OUT,
           status,
           EF,
           rstn,
           clk);
    parameter BIT_LEN = 4;
    
    input [1:0]control;
    input [BIT_LEN-1:0]IN1;
    input [BIT_LEN-1:0]IN2;
    input clk, rstn;
    
    output [2*BIT_LEN-1:0]OUT;
    output [1:0]status;
    output reg EF;
    
    reg [BIT_LEN-1:0] A, B, X;
    integer cont;
    
    assign OUT    = {X,B};
    assign status = {B[0],(cont == 0)};
    
    always @(posedge clk, negedge rstn) begin
        if (!rstn) begin
            A    <= IN1;
            B    <= IN2;
            X    <= 0;
            cont <= 2 * BIT_LEN;
            EF   <= 0;
        end
        else begin
            case (control)
                `ST_INIT:
                begin
                    cont <= 2 * BIT_LEN;
                    A    <= IN1;
                    B    <= IN2;
                    X    <= 0;
                    EF   <= 0;
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
                    {X,B} <= {X[BIT_LEN-1], X, B[BIT_LEN-1:1]};
                    cont  <= cont - 1;
                    if (cont == 0) begin
                        EF <= 1;
                    end
                end
            endcase
        end
    end
    
endmodule
