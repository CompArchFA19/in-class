// Testbench for thermostat FSM example

`timescale 1ns / 1ps

`include "thermostat.v"

module thermostat_test ();
    reg clk, reset, hot, cold;	// FSM inputs
    wire heater_control;	// FSM output

    // Instantiate DUT
    thermostat dut(.clk(clk), .reset(reset), 
                   .too_hot(hot), .too_cold(cold), 
                   .heat(heater_control));

    // Create clock signal
    always begin
        #2 clk = ~clk;
    end

   // Test sequence
   initial begin
       $dumpfile("thermostat.vcd");
       $dumpvars();
       $display("H C | on");
       clk=0; reset=1; hot=0; cold=0;  #35
       $display("%b %b | %b", hot, cold, heater_control);
       reset=0; #17
       cold=1; #11
       $display("%b %b | %b", hot, cold, heater_control);
       cold=0; #22
       $display("%b %b | %b", hot, cold, heater_control);
       hot=1; #15
       $display("%b %b | %b", hot, cold, heater_control);
       hot=0; #35
       $display("%b %b | %b", hot, cold, heater_control);

       #50 $finish;		// End simulation (otherwise clk is infinite)
   end


endmodule
