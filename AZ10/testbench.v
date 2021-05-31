module testbench();
    
    parameter CLK_C       = 10;
    parameter DATA_LEN    = 8;
    parameter ADDR_LEN    = 8;
    parameter INST_CAP    = 20;
    parameter INST_LEN    = 12;
    parameter WORD_LEN    = 8;
    parameter MEM_SIZE    = 256;
    parameter STACK_DEPTH = 8;
    
    reg clk, rstn;
    
    CPU #(
    .WORD_LEN(WORD_LEN),
    .DATA_LEN(DATA_LEN),
    .ADDR_LEN(ADDR_LEN),
    .MEM_SIZE(MEM_SIZE),
    .STACK_DEPTH(STACK_DEPTH),
    .INST_LEN(INST_LEN),
    .INST_CAP(INST_CAP)
    ) cpu0 (
    .clk(clk),
    .rstn(rstn)
    );
    
    initial begin
        $dumpfile("report/waveform.vcd");
        $dumpvars(0,cpu0);
    end
    
    initial begin
        clk         = 0;
        forever clk = #(CLK_C/2) ~clk;
    end
    
    initial begin
        $readmemb("report/memory.mem", cpu0.memory0.mem, 0, MEM_SIZE-1);
        $readmemb("report/is.mem", cpu0.ifidc0.inst_mem, 0, INST_CAP-1);
    end
    
    initial begin
        rstn = 0;
        #CLK_C
        rstn = 1;
        #(100000 * CLK_C);
        $finish;
    end
    
endmodule
