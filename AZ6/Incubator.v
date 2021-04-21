module Incubator (clk,
                  sensor,
                  rstn,
                  heater,
                  cooler,
                  CRS);
    
    input clk,rstn;
    input [7:0]sensor;
    output heater,cooler,CRS;
    
    
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
