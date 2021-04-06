module dff(q,
           clk,
           d);
    input clk,d;
    output q;
    
    wire x,y,qp;
    
    assign x  = ~(clk & d);
    assign y  = ~(clk & x);
    assign q  = ~(qp & x);
    assign qp = ~(q & y);

endmodule
