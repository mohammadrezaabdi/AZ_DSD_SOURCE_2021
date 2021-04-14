module CU(clk,
          status,
          control,
          rstn,
          start);
    
    input [1:0] status;
    input clk, rstn, start;
    output [9:0] control;
    
    wire B0, FIN;
    wire LD_A, LD_B, LD_CONT, SET_EF, RST_X,RST_EF, SUB_X, SUB_CONT, ADD_X, SHIFT_XB;
    wire INIT, ADD, SUB, SHIFT1, SHIFT2;
    reg INIT_D, ADD_D, SUB_D, SHIFT1_D, SHIFT2_D;
    
    assign B0      = status[1];
    assign FIN     = status[0];
    assign control = { LD_A, LD_B, LD_CONT, SET_EF, RST_X, RST_EF, SUB_X, SUB_CONT, ADD_X, SHIFT_XB};
    
    assign    LD_A    = (INIT && start);
    assign    LD_B    = (INIT && start);
    assign   LD_CONT  = (INIT && start);
    assign    SET_EF  = ((SHIFT1 || SHIFT2) && FIN);
    assign    RST_X   = (INIT && start);
    assign    RST_EF  = (INIT && start);
    assign    SUB_X   = (SUB);
    assign    ADD_X   = (ADD);
    assign   SHIFT_XB = (SHIFT1 || SHIFT2);
    assign   SUB_CONT = (SHIFT1 || SHIFT2);
    
    always @(INIT or ADD or SUB or SHIFT1 or SHIFT2 or FIN or B0 or posedge clk or negedge rstn) begin
        if (!rstn) begin
            INIT_D   = 1;
            ADD_D    = 0;
            SUB_D    = 0;
            SHIFT1_D = 0;
            SHIFT2_D = 0;
        end
        else begin
            INIT_D   = (INIT && !start) || (SHIFT1 && FIN) || (SHIFT2 && FIN);
            SUB_D    = (INIT && start && B0) || (SHIFT2 && !FIN && B0);
            ADD_D    = (SHIFT1 && !FIN && !B0);
            SHIFT1_D = SUB || (SHIFT1 && !FIN && B0);
            SHIFT2_D = ADD || (INIT && start && !B0) || (SHIFT2 && !FIN && !B0);
        end
    end
    
    DFF init (
    .d(INIT_D),
    .q(INIT),
    .clk(clk)
    );
    
    DFF sub (
    .d(SUB_D),
    .q(SUB),
    .clk(clk)
    );
    
    
    DFF add (
    .d(ADD_D),
    .q(ADD),
    .clk(clk)
    );
    
    
    DFF shift1 (
    .d(SHIFT1_D),
    .q(SHIFT1),
    .clk(clk)
    );
    
    
    DFF shift2 (
    .d(SHIFT2_D),
    .q(SHIFT2),
    .clk(clk)
    );
    
    
endmodule
    
