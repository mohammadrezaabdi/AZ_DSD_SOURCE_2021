
module Comp_1bit (a,
                  b,
                  lgn_in,
                  e_in,
                  lgn_out,
                  e_out,
                  );
    input a, b, gin, e_in, lgn_in;
    output lgn_out, e_out;
    
    assign lgn_out = (~e_in & lgn_in) | (e_in & ~a & b);
    assign e_out   = (e_in & ~(a ^ b));

endmodule //Comp_1bit
