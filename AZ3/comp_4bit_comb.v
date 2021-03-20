module Comp_4bit_comb (a,
                       b,
                       gout,
                       eout,
                       lout);
    input [3:0] a, b;
    output gout, eout, lout;
    wire [3:0] a, b;
    wire gout, eout, lout;
    wire g0, e0, l0, g1, e1, l1, g2, e2, l2;
    wire zero = 0;
    
    Comp_1bit comp0(
    .a(a[0]),
    .b(b[0]),
    .gin(g0),
    .ein(e0),
    .lin(l0),
    .gout(gout),
    .eout(eout),
    .lout(lout)
    );
    
    Comp_1bit comp1(
    .a(a[1]),
    .b(b[1]),
    .gin(g1),
    .ein(e1),
    .lin(l1),
    .gout(g0),
    .eout(e0),
    .lout(l0)
    );
    
    Comp_1bit comp2(
    .a(a[2]),
    .b(b[2]),
    .gin(g2),
    .ein(e2),
    .lin(l2),
    .gout(g1),
    .eout(e1),
    .lout(l1)
    );
    
    Comp_1bit comp3(
    .a(a[3]),
    .b(b[3]),
    .gin(zero),
    .ein(zero),
    .lin(zero),
    .gout(g2),
    .eout(e2),
    .lout(l2)
    );
    
endmodule //Comp_4bit
