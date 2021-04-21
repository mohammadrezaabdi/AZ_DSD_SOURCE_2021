`define NULL 0
module testbench;

    parameter clk_c = 10;
    reg clk, rstn;
       
   initial begin
        $dumpfile("report/waveform.vcd");
        $dumpvars(0,/*<your instance name here>*/);
    end

    initial begin
        clk         = 0;
        forever clk = #(clk_c/2) ~clk;
    end

    // for random seed generation
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

    initial
        $monitor($time,"\tyour minitoring here",);


    initial begin
        // your bench here
    end


    task task_with_input;
        input input1;
        begin
            #clk_c;
        end
    endtask


    task task_without_input;
        begin
            #clk_c;
        end
    endtask
    
endmodule