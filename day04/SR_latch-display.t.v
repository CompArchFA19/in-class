// Test harness for SR latch
//   This version uses the $display system task to explicitly print results
//
//  $display docs: http://verilog.renerta.com/source/vrg00013.htm

`include "SR_latch.v"

module SR_test();

  // Instantiate device/module under test
  reg S, R;	// Primary test inputs
  wire Q, _Q;	// Test outputs

  SR_latch dut(S, R, Q, _Q);	// Module to be tested
  

  // Sequence of test stimuli (non-synthesizable simulation part)
  initial begin

    // Test pattern stimulus
    $display("S R | Q _Q");
    S=0; R=0; #5
    $display("%b %b | %b %b", S, R, Q, _Q);
    S=1; R=0; #5 
    $display("%b %b | %b %b", S, R, Q, _Q);
    S=0; R=0; #5 
    $display("%b %b | %b %b", S, R, Q, _Q);
    S=0; R=1; #5 
    $display("%b %b | %b %b", S, R, Q, _Q);
    S=0; R=0; #5 
    $display("%b %b | %b %b", S, R, Q, _Q);

    $finish();	// End simulation
  end

endmodule
