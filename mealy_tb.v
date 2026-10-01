`timescale 1ns/1ps
module mealy_tb;
    reg clk = 0, rst = 1, din = 0;
    wire z_mealy;

    mealy dut (clk, rst, din, z_mealy);

    always #5 clk = ~clk;

    reg [15:0] pattern = 16'b1011_0110_1011_1010;
    integer i;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, mealy_tb);
        #12 rst = 0;
        for (i = 15; i >= 0; i = i - 1) begin
            @(negedge clk) din = pattern[i];
        end
        #30 $finish;
    end
endmodule
