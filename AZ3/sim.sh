# Ubuntu 20.04 LTS, Icarus Verilog version 10.3 (stable)
shuf -i 0-2147483647 -n 1 > seed.dat
iverilog -o comparator testbench.v dff.v comp_seq.v comp_comb.v comp_1bit_comb.v
vvp comparator |tee report/result.txt

