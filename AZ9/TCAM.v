module TCAM (word,address,R_Wb,clk);
  parameter word_length = 8;
  parameter address_length = 5;
  inout [address_length - 1 : 0] address;
  input [word_length - 1 : 0] word;
  input R_Wb ,clk;
  reg [word_length - 1 : 0] memory [(1 << address_length) - 1 : 0];
  reg [address_length: 0] i;
  reg [address_length - 1 : 0] readCandidate;

  assign address = (R_Wb) ? readCandidate : 'bz;

  // this function get number of x elements in given bit-vector
  function [word_length - 1 : 0] numberOfX;
    input [word_length - 1 : 0] c;
    reg [word_length - 1 : 0] number, j;
    begin
      number = 0;
      for(j = 0 ; j < word_length ; j = j + 1) begin
        if (c[j] === 1'bx) begin
          number = number + 1;
        end
      end
    numberOfX = number;
    end
  endfunction

  // this function checks equality of two bit-vectors with ignoring x's
  function equals;
    input [word_length - 1 : 0] a,b;
    reg [word_length - 1 : 0] j;
    reg flag;
    begin
      flag = 1;
      for(j = 0 ; j < word_length ; j = j + 1) begin
        if (a[j] !== 1'bx && b[j] !== 1'bx && a[j] != b[j]) begin
          flag = 0;
        end
      end
      equals = flag;
    end
  endfunction

  // read
  always @ (posedge clk) begin
    if (R_Wb) begin
      readCandidate = 'bx;
      for (i = 0 ; i < (1 << address_length) ; i = i + 1) begin
        if(equals(memory[i] , word)) begin
          if (readCandidate === 'bx || (readCandidate !== 'bx && numberOfX(memory[readCandidate]) > numberOfX(memory[i]))) begin
            readCandidate = i;
          end
        end
      end
    end
  end

  // write
  always @ (posedge clk) begin
    if (!R_Wb) begin
      memory[address] = word;
    end
  end
endmodule
