`define INIT    2'b00
`define IF      2'b01
`define ID      2'b10

module IFIDC (clk,
              en,
              rstn,
              pc,
              control_bus,
              data);
    
    parameter INST_CAP = 20;
    parameter INST_LEN = 12;
    parameter DATA_LEN = 8;
    
    input clk, rstn, en;
    input [$clog2(INST_CAP):0] pc;
    output reg [3:0]control_bus;
    output reg [DATA_LEN-1:0]data;
    
    reg [INST_LEN-1:0] inst_mem [INST_CAP-1:0];
    reg[INST_LEN-1:0] inst;
    
    reg [1:0]state;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn && !en) begin
            control_bus <= 4'b1000;
            data        <= 8'bx;
            state       <= `INIT;
        end
        else begin
            case(state)
                `INIT:
                begin
                    if (rstn) begin
                        if (en) begin
                            state <= `IF;
                        end
                    end
                end
                `IF:
                begin
                    inst  <= inst_mem[pc];
                    state <= `ID;
                end
                `ID:
                begin
                    control_bus[3:0] <= inst[INST_LEN-1:DATA_LEN];
                    data             <= inst[DATA_LEN-1:0];
                    state            <= `INIT;
                end
            endcase
        end
        
    end
    
    //debuging
    // always @(*)
    //     $display($time, "\t [IFIDC::%d] pc = %d control_bus = %b addr_imm = %d", state, pc, control_bus, data);
    
endmodule
