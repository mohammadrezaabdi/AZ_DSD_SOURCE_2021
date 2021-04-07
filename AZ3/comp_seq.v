// digits are comming from MSB (right to left)
module Comp_seq (a,
                 b,
                 reset,
                 lgn_out,
                 e_out,
                 clk);

    input a, b, reset, clk;
    output lgn_out, e_out;
    
    wire y_lgn_out, x_lgn_out, qp_lgn_out;
    wire y_e_out, x_e_out, qp_e_out;
    
    
    // lgn_out dff implementation
    assign x_lgn_out  = ~(clk & (~reset & ((~e_out & lgn_out) | (e_out & ~a & b))));
    assign y_lgn_out  = ~(clk & x_lgn_out);
    assign lgn_out    = ~(qp_lgn_out & x_lgn_out);
    assign qp_lgn_out = ~(lgn_out & y_lgn_out);
    
    
    // e_out dff implementaion
    assign x_e_out  = ~(clk & reset | (e_out & ~(a ^ b)));
    assign y_e_out  = ~(clk & x_e_out);
    assign e_out    = ~(qp_e_out & x_e_out);
    assign qp_e_out = ~(e_out & y_e_out);
    
endmodule //Comp_seq
