// digits are comming from MSB (right to left)
module Comp_4bit_seq (a,
                      b,
                      reset,
                      gout,
                      eout,
                      lout);
    input a, b, reset;
    output gout, eout, lout;
    wire a, b, reset, gout, eout, lout;
    
    assign gout = (!reset && !lout && (gout || a > b));
    assign eout = (!reset && !lout && !gout && a == b);
    assign lout = (!reset && !gout && (lout || a < b));
    
endmodule //Comp_4bit_seq
