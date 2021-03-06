module testbench();
 
  reg [15:0] a;
  reg div11;
  wire out;
  
  Main main (
  	.a00(a[0]),
	.a01(a[1]),
	.a02(a[2]),
	.a03(a[3]),
	.a10(a[4]),
	.a11(a[5]),
	.a12(a[6]),
	.a13(a[7]),
	.a20(a[8]),
	.a21(a[9]),
	.a22(a[10]),
	.a23(a[11]),
	.a30(a[12]),
	.a31(a[13]),
	.a32(a[14]),
	.a33(a[15]),
	.div_11_n3(div11),
	.o(out)
  );
 
  initial begin
    a = 16'b0011_0010_0011_0101; //3235 -> 0
	div11 = 0;
    #20
    a = 16'b0011_0010_0011_0101; //3235 -> 0
	div11 = 1;
    #20
    a = 16'b0011_0010_0011_0100; //3234 -> 1
	div11 = 0;
    #20
    a = 16'b0011_0010_0011_0100; //3234 -> 1
	div11 = 1;
    #20
	a = 16'b1000_0101_0101_1000; //8558 -> 1
	div11 = 1;
    #20
    a = 16'b1000_0011_1000_0010; //8382 -> 1
	div11 = 1;
    #20
	a = 16'b1001_1001_1001_1001; //9999 -> 1
	div11 = 0;
    #20
	a = 16'b1001_1001_1001_1001; //9999 -> 1
	div11 = 1;
    #20
	a = 16'b0000_0000_0000_0000; //0000 -> 1
	div11 = 0;
    #20
	a = 16'b0000_0000_0000_0000; //0000 -> 1
	div11 = 1;
    #20
	a = 16'b1001_1000_1001_1001; //9899 -> 0
	div11 = 0;
    #20
	a = 16'b1001_1000_1001_1001; //9899 -> 0
	div11 = 1;
    #20
    $stop;
  end
  
  initial
	$monitor("A:%d%d%d%d	mode:%b -> res:%b",a[15:12],a[11:8],a[7:4],a[3:0],div11,out);
 
endmodule
