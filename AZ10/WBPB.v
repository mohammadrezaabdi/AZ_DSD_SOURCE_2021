`define INIT    3'b000             //Pushm  -> load push
`define LOAD    3'b001
`define PUSH    3'b010             //pop    -> pop store 
`define PUSH_D  3'b011
`define POP     3'b100             //pushc  -> push
`define POP_D   3'b101
`define STORE   3'b110
//todo kir e khar
module WBPB (control_bus,
             clk,
             en,
             rstn,
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
    
    parameter ADDR_LEN = 8;
    parameter DATA_LEN = 8;
    
    input clk, rstn, en;
    input [3:0] control_bus;
    input [DATA_LEN-1:0] stk_data_out, mem_data_out, addr_const;
    output reg [DATA_LEN-1:0] stk_data_in, mem_data_in;
    output reg [ADDR_LEN-1:0] mem_addr;
    output reg stk_push, stk_pop, mem_r_en, mem_w_en, fin_sig;
    
    wire [1:0] opc = control_bus[1:0];
    wire wbpb_en   = (en && control_bus < 3);
    
    reg [2:0]state;
    
    always @(posedge clk, negedge rstn) begin
        if (!rstn && !wbpb_en) begin
            state       <= `INIT;
            stk_data_in <= {DATA_LEN{1'bz}};
            stk_push    <= 1'bz;
            stk_pop     <= 1'bz;
            mem_data_in <= {DATA_LEN{1'bz}};
            mem_addr    <= {ADDR_LEN{1'bz}};
            mem_r_en    <= 1'bz;
            mem_w_en    <= 1'bz;
            fin_sig     <= 0;
        end
        else begin
            case(state)
                `INIT:
                begin
                    if (rstn) begin
                        if (wbpb_en) begin
                            if (opc == 2'b00) begin
                                state <= `PUSH;
                            end
                            else if (opc == 2'b01) begin
                                state <= `LOAD;
                            end
                            else if (opc == 2'b10) begin
                                state <= `POP;
                            end
                        end
                        fin_sig     <= 0;
                        stk_data_in <= {DATA_LEN{1'bz}};
                        stk_push    <= 1'bz;
                        stk_pop     <= 1'bz;
                        mem_data_in <= {DATA_LEN{1'bz}};
                        mem_addr    <= {ADDR_LEN{1'bz}};
                        mem_r_en    <= 1'bz;
                        mem_w_en    <= 1'bz;
                    end
                end
                `PUSH:
                begin
                    mem_r_en <= 0;
                    mem_w_en <= 0;
                    stk_pop     <= 0;
                    stk_data_in <= (opc == 2'b00) ? addr_const : mem_data_out;
                    state       <= `PUSH_D;
                end
                `PUSH_D:
                begin
                    stk_push    <= 1;
                    state       <= `INIT;
                    fin_sig     <= 1;
                end
                `POP:
                begin
                    stk_push <= 0;
                    state    <= `POP_D;
                end
                `POP_D:
                begin
                    stk_pop  <= 1;
                    state    <= `STORE;
                end
                `LOAD:
                begin
                    mem_r_en <= 1;
                    mem_w_en <= 0;
                    mem_addr <= addr_const;
                    state    <= `PUSH;
                end
                `STORE:
                begin
                    mem_w_en    <= 1;
                    mem_r_en    <= 0;
                    mem_data_in <= stk_data_out;
                    mem_addr    <= addr_const;
                    state       <= `INIT;
                    fin_sig     <= 1;
                end
            endcase
        end
        
    end
    
    //debugging
    always @(*)
        $display($time, "\t [WBPB::%d] rstn = %b, en = %b, fin_sig=%b, control_bus = %b, addr_const = %d, stk_data_in = %d, stk_push = %b, stk_pop = %b, stk_data_out = %d, mem_data_in = %d, mem_addr = %d, mem_r_en = %b, mem_w_en = %b, mem_data_out = %d", state, rstn, en, fin_sig, control_bus, addr_const, stk_data_in, stk_push, stk_pop, stk_data_out, mem_data_in, mem_addr, mem_r_en, mem_w_en, mem_data_out);
    
endmodule
