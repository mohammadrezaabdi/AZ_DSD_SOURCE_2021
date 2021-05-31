`define INIT    4'b0000
`define OP1_POP 4'b0001
`define OP1_RCV 4'b0010
`define OP1_STR 4'b0011
`define OP2_POP 4'b0100
`define OP2_RCV 4'b0101
`define OP2_STR 4'b0110
`define ALU     4'b0111
`define PUSH    4'b1000
`define PUSH_D  4'b1001

module ALU (control_bus,
            clk,
            en,
            rstn,
            z_flag,
            s_flag,
            stk_data_in,
            stk_push,
            stk_pop,
            stk_data_out,
            fin_sig);
    
    parameter DATA_LEN = 8;
    
    input clk, rstn, en;
    input [3:0] control_bus;
    input [DATA_LEN-1:0] stk_data_out;
    output reg [DATA_LEN-1:0] stk_data_in;
    output reg stk_push, stk_pop;
    output reg z_flag, s_flag, fin_sig;
    
    wire asn    = !control_bus[0];
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
            fin_sig     <= 0;
        end
        else begin
            case(state)
                `INIT:
                begin
                    if (alu_en) begin
                        state <= `OP1_POP;
                    end
                    fin_sig     <= 0;
                    stk_data_in <= {DATA_LEN{1'bz}};
                    stk_push    <= 1'bz;
                    stk_pop     <= 1'bz;
                end
                `OP1_POP:
                begin
                    stk_push<= 0;

                    stk_pop <= 1;
                    state   <= `OP1_RCV;
                end
                `OP1_RCV:
                begin
                    stk_pop <= 0;
                    state   <= `OP1_STR;
                end
                `OP1_STR:
                begin
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
                    state   <= `OP2_STR;
                end
                `OP2_STR:
                begin
                    op2     <= stk_data_out;
                    state   <= `ALU;
                end
                `ALU:
                begin
                    if (asn)
                        res   <= op2+op1;
                    else
                        res   <= op2-op1;
                    state <= `PUSH;
                end
                `PUSH:
                begin
                    s_flag      <= (res < 0);
                    z_flag      <= (res == 0);
                    stk_push    <= 1;
                    stk_data_in <= res;
                    state       <= `PUSH_D;
                end
                `PUSH_D:
                begin
                    stk_push    <= 0;
                    state       <= `INIT;
                    fin_sig     <= 1;
                end
            endcase
        end
    end
    
    //debuging
    always @(*)
        $monitor($time, "\t [ALU::%d] rstn = %b, control_bus = %b, opt1 = %d, opt2 = %d, res = %d, stk_data_in = %d, stk_push = %b, stk_pop = %b, stk_data_out = %d z_flag = %b, s_flag = %b,", state, rstn, control_bus, op1, op2, res, stk_data_in, stk_push, stk_pop, stk_data_out, z_flag, s_flag);
    
endmodule
