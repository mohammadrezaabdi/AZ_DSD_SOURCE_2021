module Incubator (clk,
                  sensor,
                  rstn,
                  heater,
                  cooler,
                  CRS);
    
    input clk,rstn;
    input signed [7:0]sensor;
    output heater,cooler;
    output [3:0] CRS;
    
    
    AC ac (
    .clk(clk),
    .sensor(sensor),
    .rstn(rstn),
    .cool_o(cooler),
    .heat_o(heater)
    );
    
    Fan fan (
    .clk(clk),
    .sensor(sensor),
    .rstn(rstn),
    .CRS_o(CRS)
    );
    
    
endmodule
