module mux(
    input wire seletor,
    input wire a,
    input wire b,
    output wire out
);

//Se o seletor for 1, a saída vai ser b, se não, será a
assign out = (seletor) ? b : a;

endmodule