`timescale 1ns/1ps
`define NULL 0
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
    
    integer data_file;
    integer scan_file;
    integer seed;
    initial begin
        data_file = $fopen("seed.dat", "r");
        if (data_file == `NULL) begin
            $display("data_file handle was NULL");
            $finish;
        end
        scan_file = $fscanf(data_file, "%d", seed);
        if (scan_file == `NULL) begin
            $display("integer read error");
            $finish;
        end
    end
    
    
    
    integer i, j;
    initial begin
        
        #2 // waiting for reading random seed from file "seed.dat"
        $display("combinational comparator module test:");
        for (i = 0; i < 16; i = i + 1) begin
            a = {$random(seed)}%16;
            b = {$random(seed)}%16;
            #1
            $display(i, "   A:%d  B:%d  G:%b  E:%b, L:%b", a, b, g, e, l);
        end
        
        $display("sequantial comparator module test:");
        for (i = 0; i < 16; i = i + 1) begin
            reset = 1;
            #2;
            $display("reset module  -->  G:%b  E:%b, L:%b", G, E, L);
            j = {$random(seed)}%20+1;
            while (j > 0) begin
                reset = 0;
                A     = {$random(seed)}%2;
                B     = {$random(seed)}%2;
                #2
                $display($time, "   A:%d  B:%d  G:%b  E:%b, L:%b", A, B, G, E, L);
                j = j - 1;
            end
        end
        
        $finish;
    end
    
endmodule
