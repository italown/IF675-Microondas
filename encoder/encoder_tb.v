`timescale 1ns/1ps  
module encoder_tb;

  reg [9:0] key;
  reg enbn;
  reg clk;
  wire [3:0] D;
  wire loadn;
  wire pgt;

  encoder uut (
    .key(key),
    .enbn(enbn),
    .clk(clk),
    .D(D),
    .loadn(loadn),
    .pgt(pgt)
  );


  always begin
    #1 clk = ~clk;
  end


  initial begin
    $dumpfile("encoder_tb.vcd"); 
    $dumpvars(0, encoder_tb);
    key= 10'b0000000000;
    clk=0;
    enbn=0;

   //Inserindo número 9
    #20 key= 10'b1000000000;
    #10 key= 10'b0000000000;

    #20
    //Inserindo número 8
    #20 key= 10'b0100000000;
    #10 key= 10'b0000000000;

    #20
    //Inserindo número 1
    #20 key= 10'b0000000010;
    #10 key= 10'b0000000000;

    #20 enbn=1;

    #5000 $finish; // Encerra a simulação após 100 unidades de tempo
  end

endmodule
