

module DP (control,
           IN1,
           IN2,
           OUT,
           status,
           EF,
           rstn);
    parameter BIT_LEN = 4;
    
    input [9:0]control;
    input [BIT_LEN-1:0]IN1;
    input [BIT_LEN-1:0]IN2;
    input rstn;
    
    output [2*BIT_LEN-1:0]OUT;
    output [1:0]status;
    output EF;
    
    reg [BIT_LEN-1:0]A;
    reg [BIT_LEN-1:0]B;
    reg [BIT_LEN-1:0]X;
    reg EF;
    wire LD_A, LD_B, LD_CONT, RST_X, SUB_X, ADD_X, SUB_CONT, SHIFT_XB;
    
    integer cont;
    reg FIN;
    reg B0;
    
    assign OUT                                                                             = {X,B};
    assign status                                                                          = {B0,FIN};
    assign { LD_A, LD_B, LD_CONT, SET_EF, RST_X, RST_EF, SUB_X, SUB_CONT, ADD_X, SHIFT_XB} = control;
    
    always @(control or negedge rstn) begin
        if (!rstn) begin
            FIN = 0;
            B0  = IN2[0];
        end
        else begin
            if (LD_A) A         = IN1;
            if (LD_B) B         = IN2;
            if (LD_CONT) cont   = 2*BIT_LEN;
            if (SET_EF) EF      = 1;
            if (RST_X) X        = 0;
            if (RST_EF) EF      = 0;
            if (ADD_X) X        = X+A;
            if (SUB_X) X        = X-A;
            if (SUB_CONT) cont  = cont -1;
            if (SHIFT_XB) {X,B} = {X[BIT_LEN-1],X,B[BIT_LEN-1:1]};
            
            B0  = B[0];
            FIN = (cont == 0);
        end
    end
    
endmodule
