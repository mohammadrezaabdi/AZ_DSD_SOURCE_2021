module WB (dst_addr_i,
           data_i,
           clk,
           dst_addr_o,
           data_o,
           w_en);
    
    parameter ADDR_LEN  = 5;
    parameter WORD_SIZE = 32;
    
    input [ADDR_LEN-1:0]dst_addr_i;
    input [WORD_SIZE-1:0]data_i;
    input clk;
    
    output [ADDR_LEN-1:0]dst_addr_o;
    output [WORD_SIZE-1:0]data_o;
    output w_en;
    
    reg [ADDR_LEN-1:0]dst_addr_out;
    reg [WORD_SIZE-1:0]data_out;
    reg memory_write_mod;
    
    assign dst_addr_o = dst_addr_out;
    assign data_o     = data_out;
    assign w_en       = memory_write_mod;
    
    always @(*)
    begin
        dst_addr_out     <= dst_addr_i;
        data_out         <= data_i;
        memory_write_mod <= !clk;
    end
    
    initial
        $monitor($time, "\t [WB] dst_addr_i = %d, data_i = %b, dst_addr_o = %d, data_o = %b, w_en = %b", dst_addr_i, data_i, dst_addr_o, data_o, w_en);
    
endmodule
