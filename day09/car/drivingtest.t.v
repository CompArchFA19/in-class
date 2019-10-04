// This module is made to test fsm.v, the traffic light fsm example.

`include "car.v"


module driver();
    reg [1:0] light = 3'b00;
    reg clk;
    reg dutpassed =0;
    wire gas, brakes, park;
    
    // instantiate device under test
    car dut(.trafficlight(light),
            .clk(clk),
            .gas(gas), .park(park), .brakes(brakes));
    
    
    // start clock
    initial clk=0;
    always #10 clk=!clk;
    
    initial begin
    //displays, just for the easy check.
        $dumpfile("traffic.vcd");
        $dumpvars();
        $display("Green light = 00");
        $display("Yellow light = 01");
        $display("Red light = 10");
        $display(" light  |  Gas    Brake    Park");
        light = 2'b00;
        #50
        $display("  %b    |   %b       %b       %b", light, gas, brakes, park);
        light = 2'b01;
        #1000
        $display("  %b    |   %b       %b       %b", light, gas, brakes, park);
        light = 2'b10;
        #1000
        $display("  %b    |   %b       %b       %b", light, gas, brakes, park);
        light = 2'b00;
        #1000
        $display("  %b    |   %b       %b       %b", light, gas, brakes, park);
        light = 2'b01;
        #1000
        $display("  %b    |   %b       %b       %b", light, gas, brakes, park);
        #50
        $finish;
    end
endmodule
