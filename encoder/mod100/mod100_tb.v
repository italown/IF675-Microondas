module tb_mod100;

  // Declare signals to connect to mod100
  reg clk;
  wire clk_mod;

  // Instantiate the mod100 module
  mod100 uut (
    .clk(clk),
    .clk_mod(clk_mod)
  );

  // Clock generation
  reg clk_tb = 0;
  always begin
    #5 clk_tb = ~clk_tb;
  end

  // Dumpfile declaration
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_mod100);
    #0 $display("Start of simulation");
  end

  // Stimulus generation
  always begin
    clk = clk_tb;
    #10; // Wait for a while
  end

  // Termination
  initial begin
    #200; // Simulate for some time
    $finish;
  end

endmodule
