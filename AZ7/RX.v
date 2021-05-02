`define RST 2'b00
`define RECV 2'b01
`define IDLE 2'b11

module RX (clk,
           rstn,
           channel_in,
           data_out,
           is_valid);
    
    parameter BIT_LEN = 7;
    
    input clk, rstn, channel_in;
    output reg is_valid;
    output reg [BIT_LEN - 1:0] data_out;
    
    reg [1:0] state;
    reg parity;
    reg [BIT_LEN - 1:0] buffer;
    reg [$clog2(BIT_LEN + 1 + 1 + 1):0] fetch_idx;
    
    always @(posedge clk or negedge rstn) begin
        // $display("rx:%d", channel_in);
        if (!rstn) begin
            state <= `RST;
        end
        else begin
            case (state)
                `IDLE:
                begin
                    if (channel_in) begin
                        state <= `RECV;
                    end
                end
                `RECV:
                begin
                    if (channel_in && fetch_idx > BIT_LEN + 1) begin
                        state <= `IDLE;
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
                    else begin
                        state <= `IDLE;
                    end
                end
            endcase
        end
    end
    
    always @(state or fetch_idx) begin
        case (state)
            `IDLE:
            begin
                // do nothing
            end
            `RECV:
            begin
                if (0 < fetch_idx && fetch_idx <= BIT_LEN) begin
                    buffer[fetch_idx - 1] <= channel_in;
                end
                else if (fetch_idx == BIT_LEN + 1) begin
                    parity <= channel_in;
                end
                else if (channel_in && fetch_idx == BIT_LEN + 2) begin
                    data_out <= buffer;
                    is_valid  <= (^buffer == parity);
                    fetch_idx <= 0;
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
