module unv_shift_reg_tb;
parameter N = 4;
reg clk;
reg rst_n;
reg [1:0] mode;
reg sin_r;
reg sin_l;
reg [N-1:0] in;
wire [N-1:0] q;

unv_shift_reg #(.N(N)) dut (
    .clk(clk),
    .rst_n(rst_n),
    .mode(mode),
    .sin_r(sin_r),
    .sin_l(sin_l),
    .in(in),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst_n = 0;
    mode = 2'b00;
    sin_r = 0;
    sin_l = 0;
    in = 4'b0000;

    $monitor("Time=%0t rst=%b mode=%b sin_r=%b sin_l=%b in=%b q=%b",
             $time, rst_n, mode, sin_r, sin_l, in, q);

    #10;
    rst_n = 1;

    mode = 2'b11;
    in = 4'b1011;
    #10;

    mode = 2'b00;
    #10;

    mode = 2'b01;
    sin_r = 1;
    #20;

    mode = 2'b10;
    sin_l = 0;
    #20;

    $finish;
end
endmodule
