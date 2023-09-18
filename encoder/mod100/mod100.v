//Esse módulo conta até 100 para mudar o sinal do clock para ~clock

module mod100(
    input wire clk,
    output wire clk_mod
);

reg [6:0] cnt = 0;
reg zerar = 0;
assign clk_mod = zerar;

always @(posedge clk)
begin
    cnt <= cnt + 1;
    if (cnt == 7'd99)
        begin
            zerar <= 1;
            cnt <= 0;
        end
    else
        begin
            zerar <= 0;
        end
end
endmodule