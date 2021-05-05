# Ubuntu 20.04 LTS, Icarus Verilog version 10.3 (stable)
shuf -i 0-2147483647 -n 1 > seed.dat
iverilog -o mulc mul_comp.v testbench_mul.v
iverilog -o asc add_sub_comp.v testbench_add_sub.v
vvp mulc |tee report/result_mulc.txt
vvp asc |tee report/result_asc.txt
