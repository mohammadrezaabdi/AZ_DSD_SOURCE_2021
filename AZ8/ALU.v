`define OPP_ASN 1
`define OPP_MUL 0

module ALU (clk,
            a,
            b,
            res,
            control_sig);
    
    parameter PART_LEN = 8;
    
    input [2*PART_LEN-1:0] a, b;
    output [2*PART_LEN-1:0] res;
    input clk;
    
    input [1:0]control_sig;
    
    
    wire asn = control_sig[0];
    wire opp = control_sig[1];
    
    wire [2*PART_LEN-1:0]res_as,res_mul;
    
    MUL_C #(.PART_LEN(PART_LEN))mulc(
    .a(a),
    .b(b),
    .res(res_as)
    );
    
    AS_C #(.PART_LEN(PART_LEN)) asc(
    .a(a),
    .b(b),
    .asn(asn),
    .res(res_mul));
    
    assign res = (opp != `OPP_ASN) ? res_as: res_mul;
    
    always @(*)
        $display($time, "\t [ALU] a = %b, b = %b, control = %b, res = %b", a, b, control_sig, res);
    
endmodule
