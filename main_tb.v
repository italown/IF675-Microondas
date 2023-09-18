`timescale 1us/1ps
module microwave_tb();

    reg [9:0] key;
    reg clk, door_closed, stopn, clearn, startn;

    wire [6:0] sec_ones_seg, sec_tens_seg, mins_seg;
    wire mag_on;

    main DUT(.startn(startn), .clearn(clearn), .stopn(stopn), .door_closed(door_closed),
            .keypad(key), .clock(clk), .sec_ones_seg(sec_ones_seg),
            .sec_tens_seg(sec_tens_seg), .mins_seg(mins_seg), .mag_on(mag_on)); 
    //microwave DUT(.startn(startn), .clearn(.clearn), .stopn(stopn), .door_closed(.door_closed), .keypad(key), .clock(clk), .sec_ones_seg(sec_ones_seg), .sec_tens_seg(sec_tens_seg), .mins_seg(mins_seg));
    integer i;


    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;

        clk = 1;

        for(i = 0; i < 700005; i++) begin
            #5000 clk <= ~clk;
        end
    end

    /*
        (Quando vamos tentar ligar com a porta aberta)
        Teste 1:
        - O microondas estará com tudo zerado.
        - A porta estará aberta
        - O usuário entrará o número 3:59
        - O usuário tentará começar o microondas
        - O microondas não ligará
        - O usuário irá fechar a porta
        - O usuário vai clicar em start
        - O microondas vai funcionar normalmente até o tempo acabar
        
        (Quando a porta for aberta como microondas ligado)
        Teste 2:
        - O microondas estará com tudo zerado.
        - A porta estará fechada
        - O usuário entrará o número 2:45
        - Depois de 30 segundos a porta será aberta
        - O timer irá parar
        - A porta será fechada
        - Será clicado em start para retomar o timer
        - O microondas vai funcionar normalmente até o tempo acabar

        (Quando for apertado em "parar" como microondas ligado)
        Teste 3:
        - O microondas estará com tudo zerado.
        - A porta estará fechada
        - O usuário entrará o número 4:45
        - Depois de 30 segundos o botão de parar será pressionado
        - O microondas será desligado
        - Vai ser clicado em start
        - O microondas vai ser ligado
        - O microondas vai funcionar normalmente até o tempo acabar
    
        Teste 4:
        - O microondas estará com tudo zerado.
        - A porta estará fechada
        - O usuário entrará o número 2:35
        - Depois de 30 segundos o botão de limpar será pressionado
        - O timer será zerado
        - O microondas será desligado

        Teste 5:
        - O microondas estará com tudo zerado.
        - A porta estará fechada
        - O usuário entrará o número 1:79
        - O microondas será ligado e irá até 0
    */

    initial begin
        // Teste 1

        key = 9'b000000000;
        door_closed = 0;
        stopn = 1;
        clearn = 1;
        startn = 1;

        // Digitando o 3
        #120000;
        key = 9'b000001000;
        #110000;
        key = 9'b000000000;

        // Digitando o 5
        #110000;
        key = 9'b000100000;
        #110000;
        key = 9'b000000000;

        // Digitando o 9
        #110000;
        key = 10'b1000000000;
        #110000;
        key = 9'b000000000;

        // Tentando abrir
        #110000;
        startn = 0;
        #110000;
        startn = 1;
        #510000;
        // Fechando a porta
        door_closed = 1;
        #100000;
        startn = 0;
        #100000;
        startn = 1;
        #300000000;
        

        // Teste 2
        key = 9'b000000000;
        door_closed = 1;
        stopn = 1;
        clearn = 1;
        startn = 1;

        // Digitando o 2
        #120000;
        key = 9'b000000100;
        #110000;
        key = 9'b000000000;

        // Digitando o 4
        #110000;
        key = 9'b000010000;
        #110000;
        key = 9'b000000000;

        // Digitando o 5
        #110000;
        key = 10'b0000100000;
        #110000;
        key = 9'b000000000;

        #110000;
        startn = 0;
        #100000;
        startn = 1;
        #3000000;
        // Abrindo a porta
        door_closed = 0;
        #810000;
        startn = 0;
        #100000;
        startn = 1;
        #100000;
        // Fechando a porta
        door_closed = 1;
        #100000;
        startn = 0;
        #100000;
        startn = 1;
        #300000000;

        // Teste 3

        key = 9'b000000000;
        door_closed = 1;
        stopn = 1;
        clearn = 1;
        startn = 1;

        // Digitando o 2
        #120000;
        key = 9'b000000100;
        #110000;
        key = 9'b000000000;

        // Digitando o 4
        #110000;
        key = 9'b000010000;
        #110000;
        key = 9'b000000000;

        // Digitando o 5
        #110000;
        key = 10'b0000100000;
        #110000;
        key = 9'b000000000;

        #110000;
        startn = 0;
        #100000;
        startn = 1;
        #3000000;
        // CLicando em parar
        stopn = 0;
        #810000;
        startn = 1;
        #100000;
        startn = 1;
        #100000;
        // Clicando em start
        stopn = 1;
        #500000;
        startn = 0;
        #100000;
        startn = 1;
        #300000000;


        // Teste 4

        key = 9'b000000000;
        door_closed = 1;
        stopn = 1;
        clearn = 1;
        startn = 1;

        // Digitando o 2
        #120000;
        key = 9'b000000100;
        #110000;
        key = 9'b000000000;

        // Digitando o 4
        #110000;
        key = 9'b000010000;
        #110000;
        key = 9'b000000000;

        // Digitando o 5
        #110000;
        key = 10'b0000100000;
        #110000;
        key = 9'b000000000;

        #110000;
        startn = 0;
        #100000;
        startn = 1;
        #3000000;
        // CLicando em limpar
        clearn = 0;
        #810000;
        startn = 1;
        #100000;
        startn = 1;
        #100000;
        // Clicando em start
        clearn = 1;
        #500000;
        startn = 0;
        #100000;
        startn = 1;
        #500000000;

        // Teste 5
        
        key = 9'b000000000;
        door_closed = 1;
        stopn = 1;
        clearn = 1;
        startn = 1;

        // Digitando o 1
        #120000;
        key = 9'b000000010;
        #110000;
        key = 9'b000000000;

        // Digitando o 7
        #110000;
        key = 9'b010000000;
        #110000;
        key = 9'b000000000;

        // Digitando o 5
        #110000;
        key = 10'b1000000000;
        #110000;
        key = 9'b000000000;

        #110000;
        startn = 0;
        #100000;
        startn = 1;
        #3000000;

        // 1418000 ms
        // 1556000 ms
        
    end
    
endmodule