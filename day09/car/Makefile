# Minimal Verilog simulation Makefile example
#   See Day 4 for a more general, re-usable example


# Shortcut (phony) targets for convenience
run: drivingtest.vvp
	vvp drivingtest.vvp

clean: 
	-rm -f drivingtest.vvp traffic.vcd

.PHONY: run clean


# Compile vvp (Icarus assembly) from testbench
drivingtest.vvp: drivingtest.t.v car.v
	iverilog -Wall -o drivingtest.vvp drivingtest.t.v


