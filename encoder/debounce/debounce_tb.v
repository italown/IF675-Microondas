`timescale 1ns/1ns // Defina a escala de tempo adequada para a simulação

module test_debounce;

    // Declare os sinais de controle da sua bancada de testes
    reg clear;
    reg clk;
    wire out;

    // Instancie o módulo debounce
    debounce uut (
        .clear(clear),
        .clk(clk),
        .out(out)
    );

    always begin
        clk = 0;
        #10; // 5ns clock period
        clk = 1;
        #10;
    end

    // Caso de teste 1: Transição de clear de nível alto para nível baixo
    initial begin
        $dumpfile("test_debounce.vcd"); // Nome do arquivo de despejo
        $dumpvars(0, test_debounce); // Inicializa o despejo de variáveis

        $display("Teste 1: Transição de clear de nível alto para nível baixo");
        $display("Clear\tClock\tOut");
        $monitor("%b\t%b\t%b\t", clear, clk, out);
        clear = 1; // Clear inicialmente em nível alto
        #200 clear = 0; 
        #200 clear = 1;
        #300
        #200 clear = 0; 
        #200 clear = 1;
        #500
        #200 clear = 0; 
        #200 clear = 1;

        #10000 $finish; // Encerrar a simulação
    end

    // Caso de teste 2: Transição de clear de nível baixo para nível alto com clk variável

endmodule