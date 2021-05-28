`define INIT    00
`define POP     01
`define NXTL      10
`define BR      11

module PC (control_bus,
           clk,
           rstn,
           en,
           pc,
           z_flag,
           s_flag,
           stk_pop,
           stk_data_out);
    
    parameter INST_CAP = 20;
    parameter DATA_LEN = 8;
    
    input clk, en, rstn, z_flag, s_flag;
    input [3:0] control_bus;
    input [DATA_LEN-1:0] stk_data_out;
    output reg stk_pop;
    output reg [$clog2(INST_CAP):0] pc;
    
    wire[1:0] opc = {control_bus[2], control_bus[0]};
    wire branch   = (control_bus > 2 && control_bus < 6);
    
    reg [3:0]state;
    
    always @(posedge clk, negedge rstn) begin
        if (!rstn && !en) begin
            state   <= `INIT;
            stk_pop <= 1'bz;
            pc      <= 0;
        end
        else begin
            case(state)
                `INIT:
                begin
                    if (rstn) begin
                        if (en) begin
                            state <= (branch) ? `POP : `NXTL;
                        end
                        stk_pop <= 1'bz;
                    end
                end
                `POP:
                begin
                    stk_pop <= 1;
                    state   <= `BR;
                end
                `NXTL:
                begin
                    if (pc < INST_CAP - 1) begin
                        pc <= pc + 1;
                    end
                    state <= `INIT;
                end
                `BR:
                begin
                    if ((opc == 2'b01) || (opc == 2'b10 && z_flag) ||  (opc == 2'b11 && s_flag)) begin
                        pc <= stk_data_out;
                    end
                    state <= `INIT;
                end
            endcase
        end
        
        //debuging
        $display($time, "\t [PC::%d] rstn = %b, en = %b, control_bus = %b, pc = %d, z_flag = %b, s_flag = %b, stk_pop = %b, stk_data_out = %d", state, rstn, en, control_bus, pc, z_flag, s_flag, stk_pop, stk_data_out);
    end
    
endmodule
