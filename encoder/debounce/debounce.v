module debounce(
    input wire clear,
    input wire clk,
    output reg out=0
);

reg [3:0] cnt = 4'd0;
reg count = 0;

//Caso o clear seja ativado, ele irá zerar as variáveis
always @(posedge clear)
begin
    if (cnt == 4'd7)
        begin
            count = 0;
            cnt = 4'd0;
            out = 0;
        end
end

//Ao desativar o clear, ele habilita a contagem no bloco seguinte
always @(negedge clear)
begin
    if (cnt == 4'd0)
        begin
            count = 1;
        end
end

//Faz a contagem para estabilizar o sinal
always @(posedge clk)
begin
    if (cnt < 4'd7 && count == 1)
        begin
            cnt <= cnt + 1;
        end
    
    if (cnt == 4'd3)
        begin
            out <= 1;
        end
end
endmodule

