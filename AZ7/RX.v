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
                if (fetch_idx <= BIT_LEN && fetch_idx > 0) begin
                    buffer[fetch_idx - 1] <= channel_in;
                end
                else if (fetch_idx == BIT_LEN + 1) begin
                    parity <= channel_in;
                end
                else if (channel_in && fetch_idx == BIT_LEN + 2) begin
                    data_out <= buffer;
                    is_valid <= (^buffer == parity);
                end
            end
            `RST:
            begin
                is_valid  <= 0;
                parity    <= 0;
                buffer    <= 0;
                fetch_idx <= 0;
                data_out  <= {BIT_LEN{1'bz}};
            end
        endcase
    end
    
endmodule
