module MUL_BOOTH(in1,
                 in2,
                 out,
                 out_r,
                 clk,
                 start,
                 rstn);
    parameter BIT_LEN = 4;
    
    input [BIT_LEN-1:0] in1, in2;
    input clk, start, rstn;
    output [2*BIT_LEN-1:0] out;
    output out_r;
    
    wire [2:0] status, control;
    
    CU cu (
    .status(status),
    .control(control),
    .start(start),
    .rstn(rstn),
    .clk(clk)
    );
    
    DP #(.BIT_LEN(BIT_LEN)) dp(
    .control(control),
    .IN1(in1),
    .IN2(in2),
    .OUT(out),
    .status(status),
    .EF(out_r),
    .rstn(rstn),
    .clk(clk)
    );
    
endmodule //mul_booth
