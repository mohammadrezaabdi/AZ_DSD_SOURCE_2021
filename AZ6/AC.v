`define S1 2'b01
`define S2 2'b10
`define S3 2'b11

module AC(clk,
          sensor,
          rstn,
          cool_o,
          heat_o);
    input clk, rstn;
    input [7:0] sensor;
    output cool_o,heat_o;
    
    reg [1:0] state;
    reg cooler,heater;
    
    assign cool_o = cooler;
    assign heat_o = heater;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn)begin
            state <= `S1;
        end
        else begin
            
            case (state)
                `S1:
                begin
                    cooler                <= 0;
                    heater                <= 0;
                    if (sensor > 35)state <= `S2;
                    if (sensor < 15)state <= `S3;
                end
                `S2:
                begin
                    heater                 <= 0;
                    cooler                 <= 1;
                    if (sensor < 25) state <= `S1;
                end
                `S3:
                begin
                    heater                 <= 1;
                    cooler                 <= 0;
                    if (sensor > 30) state <= `S1;
                end
            endcase
            
        end
    end
endmodule
