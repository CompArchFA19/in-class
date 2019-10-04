// Test bench for car.v, a "self-driving" car that obeys traffic lights

`timescale 1 ns / 1 ps

`include "car.v"
`include "light.v"


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
        $display("Green light = %b", `GREEN);
        $display("Yellow light = %b", `YELLOW);
        $display("Red light = %b", `RED);
        $display(" light  |  Gas    Brake    Park");
        light = `GREEN;
        #50
        $display("  %b    |   %b       %b       %b", light, gas, brakes, park);
        light = `YELLOW;
        #1000
        $display("  %b    |   %b       %b       %b", light, gas, brakes, park);
        light = `RED;
        #1000
        $display("  %b    |   %b       %b       %b", light, gas, brakes, park);
        light = `GREEN;
        #1000
        $display("  %b    |   %b       %b       %b", light, gas, brakes, park);
        light = `YELLOW;
        #1000
        $display("  %b    |   %b       %b       %b", light, gas, brakes, park);
        #50
        $finish;
    end
endmodule
