`define NULL 0
module testbench();
    
    parameter BIT_LEN = 7;
    parameter clk_c   = 10;
    
    reg clk, u0_rstn, u1_rstn, u0_start, u1_start, ng0_en, ng1_en;
    reg [BIT_LEN - 1:0] u0_in, u1_in;
    wire [BIT_LEN - 1:0] u0_out, u1_out;
    wire u0_rx_channel, u0_tx_channel, u1_rx_channel, u1_tx_channel, u0_valid, u1_vaild;
    
    UART #(.BIT_LEN(BIT_LEN)) uart0(
    .clk(clk),
    .rstn(u0_rstn),
    .tx_start(u0_start),
    .tx_data_in(u0_in),
    .tx_channel_out(u0_tx_channel),
    .rx_channel_in(u0_rx_channel),
    .rx_data_out(u0_out),
    .rx_out_vaild(u0_valid)
    );
    
    UART #(.BIT_LEN(BIT_LEN)) uart1(
    .clk(clk),
    .rstn(u1_rstn),
    .tx_start(u1_start),
    .tx_data_in(u1_in),
    .tx_channel_out(u1_tx_channel),
    .rx_channel_in(u1_rx_channel),
    .rx_data_out(u1_out),
    .rx_out_vaild(u1_valid)
    );
    
    NOISE_GENERATOR ng0 (
    .clk(clk),
    .sig_in(u0_tx_channel),
    .en(ng0_en),
    .sig_out(u1_rx_channel)
    );
    
    NOISE_GENERATOR ng1 (
    .clk(clk),
    .sig_in(u1_tx_channel),
    .en(ng1_en),
    .sig_out(u0_rx_channel)
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
    integer n;
    initial begin
        u0_rstn = 0;
        u1_rstn = 0;
        ng1_en  = 0;
        ng0_en  = 0;
        #clk_c;
        u0_rstn = 1;
        u1_rstn = 1;
        n       = 50;
        
        $display("test connection uart0 -> uart1");
        for (i = 0; i < n; i++) begin
            u0_start = 1;
            u0_in    = {BIT_LEN{$random(seed)}};
            #clk_c
            u0_start = 0;
            while(uart1.rx.state || uart0.tx.state) begin
                #clk_c;
            end
            if (u0_in == u1_out && u1_valid) begin
                $display("#%d (u0:%b -> u1-v:%b(%b)) test passed", i, u0_in, u1_out, u1_valid);
            end
            else begin
                $display("#%d (u0:%b -> u1-v:%b(%b)) test failed", i, u0_in, u1_out, u1_valid);
            end
        end
        
        $display("test connection uart1 -> uart0");
        for (i = 0; i < n; i++) begin
            u1_start = 1;
            u1_in    = {BIT_LEN{$random(seed)}};
            #clk_c
            u1_start = 0;
            while(uart0.rx.state || uart1.tx.state) begin
                #clk_c;
            end
            if (u1_in == u0_out && u0_valid) begin
                $display("#%d (u1:%b -> u0-v:%b(%b)) test passed", i, u1_in, u0_out, u0_valid);
            end
            else begin
                $display("#%d (u1:%b -> u0-v:%b(%b)) test failed", i, u1_in, u0_out, u0_valid);
            end
        end
        
        n = 10;
        
        ng0_en = 1;
        #clk_c
        $display("test connection with noise uart0 -> uart1");
        for (i = 0; i < n; i++) begin
            u0_start = 1;
            u0_in    = {BIT_LEN{$random(seed)}};
            #clk_c
            u0_start = 0;
            while(uart1.rx.state || uart0.tx.state) begin
                #clk_c;
            end
            if (u0_in == u1_out && u1_valid) begin
                $display("#%d (u0:%b -> u1-v:%b(%b)) test passed", i, u0_in, u1_out, u1_valid);
            end
            else begin
                $display("#%d (u0:%b -> u1-v:%b(%b)) test failed (noise detected)", i, u0_in, u1_out, u1_valid);
            end
        end
        
        ng1_en = 1;
        #clk_c;
        $display("test connection with noise uart1 -> uart0");
        for (i = 0; i < n; i++) begin
            u1_start = 1;
            u1_in    = {BIT_LEN{$random(seed)}};
            #clk_c
            u1_start = 0;
            while(uart0.rx.state || uart1.tx.state) begin
                #clk_c;
            end
            if (u1_in == u0_out && u0_valid) begin
                $display("#%d (u1:%b -> u0-v:%b(%b)) test passed", i, u1_in, u0_out, u0_valid);
            end
            else begin
                $display("#%d (u1:%b -> u0-v:%b(%b)) test failed (noise detected)", i, u1_in, u0_out, u0_valid);
            end
        end
        $finish;
    end
    
endmodule
