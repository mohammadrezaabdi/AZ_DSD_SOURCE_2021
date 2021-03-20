module testbench();
    reg [3:0] a, b;
    reg A, B;
    reg reset, clk;
    wire g, e, l, G, E, L;
    
    Comp_4bit_comb comp0(
    .a(a),
    .b(b),
    .gout(g),
    .eout(e),
    .lout(l)
    );
    
    Comp_4bit_seq comp1(
    .a(A),
    .b(B),
    .reset(reset),
    .gout(G),
    .eout(E),
    .lout(L)
    );
    
    always
    begin
    clk            = 0;
    forever #1 clk = ~clk;
    end
    
    integer i, j;
    initial begin
        
        $display("combinational comparator module test:");
        for (i = 0; i < 16; i = i + 1) begin
            a = $urandom % 16;
            b = $urandom % 16;
            #1
            $display(i, "   A:%d  B:%d  G:%b  E:%b, L:%b", a, b, g, e, l);
        end
        
        $display("sequantial comparator module test:");
        for (i = 0; i < 16; i = i + 1) begin
            reset = 1;
            #2;
            $display("reset module  -->  G:%b  E:%b, L:%b", G, E, L);
            for (j = $urandom % 20 + 1; j > 0 ; j = j - 1) begin
                reset = 0;
                A     = $urandom % 2;
                B     = $urandom % 2;
                #2
                $display($time, "   A:%d  B:%d  G:%b  E:%b, L:%b", A, B, G, E, L);
            end
        end
        
        $finish;
    end
    
endmodule
