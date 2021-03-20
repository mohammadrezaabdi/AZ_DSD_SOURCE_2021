// digits are comming from MSB (right to left)
module Comp_seq (a,
                 b,
                 reset,
                 lgn_out,
                 e_out,
                 );
    input a, b, reset;
    output lgn_out, e_out;
    
    assign lgn_out = ~reset & ((~e_out & lgn_out) | (e_out & ~a & b));
    assign e_out   = reset | (e_out & ~(a ^ b));
    
endmodule //Comp_seq
