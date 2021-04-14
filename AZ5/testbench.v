module testbench();
    
    parameter BIT_LEN = 4;
    parameter clk_c = 5;
    wire out_r;
    reg clk, rstn;
    reg [BIT_LEN - 1:0] in1, in2;
    wire [2 * BIT_LEN - 1:0] out;

    module  #(.BIT_LEN(BIT_LEN)) MUL_BOOTH mb (
        .in1(in1),
        .in2(in2),
        .out(out),
        .out_r(out_r),
        .clk(clk),
        .rstn(rstn)
    );


    initial begin
        $dumpfile("report/waveform.vcd");
        $dumpvars(0,stack0);
    end

    integer data_file;
    integer scan_file;
    integer seed;
    initial begin
        data_file = $fopen("seed.dat", "r");
        if (data_file == NULL) begin
            $display("data_file handle was NULL");
            $finish;
        end
        scan_file = $fscanf(data_file, "%d", seed);
        if (scan_file == NULL) begin
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
        n = {$random(seed)}%15+5;
        for (i = 0; i<n; i=i+1) begin
            rstn = 0;
            #clk_c
            rstn = 1;
            in1 = {BIT_LEN{$random(seed)}};
            in2 = {BIT_LEN{$random(seed)}};
            
            while (!out_r)
            begin
                #clk_c;
            end
        end
    end

    initial
        $display($time,"%d*%d=%d_______________, out_ready=%b, rstn=%b",in1,in2,out,out_r,rstn);    
    
endmodule