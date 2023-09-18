module tb_keyboard;


  reg [9:0] keypad;
  reg enablen;
  wire [3:0] D;
  wire loadn;


  keyboard uut (
    .keypad(keypad),
    .enablen(enablen),
    .D(D),
    .loadn(loadn)
  );

  reg clk = 0;
  always begin
    #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(0, tb_keyboard);

    enablen=0;
    keypad= 10'b0000000000;

    #20 keypad= 10'b0000001000;
    #10 keypad= 10'b0000000000;
    #20 keypad= 10'b0001000000;
    #10 keypad= 10'b0000000000;
    #20 keypad= 10'b1000000000;
    #10 keypad= 10'b0000000000;

    #20 enablen=1;

    #200 $finish;
  end

endmodule
