module MUL_BOOTH(in1, in2, out, out_r, clk, rstn);
    parameter BIT_LEN = 4;
    
    input [BIT_LEN-1:0] in1, in2;
    input clk, rstn; 
    output [2*BIT_LEN-1:0] out;
    output out_r;

    wire [1:0] state, signal;

    CU cu (
        .clk(clk),
        .signal(signal),
        .out_state(state),
        .rstn(rstn)
    );
    
    DP #(.BIT_LEN(BIT_LEN)) dp(
        .state(state),
        .IN1(in1),
        .IN2(in2),
        .OUT(out),
        .signal(signal),
        .OUT_R(out_r),
        .clk(clk)
    );
    
endmodule //mul_booth