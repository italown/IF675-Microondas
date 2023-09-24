module keyboard(
    input wire [9:0] keypad,
    input wire enablen,
    output wire [3:0] D,
    output wire loadn
);

reg [3:0] press_buttom;
wire valid_data;

always @(*)
begin
    if (!enablen)
    begin
        case (keypad)
            10'b1000000000: press_buttom <= 4'd9;
            10'b0100000000: press_buttom <= 4'd8;
            10'b0010000000: press_buttom <= 4'd7;
            10'b0001000000: press_buttom <= 4'd6;
            10'b0000100000: press_buttom <= 4'd5;
            10'b0000010000: press_buttom <= 4'd4;
            10'b0000001000: press_buttom <= 4'd3;
            10'b0000000100: press_buttom <= 4'd2;
            10'b0000000010: press_buttom <= 4'd1;
            10'b0000000001: press_buttom <= 4'd0;
        endcase
    end
end

assign D = press_buttom;
assign loadn = (keypad == 10'b0000000000);

endmodule

