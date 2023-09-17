`timescale 1ns/1ps  // Define a escala de tempo para a simulação

module tb_encoder;

  // Declare os sinais de entrada e saída para os módulos interconectados
  reg [9:0] key;
  reg enbn;
  reg clk;
  wire [3:0] D;
  wire loadn;
  wire pgt;

  // Instancie os módulos interconectados
  encoder uut (
    .key(key),
    .enbn(enbn),
    .clk(clk),
    .D(D),
    .loadn(loadn),
    .pgt(pgt)
  );

  // Clock generation
  reg clk_tb = 0;
  always begin
    #5 clk_tb = ~clk_tb;
  end

  // Estímulo de entrada
  initial begin
    $dumpfile("dump.vcd"); // Specify the dumpfile name
    $dumpvars(0, tb_encoder);
    // Inicialize os sinais de entrada com os valores desejados
    key = 10'b0000000000;
    enbn = 1'b0;
    clk = 1'b0;

    // Aplique estímulos sequenciais ou eventos aqui
    // Por exemplo:
    #10 key = 10'b1000000000; // Defina a entrada do teclado
    #16 key = 10'b0000000000;
    #21 key = 10'b0100000000;
    #26 key = 10'b0000000000;
    #31 key = 10'b0010000000;
    #36 key = 10'b0000000000;

    // Termine a simulação após algum tempo
    #100 $finish; // Encerra a simulação após 100 unidades de tempo
  end

endmodule
