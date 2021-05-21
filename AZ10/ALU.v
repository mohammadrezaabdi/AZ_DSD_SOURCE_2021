`define INIT    0000
`define OP1_POP 0001
`define OP1_RCV 0010
`define OP2_POP 0011
`define OP2_RCV 0100
`define ALU     0101
`define ADD     0110
`define SUB     0111
`define PUSH   1000

module ALU (control_bus,
            clk,
            rstn,
            z_flag,
            s_flag,
            stk_data_in,
            stk_push,
            stk_pop,
            stk_data_out);
    
    parameter DATA_LEN = 8;
    
    input clk, rstn;
    input [3:0] control_bus;
    output reg [DATA_LEN-1:0] stk_data_in;
    output reg stk_push, stk_pop;
    output z_flag, s_flag;
    input [DATA_LEN-1:0] stk_data_out;
    
    wire asn      = control_bus[0];
    wire en       = control_bus[1] & control_bus[2];
    assign s_flag = (res < 0);
    assign z_flag = (res == 0);
    
    reg [3:0]state;
    
    reg signed [DATA_LEN-1:0] op1, op2, res;
    
    always @(posedge clk, negedge rstn) begin
        if (!rstn && !en) begin
            state       <= `INIT;
            stk_data_in <= {DATA_LEN{1'bz}};
            stk_push    <= 1'bz;
            stk_pop     <= 1'bz;
        end
        else begin
            case(state)
                `INIT:
                begin
                    if (rstn) begin
                        if (en) begin
                            state <= `OP1_POP;
                        end
                        stk_data_in <= {DATA_LEN{1'bz}};
                        stk_push    <= 1'bz;
                        stk_pop     <= 1'bz;
                    end
                end
                `OP1_POP:
                begin
                    stk_pop <= 1;
                    state   <= `OP1_RCV;
                end
                `OP1_RCV:
                begin
                    stk_pop <= 0;
                    op1     <= stk_data_out;
                    state   <= `OP2_POP;
                end
                `OP2_POP:
                begin
                    stk_pop <= 1;
                    state   <= `OP2_RCV;
                end
                `OP2_RCV:
                begin
                    stk_pop <= 0;
                    op2     <= stk_data_out;
                    state   <= `ALU;
                end
                `ALU:
                begin
                    if (asn)
                        state <= `ADD;
                    else
                        state <= `SUB;
                end
                `ADD:
                begin
                    res   <= op1+op2;
                    state <= `PUSH;
                end
                `SUB:
                begin
                    res   <= op1-op2;
                    state <= `PUSH;
                end
                `PUSH:
                begin
                    stk_push    <= 1;
                    stk_data_in <= res;
                    state       <= `INIT;
                end
            endcase
        end
    end
endmodule
