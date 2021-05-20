module MEMORY (r_addr,
                    w_addr,
                    r_en,
                    w_en,
                    data_out,
                    data_in,
                    clk);
    
    parameter ADDR_LEN  = 5;
    parameter WORD_SIZE = 32;
    parameter MEM_SIZE  = 32;
    
    
    input [ADDR_LEN-1:0]r_addr,w_addr;
    input r_en,w_en,clk;
    
    input [WORD_SIZE-1:0]data_in;
    output reg [WORD_SIZE-1:0]data_out;
    
    reg [WORD_SIZE-1:0] mem [MEM_SIZE-1:0];
    
    reg [WORD_SIZE-1:0] data_o1,data_o2;
    
    always @(*) //todo: refactor
    begin
        if (r_en) begin
            data_out <= mem[r_addr];
        end
        if (w_en) begin
            mem[w_addr] <= data_in;
        end
    end
    
initial
    $monitor($time, "\t [MEM] r_en = %b, r_addr = %d, w_addr = %d, w_en = %b, data_in = %b, data_out = %b", r_en, r_addr, w_addr, w_en, data_in, data_out);

endmodule
