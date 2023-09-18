`include "./timer/mod6/mod6_counter.v"
`include "./timer/mod10/mod10_counter.v"

module timer(
    input wire [3:0] number,
    input wire loadn,
    input wire clearn,
    input wire clock,
    input wire enable,
    output wire [3:0] sec_ones,
    output wire [3:0] sec_tens,
    output wire [3:0] mins,
    output wire zero
);
    wire enable_dezena_minutos; //Fio que sai do contador de unidades de segundos e ativa o de dezenas de segundo
    wire enable_minutos; // Fio que sai do contador de dezena de segundo e ativa o de minutos
    wire tc_vazio;// Fio apenas para receber o output de tc do contador de minutos (não serve para nada)
    wire zero_1; // Zero de Unidade de Segundos
    wire zero_2; // Zero de Dezena de Segundos
    wire zero_3; // Zero de Minutos


    mod10_counter unidade_segundos(.input_number(number), .loadn(loadn), .clearn(clearn), 
                .clock(clock), .enable(enable), .output_number(sec_ones), .tc(enable_dezena_minutos), .zero(zero_1));
                
    mod6_counter dezena_segundos(.input_number(sec_ones), .loadn(loadn), .clearn(clearn), .clock(clock), 
                .enable(enable_dezena_minutos), .output_number(sec_tens), .tc(enable_minutos), .zero(zero_2));

    mod10_counter minutos(.input_number(sec_tens), .loadn(loadn), .clearn(clearn), .clock(clock), 
                .enable(enable_minutos), .output_number(mins), .tc(tc_vazio), .zero(zero_3)); 

    assign zero = (zero_1 & zero_2 & zero_3) ? 1 : 0;
endmodule


