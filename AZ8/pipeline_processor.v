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
    
    reg id_mem_r_en;
    reg [1:0] id_alu_sig, alu_sig_buff;
    reg [ADDR_LEN-1:0] dst_addr_buff, dst_addr, id_mem_r_addr1, id_mem_r_addr2;
    reg [WORD_SIZE-1:0] mem_alu_data_out1, mem_alu_data_out2;
    reg [INST_LEN-1:0] if_id_buff_inst;
    
    always @(posedge clk)
    begin
        dst_addr_buff <= id_dest_addr;
        dst_addr      <= dst_addr_buff;
        
        if_id_buff_inst   <= inst;
        id_mem_r_addr1    <= r_addr1;
        id_mem_r_addr2    <= r_addr2;
        id_mem_r_en       <= r_en;
        alu_sig_buff      <= alu_sig;
        id_alu_sig        <= alu_sig_buff;
        mem_alu_data_out1 <= data_out1;
        mem_alu_data_out2 <= data_out2;
    end
    
    IF #(.INST_LEN(INST_LEN), .INST_CAP(INST_CAP)) ifm (
    .clk(clk),
    .rstn(rstn),
    .inst(inst)
    );
    
    ID #(.INST_LEN(INST_LEN), .MEM_SIZE(MEM_SIZE), .WORD_SIZE(WORD_SIZE), .ADDR_LEN(ADDR_LEN)) idm (
    .clk(clk),
    .inst(if_id_buff_inst),
    .rstn(rstn),
    .oper1(r_addr1),
    .oper2(r_addr2),
    .dest(id_dest_addr),
    .mem_read(r_en),
    .alu_sig(alu_sig)
    );
    
    MEMORY_UNIT #(.ADDR_LEN(ADDR_LEN),.WORD_SIZE(WORD_SIZE),.MEM_SIZE(MEM_SIZE))memory(
    .r_addr1(id_mem_r_addr1),
    .r_addr2(id_mem_r_addr2),
    .w_addr(w_addr),
    .w_en(w_en),
    .r_en(id_mem_r_en),
    .data_in(wb_data_out),
    .data_out1(data_out1),
    .data_out2(data_out2),
    .clk(clk)
    );
    
    ALU #(.PART_LEN(PART_LEN))alu (
    .clk(clk),
    .a(mem_alu_data_out1),
    .b(mem_alu_data_out2),
    .control_sig(id_alu_sig),
    .res(res)
    );
    
    WB #(.ADDR_LEN(ADDR_LEN),.WORD_SIZE(WORD_SIZE))wbm(
    .dst_addr_i(dst_addr),
    .data_i(res),
    .clk(clk),
    .dst_addr_o(w_addr),
    .data_o(wb_data_out),
    .w_en(w_en)
    );
    
endmodule
    
    
    
    
