`define OPP_ASN 1
`define OPP_MUL 0

module ALU (clk,
            a,
            b,
            res,
            control_sig);
    parameter PART_LEN = 8;
    
    input [2*PART_LEN-1:0]a,b;
    output reg [2*PART_LEN-1:0]res;
    input clk,rstn;
    input [1:0]control_sig;
    
    
    wire asn = control_sig[0];
    wire opp = control_sig[1];
    
    wire [2*PART_LEN-1:0]res_as,res_mul;
    wire rstn = opp&asn;
    
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
    
    
    always @(posedge clk or negedge rstn)
    begin
        if (!rstn) begin
            res <= 0;
            end else begin
            case (opp)
                `OPP_ASN:
                res <= res_as;
                `OPP_MUL:
                res <= res_mul;
            endcase
            $display($time, "\t a=%b, b=%b, res = %b", a, b, res);
        end
    end
    
endmodule
