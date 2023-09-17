module mod10_counter(
    input wire [3:0] input_number,
    input wire loadn,
    input wire clearn,
    input wire clock,
    input wire enable,
    output wire [3:0] output_number,
    output wire tc,
    output wire zero
    );


    reg[3:0] number;
    assign output_number = number;
    assign tc = ((number == 0) & enable) ? 1 : 0;
    assign zero = (number == 0) ? 1 : 0;

    always@(posedge clock)
        begin
            if(enable)
                begin
                    if(number == 4'b0000)
                        begin
                            number <= 4'b1001;
                        end
                    else
                        begin
                            number <= number-1;
                        end
                end
            else
                begin
                    if(!loadn)
                        begin
                            number <= input_number;
                        end
                 end
        end 

    always@(negedge clearn)
        begin
            if(!clearn & !enable)
                begin
                    number <= 4'b0000;
                end
        end

endmodule

//Esse código faz a contagem descrescente de 9 até 1 enquanto o sinal de enable está ativo. 
//Esse código faz com que o número de input passe para o próximo contador quando estamos com o timer completo.
//Esse código reinicia o valor do dígito quando o valor de clear (ativo em LOW) é 0. 
//Temos um contador mod10, que simplesmente passa o valor de input como output se loadn=0 e realiza contagem decrescente quando o sinal de enable=1.
//Quando a contagem chega a 0 e o enable=1, tc=1. Esse valor é passado como enable do próximo contador, e só dura por 1 pulso de clock, já que a contagem é reiniciada
//Quando chega a 0, tempos também a saída "zero", que é ligada a uma porta AND. No timer, se em todos os contadores zero=1, então a entrada timer_done do controle é ativada e o microondas para.