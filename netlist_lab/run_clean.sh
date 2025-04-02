#!/bin/bash
iverilog -o sim clean.v testbench.v && vvp sim && gtkwave waveform.vcd
