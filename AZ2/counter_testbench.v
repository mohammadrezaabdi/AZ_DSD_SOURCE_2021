module counter_testbench ();

reg clk, ud, enable, clear;
wire [3:0] counter;

Counter_Up_Down_4bit cont(	
    .U_nD(ud),
	.En(enable),
	.CLRN(clear),
	.clk(clk),
	.Q0(counter[0]),
	.Q1(counter[1]),
	.Q2(counter[2]),
	.Q3(counter[3])
);
initial begin 
clk=0;
forever #2 clk=~clk;
end
initial begin
ud = 1;
enable = 1;
clear =	0;
#2
clear = 1;
#80;
enable=0;
#40
ud = 0;
enable = 1;
#80
enable=0;
$stop;
end

initial
    $monitor($time, " ud:%b en:%b out:%b", ud, enable, counter);

endmodule //counter_testbench