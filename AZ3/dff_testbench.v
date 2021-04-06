module dff_testbench();
    parameter clk_c = 10;
    reg clk;
    reg d;
    wire q;
    
    dff  dff0 (.d(d),
    .clk (clk),
    .q (q));
    
    
    initial begin
        clk         = 0;
        forever clk = #(clk_c/2) ~clk;
    end
    
    initial begin
        d = 0;
        
        #clk_c
        d = 1;
        
        #clk_c
        d = 0;
        
        #clk_c
        d = 0;
        
        #clk_c
        d = 0;

        $finish;
    end
    
    initial
        $monitor($time, "\tclk:%b, D:%b, Q:%b", clk, d, q);
endmodule
