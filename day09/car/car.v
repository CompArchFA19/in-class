`timescale 1 ns / 1 ps

// Example of a Finite State Machine for a self-driving car, where the traffic light input dictates car's behavior

module car(
    input [1:0] trafficlight,
    input clk,
    output reg gas,
    output reg park,
    output reg brakes);

    // State encoding (binary)
    reg [1:0] state;
    localparam GO = 2'b00;
    localparam SLOW = 2'b01;
    localparam STOP = 2'b10;
    
    // Change state on the clk edges
    always @(posedge clk) begin
        if (trafficlight == 2'b00) begin  // Green
            state <= GO;
        end
        if (trafficlight == 2'b01) begin  // Yellow
            state <= SLOW;
        end
        if (trafficlight == 2'b10) begin  // Red
            state <= STOP;
        end
    end  // @(posedge clk)
    
    // Output logic, depends only on state
    always @(state) begin
        case (state)
            //driving - follow traffic laws
            GO: begin
                gas = 1;
                brakes = 0;
                park = 0;
            end
            SLOW: begin
                gas = 0;
                brakes = 1;
                park = 0;
            end
            STOP: begin
                gas = 0;
                brakes = 1;
                park = 1;
            end
        endcase
    end
endmodule
