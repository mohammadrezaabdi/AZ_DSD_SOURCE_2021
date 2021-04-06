module Comp_comb (a, b, lgn_in, e_in, lgn_out, e_out,);
    parameter BIT_LEN = 4;
    input wire [BIT_LEN-1:0] a, b;
    input wire lgn_in, e_in;
    output lgn_out, e_out;
    
    wire [BIT_LEN:0] lgn, e;
    
    assign lgn[BIT_LEN] = lgn_in;
    assign e[BIT_LEN]   = e_in;
    assign lgn_out      = lgn[0];
    assign e_out        = e[0];
    
    genvar i;
    generate
    for (i = BIT_LEN - 1 ; i >= 0; i = i - 1) begin
        Comp_1bit c1b(
        .a(a[i]),
        .b(b[i]),
        .lgn_in(lgn[i+1]),
        .lgn_out(lgn[i]),
        .e_in(e[i+1]),
        .e_out(e[i])
        );
    end
    endgenerate
    
endmodule //Comp_4bit
