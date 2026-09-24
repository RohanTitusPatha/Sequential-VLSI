module counter#(parameter N=3)(
input clk,
input rst_n,
input [N-1:0]q,
input [N-1:0]m,
input en,
output reg [N-1:0]count
);
reg [N-1:0]count2;

always @(posedge clk) begin
    if (!rst_n) begin
        count <= 'b0;
        count2 <= 'b0;
    end
    else if(en) begin
        count <= q;
        count2 <= m;
    end
    else begin
        if (count > 0) begin
            count <= count-1;
        end
        else if (count2 > 0) begin
            count <= q;
            count2 <= count2-1;
        end
        else
            count <= 0;
    end
end
endmodule
