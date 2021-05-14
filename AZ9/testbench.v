`define NULL 0
module testbench();
    
    parameter WORD_LEN = 16;
    parameter ADDR_LEN = 4;
    
    parameter clk_c = 10;
    reg rwn, clk;
    reg [WORD_LEN-1:0] word;
    wire [ADDR_LEN-1:0] address;
    reg [ADDR_LEN-1:0] w_addr;
    
    TCAM #(.WORD_LEN(WORD_LEN), .ADDR_LEN(ADDR_LEN)) tcam (
    .word(word),
    .address(address),
    .rwn(rwn),
    .clk(clk)
    );
    
    assign address = (!rwn) ? w_addr : 'bz;
    
    initial begin
        $dumpfile("report/waveform.vcd");
        $dumpvars(0,tcam);
    end
    
    initial begin
        clk         = 0;
        forever clk = #(clk_c/2) ~clk;
    end
    
    initial
        $monitor($time," rwn = %d  word = %b address = %d",rwn,word,address);
    
    initial begin
        #clk_c  rwn = 0; word = 16'b0111xx11_0111xx11; w_addr = 0;
        #clk_c  rwn = 0; word = 16'b11x01001_11x01001; w_addr = 1;
        #clk_c  rwn = 0; word = 16'b01110x11_01110x11; w_addr = 2;
        #clk_c  rwn = 0; word = 16'b1101xx11_1101xx11; w_addr = 3;
        #clk_c  rwn = 1; word = 16'b0111xx11_0111xx11;
        #clk_c  rwn = 1; word = 16'bxxxxxxxx_xxxxxxxx;
        #clk_c  rwn = 1; word = 16'b11xxxx11_11xxxx11;
        #clk_c  rwn = 0; word = 16'b11110101_11110101; w_addr = 0;
        #clk_c  rwn = 0; word = 16'b101xxxxx_101xxxxx; w_addr = 1;
        #clk_c  rwn = 0; word = 16'b10110x11_10110x11; w_addr = 2;
        #clk_c  rwn = 0; word = 16'b0100xx01_0100xx01; w_addr = 3;
        #clk_c  rwn = 1; word = 16'b11xx0101_11xx0101;
        #clk_c  rwn = 1; word = 16'b10011011_10011011;
        #clk_c  rwn = 1; word = 16'b10xxxxxx_10xxxxxx;
        #clk_c  $finish;
    end
    
endmodule
