#!/bin/bash
iverilog -o sim_trojan torjan.v testbench_trojan.v
vvp sim_trojan
gtkwave waveform_trojan.vcd
