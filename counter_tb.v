module counter_tb;

parameter N = 3;

reg clk;
reg rst_n;
reg [N-1:0] q;
reg [N-1:0] m;
reg en;
wire [N-1:0] count;

counter #(.N(N)) dut (
    .clk(clk),
    .rst_n(rst_n),
    .q(q),
    .m(m),
    .en(en),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst_n = 0;
    en = 0;
    q = 3'b100;
    m = 3'b011;

    #10;
    rst_n = 1;

    en = 1;
    #10;

    en = 0;
    #100;

    q = 3'b010;
    #10;

    $finish;
end

initial begin
    $monitor("Time=%0t rst=%b en=%b q=%b m=%b count=%b",
             $time, rst_n, en, q, m, count);
end

endmodule
