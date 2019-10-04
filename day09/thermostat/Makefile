# Minimal Verilog simulation Makefile example
#   See Day 4 for a more general, re-usable example


# Shortcut (phony) targets for convenience
run: thermostat.vvp
	vvp thermostat.vvp

clean: 
	-rm -f thermostat.vvp thermostat.vcd

.PHONY: run clean


# Compile vvp (Icarus assembly) from testbench
thermostat.vvp: thermostat.t.v thermostat.v
	iverilog -Wall -o thermostat.vvp thermostat.t.v


