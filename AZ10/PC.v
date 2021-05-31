`define INIT    3'b000
`define POP     3'b001
`define NXTL    3'b010
`define BR      3'b011
`define EXIT    3'b100

module PC (control_bus,
           clk,
           rstn,
           en,
           pc,
           z_flag,
           s_flag,
           stk_pop,
           stk_data_out,
           fin_sig);
    
    parameter INST_CAP = 20;
    parameter DATA_LEN = 8;
    
    input clk, en, rstn, z_flag, s_flag;
    input [3:0] control_bus;
    input [DATA_LEN-1:0] stk_data_out;
    output reg stk_pop, fin_sig;
    output reg [$clog2(INST_CAP):0] pc;
    
    wire[1:0] opc = {control_bus[2], control_bus[0]};
    wire branch   = (control_bus > 2 && control_bus < 6);
    wire exit     = (control_bus == 4'b1111);
    wire stall    = !(control_bus < 4'b1000 || control_bus == 4'b1111);
    
    reg [2:0]state;
    
    always @(posedge clk, negedge rstn) begin
        if (!rstn && !en) begin
            state   <= `INIT;
            stk_pop <= 1'bz;
            pc      <= 0;
            fin_sig <= 0;
        end
        else begin
            case(state)
                `INIT:
                begin
                    if (en) begin
                        if (branch)
                            state <= `POP;
                        else if (exit)
                            state <= `EXIT;
                        else
                            state <= `NXTL;
                    end
                    fin_sig <= 0;
                    stk_pop <= 1'bz;
                end
                `POP:
                begin
                    if (!((opc == 2'b01) || (opc == 2'b10 && z_flag) ||  (opc == 2'b11 && s_flag))) begin
                        state <= `NXTL;
                    end
                    else begin
                        stk_pop <= 1;
                        state   <= `BR;
                    end
                end
                `NXTL:
                begin
                    if (pc < INST_CAP - 1) begin
                        pc <= pc + 1;
                    end
                    state <= `INIT;
                    if (stall) begin
                        fin_sig <= 1;
                    end
                end
                `BR:
                begin
                    pc <= stk_data_out;
                    state   <= `INIT;
                    fin_sig <= 1;
                end
                `EXIT:
                begin
                // do nothing
                $writememb("report/result.mem", cpu0.memory0.mem);
                $finish;
                end
            endcase
        end
        
    end
    
    //debuging
    always @(*)
        $display($time, "\t [PC::%d] rstn = %b, en = %b, control_bus = %b, pc = %d, z_flag = %b, s_flag = %b, stk_pop = %b, stk_data_out = %d", state, rstn, en, control_bus, pc, z_flag, s_flag, stk_pop, stk_data_out);
    
endmodule
