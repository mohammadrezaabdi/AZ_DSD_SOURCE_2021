module ID (clk,
           inst,
           rstn,
           oper1,
           oper2,
           dest,
           alu_sig,
           mem_read);
    
    parameter INST_LEN  = 17;
    parameter WORD_SIZE = 32;
    parameter MEM_SIZE  = 32;
    parameter ADDR_LEN  = 5;
    
    input clk, rstn;
    input [INST_LEN-1:0] inst;
    output mem_read;
    output [ADDR_LEN-1:0] oper1, oper2, dest;
    output [1:0] alu_sig;
    
    assign alu_sig  = inst[INST_LEN-1 : INST_LEN-2];
    assign oper1    = inst[3*ADDR_LEN-1 : 2*ADDR_LEN];
    assign oper2    = inst[2*ADDR_LEN-1 : ADDR_LEN];
    assign dest     = inst[ADDR_LEN-1 : 0];
    assign mem_read = clk;
    
    always @(*) begin
        $display($time, "\t [ID] inst = %b, oper1 = %b, oper2 = %b, dest = %b, mem_read = %b, alu_sig = %b",inst, oper1, oper2, dest, mem_read, alu_sig);
    end
    
endmodule
