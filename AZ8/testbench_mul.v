`define NULL 0
module MUL_C_TESTBENCH();
    
    parameter PART_LEN = 8;
    parameter clk_c    = 10;
    
    reg clk;
    reg signed [2*PART_LEN-1:0] a, b;
    wire signed [2*PART_LEN-1:0] c;
    
    MUL_C #(.PART_LEN(PART_LEN)) mulc(
    .a(a),
    .b(b),
    .res(c)
    );
    
    integer data_file;
    integer scan_file;
    integer seed;
    initial begin
        data_file = $fopen("seed.dat", "r");
        if (data_file == `NULL) begin
            $display("data_file handle was NULL");
            $finish;
        end
        scan_file = $fscanf(data_file, "%d", seed);
        if (scan_file == `NULL) begin
            $display("integer read error");
            $finish;
        end
    end
    
    initial begin
        clk         = 0;
        forever clk = #(clk_c/2) ~clk;
    end
    
    integer n;
    integer i;
    reg signed [PART_LEN-3:0]ra_tmp,rb_tmp,ia_tmp,ib_tmp;
    initial begin
        n = 10;
        $display("testing mul");
        for (i = 0; i < n; i++) begin
            ra_tmp = {(PART_LEN-2){$random(seed)}};
            rb_tmp = {(PART_LEN-2){$random(seed)}};
            ia_tmp = {(PART_LEN-2){$random(seed)}};
            ib_tmp = {(PART_LEN-2){$random(seed)}};
            
            a = {2'b00,ra_tmp,2'b00,ia_tmp};
            b = {2'b00,rb_tmp,2'b00,ib_tmp};
            #clk_c;
        end
        $finish;
    end
    
    initial
        $monitor($time, "\t(%d, %di) * (%d, %di) = (%d, %di)", a[2*PART_LEN-1:PART_LEN], a[PART_LEN-1:0], b[2*PART_LEN-1:PART_LEN], b[PART_LEN-1:0], c[2*PART_LEN-1:PART_LEN], c[PART_LEN-1:0]);
    
endmodule
