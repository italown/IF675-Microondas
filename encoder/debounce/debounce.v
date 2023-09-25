module debounce(
    input wire clear,
    input wire clk,
    output reg out=0
);

reg [3:0] cnt = 4'd0;
reg count = 0;

always @(posedge clear or posedge clk)
begin
    if (clear)
    begin
        count = 0;
        cnt = 4'd0;
        out = 0;
    end
    else if (cnt == 4'd3)
    begin
        out <= 1;
    end
    else if (cnt < 4'd7 && count == 1)
    begin
        cnt <= cnt + 1;
    end
    else if (!clear && cnt == 4'd0)
    begin
        count = 1;
    end
end

endmodule
