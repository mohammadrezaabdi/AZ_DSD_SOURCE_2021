module testbench();
    
    parameter WORD_SIZE = 8;
    parameter ADDR_LEN  = 8;
    parameter MEM_SIZE  = 256;
    parameter INST_LEN  = 12;
    parameter INST_CAP  = 20;
    parameter clk_c     = 10;
    
    reg clk, rstn;
    
    CPU #(
    .WORD_SIZE(WORD_SIZE),
    .ADDR_LEN(ADDR_LEN),
    .MEM_SIZE(MEM_SIZE),
    .INST_LEN(INST_LEN),
    .INST_CAP(INST_CAP)
    ) cpu (
    .clk(clk),
    .rstn(rstn)
    );
    
    
    initial begin
        $dumpfile("report/waveform.vcd");
        $dumpvars(0,cpu);
    end
    
    initial begin
        clk         = 0;
        forever clk = #(clk_c/2) ~clk;
    end
    
    initial begin
        $readmemb("report/memory.mem", cpu.memory.mem, 0, MEM_SIZE-1);
        $readmemb("report/is.mem", cpu.ifidc.inst_mem, 0, INST_CAP-1);
    end
    
    initial begin
        rstn = 0;
        #clk_c
        rstn = 1;
        #(10*clk_c);
        $writememb("report/result.mem", cpu.memory.mem);
        $finish;
    end
    
endmodule
