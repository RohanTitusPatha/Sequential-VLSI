module unv_shift_reg #(parameter N=4)(
input clk,
input rst_n,
input [1:0]mode,
input sin_r,
input sin_l,
input [N-1:0]in,
output reg [N-1:0]q
);

always @(posedge clk) begin
    if (!rst_n)
        q <= 'b0;
    else begin
        case(mode)
            2'b00: q<=q;
            2'b01: q<={sin_r,q[N-1:1]};
            2'b10: q<={q[N-2:0],sin_l};
            2'b11: q<=in;
        endcase
    end
end
endmodule
