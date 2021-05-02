`define NULL 0
module testbench();
    
    parameter BIT_LEN = 7;
    parameter clk_c   = 10;
    
    reg clk, u0_rstn, u1_rstn, u0_start, u1_start;
    reg [BIT_LEN - 1:0] u0_in, u1_in;
    wire [BIT_LEN - 1:0] u0_out, u1_out;
    wire u01_channel, u10_channel, u0_valid, u1_vaild;
    
    UART #(.BIT_LEN(BIT_LEN)) uart0(
    .clk(clk),
    .rstn(u0_rstn),
    .tx_start(u0_start),
    .tx_data_in(u0_in),
    .tx_channel_out(u01_channel),
    .rx_channel_in(u10_channel),
    .rx_data_out(u0_out),
    .rx_out_vaild(u0_valid)
    );
    
    UART #(.BIT_LEN(BIT_LEN)) uart1(
    .clk(clk),
    .rstn(u1_rstn),
    .tx_start(u1_start),
    .tx_data_in(u1_in),
    .tx_channel_out(u10_channel),
    .rx_channel_in(u01_channel),
    .rx_data_out(u1_out),
    .rx_out_vaild(u1_valid)
    );
    
    
    initial begin
        $dumpfile("report/waveform.vcd");
        $dumpvars(0,uart0, uart1);
    end
    
    initial begin
        clk         = 0;
        forever clk = #(clk_c/2) ~clk;
    end
    
    integer data_file;
    integer scan_file;
    integer seed;
    initial begin
        data_file = $fopen("seed.dat", "r");
        if (data_file == `NULL) begin
            $display("data_file handle was NULL");
            $finish;
        end
        scan_file = $fscanf(data_file, "%d", seed);
        if (scan_file == `NULL) begin
            $display("integer read error");
            $finish;
        end
    end
    
    integer i;
    initial begin
        u0_rstn = 0;
        u1_rstn = 0;
        #clk_c;
        u0_rstn = 1;
        u1_rstn = 1;
        for (i = 0; i < 3; i++) begin
            u0_start = 1;
            u0_in    = {BIT_LEN{$random(seed)}};
            #clk_c
            u0_start = 0;
            while(uart1.rx.state || uart0.tx.state) begin
                #clk_c;
            end
        end
        $finish;
    end
    
    initial
        $monitor($time, "\t u0:%b -> u1-v:%b(%b), u0_state:%d, u1_state:%d, u0_counter:%d, u1_counter:%d, channel:%b", u0_in, u1_out, uart1.rx.is_valid, uart0.tx.state, uart1.rx.state, uart0.tx.send_idx, uart1.rx.fetch_idx, u01_channel);
    
endmodule
