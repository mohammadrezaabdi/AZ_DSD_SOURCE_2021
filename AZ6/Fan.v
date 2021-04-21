`define OUT 2'b00
`define S1 2'b01
`define S2 2'b10
`define S3 2'b11

module Fan(clk,
          sensor,
          rstn,
          CRS_o,
          );
    input clk, rstn;
    input signed [7:0] sensor;
    output [3:0] CRS_o;
    
    reg [1:0] state;
    reg [3:0] CRS;
    
    assign CRS_o = CRS;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn)begin
            state <= `OUT;
            CRS   <= 0;
        end
        else begin
            case (state)
                `OUT:
                begin
                    CRS                    <= 0;
                    if (sensor > 35) state <= `S1;
                end
                `S1:
                begin
                    CRS                    <= 4;
                    if (sensor > 40) state <= `S2;
                    if (sensor < 25) state <= `OUT;
                end
                `S2:
                begin
                    CRS                    <= 6;
                    if (sensor > 45) state <= `S3;
                    if (sensor < 35) state <= `S1;
                    
                end
                `S3:
                begin
                    CRS                    <= 8;
                    if (sensor < 40) state <= `S2;
                end
            endcase
        end
    end
endmodule
