

module DP (control,
           IN1,
           IN2,
           OUT,
           status,
           EF,
           clk);
    parameter BIT_LEN = 4;
    
    input [9:0]control;
    input [BIT_LEN-1:0]IN1;
    input [BIT_LEN-1:0]IN2;
    input clk;
    
    output [2*BIT_LEN-1:0]OUT;
    output [1:0]status;
    output reg EF;
    
    reg [BIT_LEN-1:0] A, B, X;
    wire LD_A, LD_B, LD_CONT, SET_EF, RST_X, RST_EF, SUB_X, ADD_X, SUB_CONT, SHIFT_XB;
    
    integer cont;
    
    assign OUT    = {X,B};
    assign status = {B[0],(cont == 0)};
    
    assign { LD_A, LD_B, LD_CONT, SET_EF, RST_X, RST_EF, SUB_X, SUB_CONT, ADD_X, SHIFT_XB} = control[9:0];
    
    // assign A    = (LD_A)? IN1: A;
    // assign B    = (SHIFT_XB)? {X[0],B[BIT_LEN-1:1]}: ((LD_B)? IN2: A);
    // assign cont = (LD_CONT)? cont:(SUB_CONT)? cont - 1 : cont;
    // assign EF   = (SET_EF)? 1:(RST_EF)? 0: EF;
    // assign X    = (SHIFT_XB)? {X[BIT_LEN-1],X[BIT_LEN-1:1]}: ((ADD_X)? X + A:((SUB_X)? X - A: ((RST_X)? 0: X)));
    
    always @(*) begin
        if (LD_A) A        = IN1;
        if (LD_B) B        = IN2;
        if (LD_CONT) cont  = 2 * BIT_LEN - 2;
        if (SET_EF) EF     = 1;
        if (RST_X) X       = 0;
        if (RST_EF) EF     = 0;
        if (ADD_X) X       = X + A;
        if (SUB_X) X       = X - A;
        if (SUB_CONT) cont = cont - 1;
        if (control) {X,B} = {X[BIT_LEN-1],X,B[BIT_LEN-1:1]};
        // $display("control:%b, LD_A:%b, LD_B:%b, LD_CONT:%b, SET_EF:%b, RST_X:%b, RST_EF:%b, SUB_X:%b, SUB_CONT:%b, ADD_X:%b, SHIFT_XB:%b",control, LD_A, LD_B, LD_CONT, SET_EF, RST_X, RST_EF, SUB_X, SUB_CONT, ADD_X, SHIFT_XB);
    end
    
    // always @(posedge clk) begin
    //     if (SUB_CONT) cont = cont - 1;
    //     if (control) {X,B} = {X[BIT_LEN-1],X,B[BIT_LEN-1:1]};
    // end
    
endmodule
