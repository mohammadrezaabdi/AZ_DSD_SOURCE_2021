module testbench;

reg clk, rstn;


Incubator inc (clk,
                  sensor,
                  rstn,
                  heater,
                  cooler,
                  CRS);

   initial begin
        $dumpfile("report/waveform.vcd");
        $dumpvars(0,mb);
    end

    initial begin
        clk         = 0;
        forever clk = #(clk_c/2) ~clk;
    end

    initial begin
        // your bench here
    end

endmodule