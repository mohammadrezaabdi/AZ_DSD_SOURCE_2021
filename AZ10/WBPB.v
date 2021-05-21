`define INIT    000
`define PUSH    001
`define POP     010
`define LOAD    011
`define STORE   100

module WBPB (control_bus,
             clk,
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
             mem_data_out);
    
    parameter ADDR_LEN = 8;
    parameter DATA_LEN = 8;
    
    input clk, rstn;
    input [3:0] control_bus;
    output reg [DATA_LEN-1:0] stk_data_in, mem_data_in;
    output reg [ADDR_LEN-1:0] mem_addr;
    output reg stk_push, stk_pop, mem_r_en, mem_w_en;
    input [DATA_LEN-1:0] stk_data_out, mem_data_out, addr_const;
    
    wire [1:0] opc = control_bus[1:0];
    wire en        = (control_bus < 3);
    
    reg [3:0]state;
    
    always @(posedge clk, negedge rstn) begin
        if (!rstn && !en) begin
            state       <= `INIT;
            stk_data_in <= {DATA_LEN{1'bz}};
            stk_push    <= 1'bz;
            stk_pop     <= 1'bz;
            mem_data_in <= {DATA_LEN{1'bz}};
            mem_addr    <= {ADDR_LEN{1'bz}};
            mem_r_en    <= 1'bz;
            mem_w_en    <= 1'bz;
        end
        else begin
            case(state)
                `INIT:
                begin
                    if (rstn) begin
                        if (en) begin
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
                    stk_push    <= 1;
                    stk_data_in <= (opc == 2'b00) ? addr_const : mem_data_out;
                    state       <= `INIT;
                end
                `POP:
                begin
                    stk_pop <= 1;
                    state   <= `STORE;
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
                end
            endcase
        end
    end
    
endmodule
