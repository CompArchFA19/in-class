// Test harness for SR latch
// This version uses the $dumpvars system task to write waveforms to a file
// Note: You can use $dumpvars in combination with the other printing methods.
//
//  $dumpvars docs: http://verilog.renerta.com/source/vrg00056.htm

`include "SR_latch.v"

module SR_test();

  // Instantiate device/module under test
  reg S, R;	// Primary test inputs
  wire Q, _Q;	// Test outputs

  SR_latch dut(S, R, Q, _Q);	// Module to be tested
  

  // Sequence of test stimuli (non-synthesizable simulation part)
  initial begin

    // Dump trace to a file. Open with gtkwave.
    $dumpfile("SR_latch-dump.vcd");
    $dumpvars();
    // Calling $dumpvars without arguments dumps all signals. This might be
    // too much as our circuits get bigger.

    // Test pattern stimulus
    S=0; R=0; #5
    S=1; R=0; #5 
    S=0; R=0; #5 
    S=0; R=1; #5 
    S=0; R=0;

    $finish();	// End simulation
  end

endmodule
