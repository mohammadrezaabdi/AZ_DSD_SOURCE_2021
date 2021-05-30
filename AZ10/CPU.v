`define IFIDC   2'b00
`define EXEC    2'b01
`define WAIT    2'b10

module CPU (rstn,
            clk);
    
    parameter DATA_LEN    = 8;
    parameter ADDR_LEN    = 8;
    parameter INST_CAP    = 20;
    parameter INST_LEN    = 12;
    parameter WORD_LEN    = 8;
    parameter MEM_SIZE    = 256;
    parameter STACK_DEPTH = 8;
    
    input rstn, clk;
    
    wire stk_full, stk_empty, stk_push, stk_pop, mem_r_en, mem_w_en, exec_fin_sig;
    wire [3:0] ifidc_control_bus;
    wire [DATA_LEN-1:0] stk_data_in, stk_data_out, mem_data_in, mem_data_out, ifidc_addr_const;
    wire [ADDR_LEN-1:0] mem_addr;
    wire [$clog2(INST_CAP):0] exec_pc;
    
    reg ifidc_en, exec_en;
    reg [1:0] state;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            ifidc_en <= 0;
            exec_en  <= 0;
            state    <= `IFIDC;
        end
        else begin
            case(state)
                `IFIDC:
                begin
                    ifidc_en <= 1;
                    exec_en  <= 0;
                    state    <= `EXEC;
                end
                `EXEC:
                begin
                    ifidc_en <= 0;
                    exec_en  <= 1;
                    state    <= `WAIT;
                end
                `WAIT:
                begin
                    ifidc_en <= 0;
                    exec_en  <= 0;
                    if (exec_fin_sig) begin
                        state <= `IFIDC;
                    end
                end
            endcase
        end
    end
    
    IFIDC #(
    .INST_CAP(INST_CAP),
    .INST_LEN(INST_LEN),
    .DATA_LEN(DATA_LEN)
    ) ifidc0 (
    .clk(clk),
    .en(ifidc_en),
    .rstn(rstn),
    .pc(exec_pc),
    .control_bus(ifidc_control_bus),
    .data(ifidc_addr_const)
    );
    
    EXEC #(
    .DATA_LEN(DATA_LEN),
    .ADDR_LEN(ADDR_LEN),
    .INST_CAP(INST_CAP)
    ) exec0 (
    .clk(clk),
    .en(exec_en),
    .rstn(rstn),
    .pc(exec_pc),
    .control_bus(ifidc_control_bus),
    .addr_const(ifidc_addr_const),
    .stk_data_in(stk_data_in),
    .stk_push(stk_push),
    .stk_pop(stk_pop),
    .stk_data_out(stk_data_out),
    .mem_data_in(mem_data_in),
    .mem_addr(mem_addr),
    .mem_r_en(mem_r_en),
    .mem_w_en(mem_w_en),
    .mem_data_out(mem_data_out),
    .fin_sig(exec_fin_sig)
    );
    
    MEMORY #(
    .ADDR_LEN(ADDR_LEN),
    .WORD_LEN(WORD_LEN),
    .MEM_SIZE(MEM_SIZE)
    ) memory0 (
    .clk(clk),
    .addr(mem_addr),
    .r_en(mem_r_en),
    .w_en(mem_w_en),
    .data_out(mem_data_out),
    .data_in(mem_data_in)
    );
    
    Stack #(
    .WORD_LEN(WORD_LEN),
    .STACK_DEPTH(STACK_DEPTH)
    ) stack0 (
    .clk(clk),
    .rstn(rstn),
    .data_in(stk_data_in),
    .push(stk_push),
    .pop(stk_pop),
    .data_out(stk_data_out),
    .full(stk_full),
    .empty(stk_empty)
    );
    
    //debuging
    // always @(*)
    //     $display($time, "\t [CPU::%d] ifidc_en = %b, exec_en = %b, exec_finish = %b", state, ifidc_en, exec_en, exec_fin_sig);
    
    
endmodule
