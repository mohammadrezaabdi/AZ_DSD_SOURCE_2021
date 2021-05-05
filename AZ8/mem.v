module MEMORY_UNIT (r_addr1,
                    r_addr2,
                    w_addr,
                    r_en,
                    w_en,
                    data_out1,
                    data_out2,
                    data_in,
                    clk);
    
    parameter ADDR_LEN  = 5;
    parameter WORD_SIZE = 32;
    parameter MEM_SIZE  = 32;
    
    
    input [ADDR_LEN-1:0]r_addr1,r_addr2,w_addr;
    input r_en,w_en,clk;
    
    input [WORD_SIZE-1:0]data_in;
    output reg [WORD_SIZE-1:0]data_out1,data_out2;
    
    reg [WORD_SIZE-1:0] mem [MEM_SIZE-1:0];
    
    reg [WORD_SIZE-1:0] data_o1,data_o2;
    
    always @(*)
    begin
        if (r_en) begin
            data_out1 <= mem[r_addr1];
            data_out2 <= mem[r_addr2];
        end
        if (w_en) begin
            mem[w_addr] <= data_in;
        end
        $display($time, "\t [MEM] r_en = %b, r_addr1 = %d, r_addr2 = %d, w_addr = %d, w_en = %b, data_in = %b, data_out1 = %b, data_out2 = %b", r_en, r_addr1, r_addr2, w_addr, w_en, data_in, data_out1, data_out2);
    end
    
endmodule
