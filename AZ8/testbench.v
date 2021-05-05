module testbench();
    
    parameter PART_LEN  = 16;
    parameter WORD_SIZE = 32;
    parameter ADDR_LEN  = 5;
    parameter MEM_SIZE  = 32;
    parameter INST_LEN  = 17;
    parameter INST_CAP  = 5;
    parameter clk_c     = 10;
    
    reg clk, rstn;
    
    PIPELINE #(
    .PART_LEN(PART_LEN),
    .WORD_SIZE(WORD_SIZE),
    .ADDR_LEN(ADDR_LEN),
    .MEM_SIZE(MEM_SIZE),
    .INST_LEN(INST_LEN),
    .INST_CAP(INST_CAP)
    ) pipe (
    .clk(clk),
    .rstn(rstn)
    );
    
    
    initial begin
        $dumpfile("report/waveform.vcd");
        $dumpvars(0,pipe);
    end
    
    initial begin
        clk         = 0;
        forever clk = #(clk_c/2) ~clk;
    end
    
    initial begin
        $readmemb("report/memory.mem", pipe.memory.mem, 0, MEM_SIZE-1);
        $readmemb("report/is.mem", pipe.ifm.inst_mem, 0, INST_CAP-1);
    end
    
    initial begin
        rstn = 0;
        #clk_c
        rstn = 1;
        #(10*clk_c);
        $writememb("report/result.mem", pipe.memory.mem);
        $finish;
    end
    
endmodule
