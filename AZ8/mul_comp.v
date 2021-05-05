module MUL_C(a,
             b,
             res);
    
    parameter PART_LEN = 8;
    input signed [2*PART_LEN-1:0] a,b;
    output signed [2*PART_LEN-1:0]res;
    
    
    wire signed [PART_LEN-1:0]ra = a[2*PART_LEN-1:PART_LEN];
    wire signed [PART_LEN-1:0]rb = b[2*PART_LEN-1:PART_LEN];
    
    wire signed [PART_LEN-1:0]ia = a[PART_LEN-1:0];
    wire signed [PART_LEN-1:0]ib = b[PART_LEN-1:0];
    
    wire signed [PART_LEN:0]rr = ra*rb - ia*ib;
    wire signed [PART_LEN:0]ir = ra*ib + rb*ia;
    
    assign res = {rr[PART_LEN-1:0], ir[PART_LEN-1:0]};
    
endmodule
