`define INIT    0000
`define IF      0001
`define ID      0010

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
    
    reg [3:0]state;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn && !en) begin
            control_bus <= 0;
            data        <= 0;
            state       <= `INIT;
        end
        else begin
            case(state)
                `INIT:
                begin
                    if (rstn) begin
                        if (en) begin
                            state       <= `IF;
                            control_bus <= 0;
                            data        <= 0;
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
    
    initial
        $monitor($time, "\t [IFIDC::%d] pc=%d control_bus=%b data=%d", state, pc, control_bus, data);
    
endmodule
