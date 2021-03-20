
module Comp_1bit (a,
                  b,
                  gin,
                  ein,
                  lin,
                  gout,
                  eout,
                  lout);
    input a, b, gin, ein, lin;
    output gout, eout, lout;
    wire a, b, gin, ein, lin, gout, eout, lout;
    
    assign gout = (~lin & gin) | (~lin & a & ~b);
    assign eout = (~gin & ~lin & a & b) | (~gin & ~lin & ~a & ~b);
    assign lout = (~gin & lin) | (~gin & ~a & b);
endmodule //Comp_1bit
