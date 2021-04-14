`define NULL 0
module testbench();
    
    parameter BIT_LEN = 4;
    parameter clk_c   = 5;
    wire out_r;
    reg clk, start, rstn;
    reg [BIT_LEN - 1:0] in1, in2;
    wire [2 * BIT_LEN - 1:0] out;
    
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
    
    // integer i,n;
    // initial begin
    //     n = {$random(seed)}%15+5;
    //     for (i = 0; i<n; i = i+1) begin
    //         start = 0;
    //         #clk_c
    //         start = 1;
    //         in1   = {BIT_LEN{$random(seed)}};
    //         in2   = {BIT_LEN{$random(seed)}};
    
    //         while (!out_r)
    //         begin
    //             #clk_c;
    //         end
    //     end
    // end
    
    initial begin
        rstn  = 0;
        start = 1;
        #clk_c
        rstn  = 1;
        start = 0;
        in1   = 4'b0111;
        in2   = 4'b1011;
        #clk_c
        start = 1;
        #100;
        $finish;
    end
    
    initial
        $monitor(" A:%b, XB:%b%b, INIT = %b, ADD = %b, SUB = %b, SHIFT1 = %b, SHIFT2 = %b, count=%d , B0 = %b, FIN = %b, out_ready = %b, start = %b",mb.dp.A, mb.dp.X, mb.dp.B, mb.cu.INIT, mb.cu.ADD, mb.cu.SUB, mb.cu.SHIFT1, mb.cu.SHIFT2, mb.dp.cont, mb.cu.B0, mb.cu.FIN, out_r, start);
    
endmodule
