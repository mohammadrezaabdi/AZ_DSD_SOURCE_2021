module testbench ;
  reg [7:0] word;
  reg R_Wb,clk;
  wire [1:0] address;
  reg [1:0] address_help;

  TCAM tcam0 (word,address,R_Wb,clk);
  defparam tcam0.word_length = 8;
  defparam tcam0.address_length = 2;

  always #1 clk = ~clk; // clock cycle is 2 
  assign address = (!R_Wb) ? address_help : 'bz;

  initial begin
        clk = 0;
        R_Wb = 0; word = 8'b0111xx11; address_help = 0;
    #2  R_Wb = 0; word = 8'b11x01001; address_help = 1;
    #2  R_Wb = 0; word = 8'b01110x11; address_help = 2;
    #2  R_Wb = 0; word = 8'b1101xx11; address_help = 3;
    #2  R_Wb = 1; word = 8'b0111xx11;
    #2  R_Wb = 1; word = 8'bxxxxxxxx;
    #2  R_Wb = 1; word = 8'b11xxxx11;
    #2  R_Wb = 0; word = 8'b11110101; address_help = 0;
    #2  R_Wb = 0; word = 8'b101xxxxx; address_help = 1;
    #2  R_Wb = 0; word = 8'b10110x11; address_help = 2;
    #2  R_Wb = 0; word = 8'b0100xx01; address_help = 3;
    #2  R_Wb = 1; word = 8'b11xx0101;
    #2  R_Wb = 1; word = 8'b10011011;
    #2  R_Wb = 1; word = 8'b10xxxxxx;
    #2  $stop;
  end

  initial begin
    $monitor($time," R/Wb=%d  word=%b address=%d",R_Wb,word,address);
  end
endmodule
