# Ubuntu 20.04 LTS, Icarus Verilog version 10.3 (stable)
shuf -i 0-2147483647 -n 1 > seed.dat
iverilog -o comparator *v
vvp comparator |tee -a report/result.txt