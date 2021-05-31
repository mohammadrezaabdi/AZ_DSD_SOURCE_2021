module MEMORY (addr,
               r_en,
               w_en,
               data_out,
               data_in,
               clk);
    
    parameter ADDR_LEN = 8;
    parameter WORD_LEN = 8;
    parameter MEM_SIZE = 256;
    
    
    input [ADDR_LEN-1:0] addr;
    input r_en,w_en,clk;
    
    input [WORD_LEN-1:0]data_in;
    output reg [WORD_LEN-1:0]data_out;
    
    reg [WORD_LEN-1:0] mem [MEM_SIZE-1:0];
    
    reg [WORD_LEN-1:0] data_o1,data_o2;
    
    always @(*)
    begin
        if (r_en) begin
            data_out <= mem[addr];
        end
        if (w_en) begin
            mem[addr] <= data_in;
        end    
    end
    
    //debugging
    always @(*)
        $display($time, "\t [MEMORY] r_en = %b, addr = %d, w_en = %b, data_in = %b, data_out = %b", r_en, addr, w_en, data_in, data_out);
    
endmodule
