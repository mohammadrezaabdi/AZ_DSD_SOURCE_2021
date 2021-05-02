module UART(clk,
            rstn,
            tx_start,
            tx_data_in,
            tx_channel_out,
            rx_channel_in,
            rx_data_out,
            rx_out_vaild);
    
    parameter BIT_LEN = 7;
    
    input clk, rstn, tx_start, rx_channel_in;
    input [BIT_LEN-1:0] tx_data_in;
    output tx_channel_out, rx_out_vaild;
    output [BIT_LEN-1:0] rx_data_out;
    
    TX #(.BIT_LEN(BIT_LEN)) tx (
    .clk(clk),
    .rstn(rstn),
    .start(tx_start),
    .data_in(tx_data_in),
    .channel_out(tx_channel_out)
    );
    
    RX #(.BIT_LEN(BIT_LEN)) rx (
    .clk(clk),
    .rstn(rstn),
    .channel_in(rx_channel_in),
    .data_out(rx_data_out),
    .is_valid(rx_out_vaild)
    );
    
    
endmodule
