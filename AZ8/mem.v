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
    output [WORD_SIZE-1:0]data_out1,data_out2;
    
    reg [WORD_SIZE-1:0] mem [MEM_SIZE-1:0];
    
    reg [WORD_SIZE-1:0] data_o1,data_o2;
    
    
    assign data_out1 = (r_en) ? mem[r_addr1] : data_out1;
    assign data_out2 = (r_en) ? mem[r_addr2] : data_out2;
    
    always @(posedge w_en)
    begin
        if (w_en) begin
            mem[w_addr] <= data_in;
        end
    end
    
endmodule
