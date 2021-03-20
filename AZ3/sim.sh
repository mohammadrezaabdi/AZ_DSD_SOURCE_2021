# Ubuntu 20.04 LTS, Icarus Verilog version 10.3 (stable)
shuf -i 0-2147483647 -n 1 > seed.dat
iverilog -o comparator testbench.v comp_4bit_comb.v comp_4bit_seq.v comp_1bit_comb.v
vvp comparator > report/testbench_res.txt