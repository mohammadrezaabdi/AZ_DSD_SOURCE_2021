module NOISE_GENERATOR(clk,
                       sig_in,
                       en,
                       sig_out);
    
    input clk, sig_in, en;
    output sig_out;
    
    integer counter;
    
    assign sig_out = (en) ? ((counter == 5) || sig_in) : sig_in;
    
    always @(posedge clk) begin
        if (counter < 10) begin
            counter = counter + 1;
        end
        else begin
            counter = 0;
        end
    end
endmodule
