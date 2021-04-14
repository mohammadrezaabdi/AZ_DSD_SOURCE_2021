`timescale 1ns/1ps
`define NULL 0
module testbench();
    reg [3:0] a, b;
    reg A, B;
    reg reset, clk;
    wire lgn, e, LGN, E;
    
    Comp_comb #(.BIT_LEN(4)) comp0(
    .a(a),
    .b(b),
    .lgn_in(1'b0),
    .e_in(1'b1),
    .lgn_out(lgn),
    .e_out(e)
    );
    
    Comp_seq comp1(
    .a(A),
    .b(B),
    .reset(reset),
    .lgn_out(LGN),
    .e_out(E),
    .clk(clk)
    );
    
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,comp1);
        $dumpvars(0,comp0);
        
    end

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
            $display(i, "   A:%d  B:%d  LGN:%b  EQ:%b", a, b, lgn, e);
        end
        
        $display("sequantial comparator module test:");
        for (i = 0; i < 16; i = i + 1) begin
            A     = 0;
            B     = 0;
            reset = 1;
            #2;
            $display("reset module  -->  LGN:%b  EQ:%b", LGN, E);
            j = {$random(seed)}%20+1;
            while (j > 0) begin
                A     = {$random(seed)}%2;
                B     = {$random(seed)}%2;
                reset = 0;
                #2
                $display($time, "   A:%d  B:%d  LGN:%b  EQ:%b", A, B, LGN, E);
                j = j - 1;
            end
        end
        
        $finish;
    end
    
endmodule
