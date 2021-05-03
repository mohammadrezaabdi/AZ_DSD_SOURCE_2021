`define RST 1'b0
`define RECV 1'b1

module RX (clk,
           rstn,
           channel_in,
           data_out,
           is_valid);
    
    parameter BIT_LEN = 7;
    
    input clk, rstn, channel_in;
    output reg is_valid;
    output reg [BIT_LEN - 1:0] data_out;
    
    reg state, parity;
    reg [BIT_LEN - 1:0] buffer;
    reg [$clog2(BIT_LEN + 1 + 1 + 1):0] fetch_idx;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= `RST;
        end
        else begin
            case (state)
                `RECV:
                begin
                    if (channel_in && fetch_idx > BIT_LEN + 1) begin
                        state <= `RST;
                    end
                    else if (fetch_idx < BIT_LEN + 2) begin
                        fetch_idx <= fetch_idx + 1;
                    end
                end
                `RST:
                begin
                    if (channel_in) begin
                        state <= `RECV;
                    end
                end
            endcase
        end
    end
    
    always @(state or fetch_idx) begin
        case (state)
            `RECV:
            begin
                if (fetch_idx == 1)  begin
                    parity <= channel_in;
                end
                else if (1 < fetch_idx && fetch_idx <= BIT_LEN + 1) begin
                    buffer[fetch_idx - 2] <= channel_in;
                end
                else if (channel_in && fetch_idx == BIT_LEN + 2) begin
                    data_out <= buffer;
                    is_valid <= (^buffer == parity);
                end
            end
            `RST:
            begin
                buffer    <= 0;
                fetch_idx <= 0;
            end
        endcase
    end
    
endmodule
