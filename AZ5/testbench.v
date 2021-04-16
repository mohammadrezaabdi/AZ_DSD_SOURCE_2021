`define NULL 0
module testbench();
    
    parameter BIT_LEN = 4;
    parameter clk_c   = 5;
    wire out_r;
    reg clk, start, rstn;
    reg signed [BIT_LEN - 1:0] in1, in2;
    wire signed [2 * BIT_LEN - 1:0] out;
    
    MUL_BOOTH #(.BIT_LEN(BIT_LEN)) mb (
    .in1(in1),
    .in2(in2),
    .out(out),
    .out_r(out_r),
    .clk(clk),
    .start(start),
    .rstn(rstn)
    );
    
    
    initial begin
        $dumpfile("report/waveform.vcd");
        $dumpvars(0,mb);
    end
    
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
    
    integer i,n;
    initial begin
        rstn  = 0;
        start = 0;
        n     = {$random(seed)}%15 + 10;
        for (i = 0; i < n; i = i+1) begin
            rstn = 0;
            #clk_c;
            in1 = {BIT_LEN{$random(seed)}};
            while (in1 == {1'b1,{BIT_LEN-1{1'b0}}})begin
                in1 = {BIT_LEN{$random(seed)}};
            end
            in2   = {BIT_LEN{$random(seed)}};
            rstn  = 1;
            start = 1;
            while (!out_r)
            begin
                #clk_c;
            end
            $display("result is ready: \t%d * %d = %d",in1, in2, out);
        end
        $finish;
    end
    
    initial
        $monitor($time, "  A:%b, XB:%b%b, state = %d, next_state = %d, count = %d , B0,B-1 = %b%b, out_ready = %b", mb.dp.A, mb.dp.X, mb.dp.B, mb.cu.state, mb.cu.next_state, mb.dp.cont, mb.cu.B0, mb.cu.BO, out_r);
    
endmodule
