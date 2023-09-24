module tb_mod100;

  // Declare signals to connect to mod100
  reg clk;
  wire clk_mod;

  // Instantiate the mod100 module
  mod100 uut (
    .clk(clk),
    .clk_mod(clk_mod)
  );


  always begin
    #1 clk = ~clk;
  end


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_mod100);
    clk=0;
    #500
    $finish;
  end
endmodule
