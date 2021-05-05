module IF (clk,
           rstn,
           inst);
    
    parameter INST_CAP = 5;
    parameter INST_LEN = 17;
    
    input clk, rstn;
    output reg[INST_LEN-1:0] inst;
    
    reg [INST_LEN-1:0] inst_mem [INST_CAP-1:0];
    reg[$clog2(INST_CAP):0] pc;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            pc <= 0;
        end
        else begin
            if (pc < INST_CAP) begin
                $display($time, "\t [IF] inst[%d]:%b", pc, inst_mem[pc]);
                inst <= inst_mem[pc];
                pc   <= pc + 1;
            end
        end
    end
    
endmodule
