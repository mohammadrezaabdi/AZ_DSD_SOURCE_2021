module PIPELINE(clk,
                rstn);
    
    parameter PART_LEN  = 16;
    parameter WORD_SIZE = 32;
    parameter ADDR_LEN  = 5;
    parameter MEM_SIZE  = 32;
    parameter INST_LEN  = 17;
    parameter INST_CAP  = 5;
    
    input clk, rstn;
    wire w_en, r_en;
    wire [INST_LEN-1:0] inst;
    wire [ADDR_LEN-1:0] r_addr1, r_addr2, w_addr, id_dest_addr;
    wire [1:0] alu_sig;
    wire [WORD_SIZE-1:0] res, wb_data_out, data_out1, data_out2;
    reg [ADDR_LEN-1:0] dst_addr_buffer, dst_addr;
    
    always @(posedge clk)
    begin
        dst_addr_buffer <= id_dest_addr;
        dst_addr        <= dst_addr_buffer;
    end
    
    IF #(.INST_LEN(INST_LEN), .INST_CAP(INST_CAP)) ifm (
    .clk(clk),
    .rstn(rstn),
    .inst(inst)
    );
    
    ID #(.INST_LEN(INST_LEN), .MEM_SIZE(MEM_SIZE), .WORD_SIZE(WORD_SIZE), .ADDR_LEN(ADDR_LEN)) idm (
    .clk(clk),
    .inst(inst),
    .oper1(r_addr1),
    .oper2(r_addr2),
    .dest(id_dest_addr),
    .mem_read(r_en),
    .alu_sig(alu_sig)
    );
    
    MEMORY_UNIT #(.ADDR_LEN(ADDR_LEN),.WORD_SIZE(WORD_SIZE),.MEM_SIZE(MEM_SIZE))memory(
    .r_addr1(r_addr1),
    .r_addr2(r_addr2),
    .w_addr(w_addr),
    .w_en(w_en),
    .r_en(r_en),
    .data_out1(data_out1),
    .data_out2(data_out2),
    .data_in(wb_data_out),
    .clk(clk));
    
    WB #(.ADDR_LEN(ADDR_LEN),.WORD_SIZE(WORD_SIZE))wbm(
    .dst_addr_i(dst_addr),
    .data_i(res),
    .clk(clk),
    .dst_addr_o(w_addr),
    .data_o(wb_data_out),
    .w_en(w_en)
    );
    
    ALU #(.PART_LEN(PART_LEN))alu (
    .clk(clk),
    .a(data_out1),
    .b(data_out2),
    .res(res),
    .control_sig(alu_sig)
    );
    
endmodule
    
    
    
    
