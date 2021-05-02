`define RST 2'b00
`define SEND 2'b10
`define IDLE 2'b11

module TX (clk,
           rstn,
           start,
           data_in,
           channel_out);
    
    parameter BIT_LEN = 7;
    
    input clk, rstn, start;
    input [BIT_LEN - 1:0] data_in;
    output reg channel_out;
    
    reg [1:0] state;
    reg [BIT_LEN - 1:0] buffer;
    reg [$clog2(BIT_LEN + 1 + 1 + 1):0] send_idx;
    
    always @(posedge clk or negedge rstn) begin
        // $display("tx:%d", channel_out);
        if (!rstn) begin
            state <= `RST;
        end
        else begin
            case (state)
                `IDLE:
                begin
                    if (start) begin
                        state <= `SEND;
                    end
                end
                `SEND:
                begin
                    if (send_idx > BIT_LEN + 1) begin
                        state <= `IDLE;
                    end
                    else begin
                        send_idx <= send_idx + 1;
                    end
                end
                `RST:
                begin
                    if (start) begin
                        state <= `SEND;
                    end
                    else begin
                        state <= `IDLE;
                    end
                end
            endcase
        end
    end
    
    always @(state or send_idx) begin
        case (state)
            `IDLE:
            begin
                // do nothing
            end
            `SEND:
            begin
                if (send_idx == 0) begin
                    buffer      <= data_in;
                    channel_out <= 1;
                end
                else if (0 < send_idx && send_idx <= BIT_LEN) begin
                    channel_out <= buffer[send_idx - 1];
                end
                else if (send_idx == BIT_LEN + 1) begin
                    channel_out <= ^buffer;
                end
                else if (send_idx == BIT_LEN + 2) begin
                    channel_out <= 1;
                    send_idx    <= 0;
                end
            end
            `RST:
            begin
                buffer      <= 0;
                send_idx    <= 0;
                channel_out <= 0;
            end
        endcase
    end
    
endmodule
