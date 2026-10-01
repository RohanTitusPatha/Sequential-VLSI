`timescale 1ns/1ps
module tb;
    reg clk = 0, rst = 1, req0 = 0, req1 = 0;
    wire gnt0, gnt1;

    arbiter dut (clk, rst, req0, req1, gnt0, gnt1);

    always #5 clk = ~clk;

    initial begin
        $dumpfile("arb.vcd");
        $dumpvars(0, tb);

        #12 rst = 0;
        #10 req0 = 1; req1 = 1;
        #30 req0 = 0;
        #30 req1 = 0;
        #20 req1 = 1;
        #20 req0 = 1;
        #30 req0 = 0; req1 = 0;
        #30 $finish;
    end
endmodule
