module ID (clk,
           inst,
           oper1,
           oper2,
           dest,
           alu_sig,
           mem_read);
    
    parameter INST_LEN  = 17;
    parameter WORD_SIZE = 32;
    parameter MEM_SIZE  = 32;
    parameter ADDR_LEN  = 5;
    
    input clk;
    input [INST_LEN-1:0] inst;
    output reg mem_read;
    output reg [ADDR_LEN-1:0] oper1, oper2, dest;
    output reg [1:0] alu_sig;
    
    always @(posedge clk) begin
        alu_sig  <= inst[INST_LEN-1 : INST_LEN-2];
        oper1    <= inst[3*ADDR_LEN-1 : 2*ADDR_LEN];
        oper2    <= inst[2*ADDR_LEN-1 : ADDR_LEN];
        dest     <= inst[ADDR_LEN-1 : 0];
        mem_read <= 1;
    end
    
    always @(negedge clk) begin
        mem_read <= 0;
    end
    
endmodule
