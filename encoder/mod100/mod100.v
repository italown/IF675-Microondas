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
// mudei cnt <= cnt+2 e o if de 99 pra cnt == 7'd100
    cnt <= cnt + 2;
    if (cnt == 7'd100)
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