`include "./encoder/mod100/mod100.v"
`include "./encoder/mux/mux.v"
`include "./encoder/debounce/debounce.v"
`include "./encoder/keyboard/keyboard.v"

module encoder(
    input wire [9:0] key,
    input wire enbn,
    input wire clk,
    output wire [3:0] D,
    output wire loadn,
    output wire pgt
);

wire int_clear, mux_a, mux_b;

keyboard convert_key(.keypad(key), .enablen(enbn), .D(D), .loadn(int_clear));
debounce dbc(.clk(clk), .clear(int_clear), .out(mux_a));
mod100 div(.clk(clk), .clk_mod(mux_b));

mux mux2x1(.a(mux_a), .b(mux_b), .seletor(enbn), .out(pgt));

assign loadn = int_clear;

endmodule