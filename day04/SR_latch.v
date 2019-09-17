// Set-Reset latch

module SR_latch
(
  input S,	// Set
  input R,	// Reset
  output Q, _Q
);

nor  top(Q, R, _Q);
nor bottom(_Q, S, Q);

endmodule


