`define INIT    0000
`define OP1_POP 0001
`define OP1_RCV 0010
`define OP2_POP 0011
`define OP2_RCV 0100
`define ALU     0101
`define ADD     0110
`define SUB     0111
`define PUSH    1000

module ALU (control_bus,
            clk,
            en,
            rstn,
            z_flag,
            s_flag,
            stk_data_in,
            stk_push,
            stk_pop,
            stk_data_out);
    
    parameter DATA_LEN = 8;
    
    input clk, rstn, en;
    input [3:0] control_bus;
    input [DATA_LEN-1:0] stk_data_out;
    output reg [DATA_LEN-1:0] stk_data_in;
    output reg stk_push, stk_pop;
    output reg z_flag, s_flag;
    
    wire asn    = control_bus[0];
    wire alu_en = (en && control_bus[1] && control_bus[2]);
    
    reg [3:0]state;
    
    reg signed [DATA_LEN-1:0] op1, op2, res;
    
    always @(posedge clk, negedge rstn) begin
        if (!rstn && !alu_en) begin
            state       <= `INIT;
            stk_data_in <= {DATA_LEN{1'bz}};
            stk_push    <= 1'bz;
            stk_pop     <= 1'bz;
            s_flag      <= 0;
            z_flag      <= 0;
        end
        else begin
            case(state)
                `INIT:
                begin
                    if (rstn) begin
                        if (alu_en) begin
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
                    s_flag      <= (res < 0);
                    z_flag      <= (res == 0);
                    stk_push    <= 1;
                    stk_data_in <= res;
                    state       <= `INIT;
                end
            endcase
        end
    end
    
    initial
        $monitor($time, "\t [ALU::%d] rstn = %b, control_bus = %b, z_flag = %b, s_flag = %b, opt1 = %d, opt2 = %d, res = %d, stk_data_in = %d, stk_push = %b, stk_pop = %b, stk_data_out = %d", state, rstn, control_bus, z_flag, s_flag, op1, op2, res, stk_data_in, stk_push, stk_pop, stk_data_out);
    
endmodule
