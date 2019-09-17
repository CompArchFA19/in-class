// Test harness for SR latch
//   This version uses the $monitor system task, which prints the monitored
//   signals every time they change.
//   Note: In more complicated circuits, signals may change multiple times
//         after an input change before settling to their final value.
//         Be sure to allow for this time and pay attention to the last value.
//
//  $monitor docs: http://verilog.renerta.com/source/vrg00013.htm

`include "SR_latch.v"

module SR_test();

  // Instantiate device/module under test
  reg S, R;	// Primary test inputs
  wire Q, _Q;	// Test outputs

  SR_latch dut(S, R, Q, _Q);	// Module to be tested
  

  // Sequence of test stimuli (non-synthesizable simulation part)
  initial begin

    // Test pattern stimulus
    $display("Time | S R | Q _Q");
    $monitor("%4t | %b %b | %b %b", $time, S, R, Q, _Q);
    // I limited time field width to 4 characters, you might need more
    S=0; R=0; #5
    S=1; R=0; #5 
    S=0; R=0; #5 
    S=0; R=1; #5 
    S=0; R=0;
    
    $finish();	// End simulation
  end

endmodule
