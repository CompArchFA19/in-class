// Simple thermostat finite state machine (Moore) example

module thermostat
(
    input clk,		// State updates and output transitions are synchronous
    input reset,	// Return to initial state (i.e. off)
    input too_hot,	// True when room is too hot
    input too_cold,	// True when room is too cold
    output reg heat	// True when heater should be turned on
);

    // State encoding (one-hot)
    reg [1:0] state;
    localparam  STATE_ON  = 2'b01,
		STATE_OFF = 2'b10;

    // State update logic
    always @(posedge clk) begin
        // Begin in OFF state out of reset (synchronous reset)
        if (reset) begin
            state <= STATE_OFF;
        end

        else begin
            case (state)
                STATE_OFF: begin
                    // Note: Omitting begin...end for brevity, be careful
                    if (too_cold)
                        state <= STATE_ON;
                    else
                        state <= STATE_OFF;
                end

                STATE_ON: begin
                    if (too_hot)
                        state <= STATE_OFF;
                    else
                        state <= STATE_ON;
                end
            endcase
        end

    end	// @(posedge clk)


    // Output logic (depends only on state - Moore machine)
    always @(state) begin
        case (state)
            STATE_ON:
                heat = 1'b1;
            STATE_OFF:
                heat = 1'b0;
        endcase
    end
    

endmodule
