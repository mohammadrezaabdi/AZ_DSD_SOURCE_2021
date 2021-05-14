module TCAM (word,
             address,
             rwn,
             clk);
    parameter WORD_LEN = 8;
    parameter ADDR_LEN = 5;
    
    inout [ADDR_LEN - 1 : 0] address;
    input [WORD_LEN - 1 : 0] word;
    input rwn ,clk;
    
    reg [WORD_LEN - 1 : 0] memory [(1 << ADDR_LEN) - 1 : 0];
    reg [ADDR_LEN - 1 : 0] read_candidate;
    
    assign address = (rwn) ? read_candidate : 'bz;
    
    
    reg [ADDR_LEN: 0] i;
    always @ (posedge clk) begin
        if (rwn) begin
            read_candidate = 'bx;
            for (i = 0 ; i < (1 << ADDR_LEN) ; i = i + 1) begin
                if (equals(memory[i] , word)) begin
                    if (read_candidate === 'bx || (number_of_x(memory[read_candidate]) > number_of_x(memory[i]))) begin
                        read_candidate = i;
                    end
                end
            end
        end
        else begin
            memory[address] = word;
        end
    end
    
    
    // this function get number of x elements in given bit-vector
    function [WORD_LEN - 1 : 0] number_of_x;
        input [WORD_LEN - 1 : 0] c;
        reg [WORD_LEN - 1 : 0] number, j;
        begin
            number = 0;
            for(j = 0 ; j < WORD_LEN ; j = j + 1) begin
                if (c[j] === 1'bx) begin
                    number = number + 1;
                end
            end
            number_of_x = number;
        end
    endfunction
    
    // this function checks equality of two bit-vectors with ignoring x's
    function equals;
        input [WORD_LEN - 1 : 0] a,b;
        reg [WORD_LEN - 1 : 0] j;
        reg flag;
        begin
            flag = 1;
            for(j = 0 ; j < WORD_LEN ; j = j + 1) begin
                if (a[j] !== 1'bx && b[j] !== 1'bx && a[j] != b[j]) begin
                    flag = 0;
                end
            end
            equals = flag;
        end
    endfunction
    
endmodule
