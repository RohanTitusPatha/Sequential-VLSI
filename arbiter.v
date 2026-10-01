module arbiter (
    input wire clk, rst,
    input wire req0, req1,
    output reg gnt0, gnt1
);
    localparam IDLE = 2'b00, GNT0 = 2'b01, GNT1 = 2'b10;
    reg [1:0] state, next_state;

    always @(posedge clk) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            IDLE: begin
                if (req0)
                    next_state = GNT0;
                else if (req1)
                    next_state = GNT1;
                else
                    next_state = IDLE;
            end
            GNT0: begin
                if (req0)
                    next_state = GNT0;
                else if (req1)
                    next_state = GNT1;
                else
                    next_state = IDLE;
            end
            GNT1: begin
                if (req1)
                    next_state = GNT1;
                else if (req0)
                    next_state = GNT0;
                else
                    next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

    always @(*) begin
        gnt0 = (state == GNT0);
        gnt1 = (state == GNT1);
    end
endmodule
