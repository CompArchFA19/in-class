// Example that may be included from multiple other Verilog files

// This file uses an "include guard" (common in languages like C and Verilog
// that use a pre-processor) to prevent its contents from being defined
// multiple times (which causes an error) when imported from multiple places
// within a project.

// If this is the first time the file is included, the symbol LIGHTS_V 
// will not be defined (must choose a unique symbol per file).

// Subsequent times the file is included, this symbol WILL be defined
// and the body of the ifndef...endif will not run.
`ifndef LIGHTS_V
`define LIGHTS_V

// Start of include contents
`define GREEN   2'b00
`define YELLOW  2'b01
`define RED     2'b10

`endif // Ends ifndef LIGHTS_V block

