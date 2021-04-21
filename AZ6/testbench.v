`define NULL 0
module testbench;

    parameter clk_c = 10;
    reg clk, rstn;
    reg signed [7:0] sensor;
    wire heater, cooler;
    wire [3:0] CRS;

    Incubator inc (
    .clk(clk),
    .sensor(sensor),
    .rstn(rstn),
    .heater(heater),
    .cooler(cooler),
    .CRS(CRS)
    );
       
   initial begin
        $dumpfile("report/waveform.vcd");
        $dumpvars(0,inc);
    end

    initial begin
        clk         = 0;
        forever clk = #(clk_c/2) ~clk;
    end

    integer i;
    initial begin
        rstn = 0;
        sensor = -10; 
        #clk_c rstn = 1;
        
        for (i=-10;i<61;i=i+1)begin
            #clk_c sensor = i;
        end
        for (i=60;i>=-10;i=i-1)begin
            #clk_c sensor = i;
        end
        $finish;
    end
    
    initial
        $monitor($time,"\ttempreture:%d, AC_state=%d, Fan_state=%d, HEAT=%b, COOL=%b, CRS=%d",sensor,inc.ac.state, inc.fan.state,heater,cooler,CRS);

endmodule