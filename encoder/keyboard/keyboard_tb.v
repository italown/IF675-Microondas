module tb_keyboard;

  // Declare signals to connect to keyboard module
  reg [9:0] keypad;
  reg enablen;
  wire [3:0] D;
  wire loadn;

  // Instantiate the keyboard module
  keyboard uut (
    .keypad(keypad),
    .enablen(enablen),
    .D(D),
    .loadn(loadn)
  );

  // Clock generation (for example, using a 10 MHz clock)
  reg clk = 0;
  always begin
    #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    $dumpfile("dump.vcd"); // Specify the dumpfile name
    $dumpvars(0, tb_keyboard);

    // Initialize inputs
    keypad = 10'b0000000000; // Set keypad input to a specific value
    enablen = 1'b0; // Disable initially

    #10 keypad = 10'b1000000000;
    #110 keypad = 10'b0000000100;
    // Enable the module after some time
    #100 enablen = 1'b1;

    // Provide more stimulus if needed

    // Finish simulation after some time
    #200 $finish;
  end

endmodule
