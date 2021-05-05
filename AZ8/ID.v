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
    // always @(posedge clk) begin
    // end
    
    always @(posedge clk or negedge rstn) begin
        // if (!rstn) begin
        //     alu_sig  <= 0;
        //     oper1    <= 0;
        //     oper2    <= 0;
        //     dest     <= 0;
        //     mem_read <= 0;
        // end
        // else begin
        //     alu_sig  <= inst[INST_LEN-1 : INST_LEN-2];
        //     oper1    <= inst[3*ADDR_LEN-1 : 2*ADDR_LEN];
        //     oper2    <= inst[2*ADDR_LEN-1 : ADDR_LEN];
        //     dest     <= inst[ADDR_LEN-1 : 0];
        //     mem_read <= 1;
        $display($time, "\t [ID] inst = %b, oper1 = %b, oper2 = %b, dest = %b, mem_read = %b, alu_sig = %b",inst, oper1, oper2, dest, mem_read, alu_sig);
        // end
    end
    
    always @(negedge clk) begin
        // if (!rstn) begin
        //     alu_sig <= 0;
        //     oper1   <= 0;
        //     oper2   <= 0;
        //     dest    <= 0;
        // end
        // mem_read <= 0;
        // $display($time, "\t [ID] inst = %b, oper1 = %b, oper2 = %b, dest = %b, mem_read = %b, alu_sig = %b",inst, oper1, oper2, dest, mem_read, alu_sig);
    end
    
    // initial
    //     $monitor($time, "\t [ID] clk = %b, inst = %b, oper1 = %b, oper2 = %b, dest = %b, mem_read = %b, alu_sig = %b" , clk, inst, oper1, oper2, dest, mem_read, alu_sig);
    
    
endmodule
