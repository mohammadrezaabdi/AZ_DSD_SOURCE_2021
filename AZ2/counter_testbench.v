module counter_testbench ();

reg clk, ud, enable, clear;
wire [3:0] counter;

Counter_Up_Down_4bit cont(	
    .DNUP(ud),
	.CIN(enable),
	.CLRN(clear),
	.clk(clk),
	.QA(counter[0]),
	.QB(counter[1]),
	.QC(counter[2]),
	.QD(counter[3])
);
initial begin 
clk=0;
forever #2 clk=~clk;
end
initial begin
ud = 0;
enable = 1;
clear =	0;
#2
clear = 1;
#80;
enable=0;
#40
ud = 1;
enable = 1;
#80
enable=0;
$stop;
end

initial
    $monitor($time, " ud:%b en:%b out:%b", ud, enable, counter);

endmodule //counter_testbench