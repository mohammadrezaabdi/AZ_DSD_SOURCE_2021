`define NXTI 2'b00
`define EXIT 2'b11

module EXEC (clk,
             en,
             rstn,
             pc,
             control_bus,
             addr_const,
             stk_data_in,
             stk_push,
             stk_pop,
             stk_data_out,
             mem_data_in,
             mem_addr,
             mem_r_en,
             mem_w_en,
             mem_data_out,
             fin_sig);
    
    parameter DATA_LEN = 8;
    parameter ADDR_LEN = 8;
    parameter INST_CAP = 20;
    
    input clk, en, rstn;
    input [3:0] control_bus;
    input [DATA_LEN-1:0] stk_data_out, mem_data_out, addr_const;
    output wire [DATA_LEN-1:0] stk_data_in, mem_data_in;
    output wire [ADDR_LEN-1:0] mem_addr;
    output wire stk_push, stk_pop, mem_r_en, mem_w_en, fin_sig;
    output wire [$clog2(INST_CAP):0] pc;
    wire alu_z_flag, alu_s_flag, alu_fin_sig, wbpb_fin_sig, pc_fin_sig;
    
    assign fin_sig = (alu_fin_sig | wbpb_fin_sig | pc_fin_sig);
    
    ALU  #(
    .DATA_LEN(DATA_LEN)
    ) alu0 (
    .clk(clk),
    .rstn(rstn),
    .en(en),
    .control_bus(control_bus),
    .z_flag(alu_z_flag),
    .s_flag(alu_s_flag),
    .stk_data_in(stk_data_in),
    .stk_push(stk_push),
    .stk_pop(stk_pop),
    .stk_data_out(stk_data_out),
    .fin_sig(alu_fin_sig)
    );
    
    PP  #(
    .DATA_LEN(DATA_LEN),
    .ADDR_LEN(ADDR_LEN)
    ) pp0 (
    .clk(clk),
    .rstn(rstn),
    .en(en),
    .control_bus(control_bus),
    .addr_const(addr_const),
    .stk_data_in(stk_data_in),
    .stk_push(stk_push),
    .stk_pop(stk_pop),
    .stk_data_out(stk_data_out),
    .mem_data_in(mem_data_in),
    .mem_addr(mem_addr),
    .mem_r_en(mem_r_en),
    .mem_w_en(mem_w_en),
    .mem_data_out(mem_data_out),
    .fin_sig(wbpb_fin_sig)
    );
    
    PC #(
    .DATA_LEN(DATA_LEN),
    .INST_CAP(INST_CAP)
    ) pc0 (
    .clk(clk),
    .rstn(rstn),
    .en(en),
    .control_bus(control_bus),
    .pc(pc),
    .z_flag(alu_z_flag),
    .s_flag(alu_s_flag),
    .stk_pop(stk_pop),
    .stk_data_out(stk_data_out),
    .fin_sig(pc_fin_sig)
    );
    
endmodule
