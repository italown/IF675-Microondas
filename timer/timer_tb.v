`timescale 1ns / 1ns

module timer_tb;

  // Define your test signals
  reg [3:0] number;
  reg loadn;
  reg clearn;
  reg clock;
  reg enable;

  wire [3:0] sec_ones;
  wire [3:0] sec_tens;
  wire [3:0] mins;
  wire zero;

  // Instantiate the timer module
  timer uut (
    .number(number),
    .loadn(loadn),
    .clearn(clearn),
    .clock(clock),
    .enable(enable),
    .sec_ones(sec_ones),
    .sec_tens(sec_tens),
    .mins(mins),
    .zero(zero)
  );

    always begin
        clock = 0;
        #5; 
        clock = 1;
        #5;
    end

  // Initialize testbench inputs
  initial begin
    $dumpfile("timer_tb.vcd");
    $dumpvars(0, timer_tb);

    enable=0;
    clearn=1;
    loadn=1;
    number= 4'd2;
    #10 loadn=0;
    #10 loadn=1;
    #10 number= 4'd1;
    #10 loadn=0;
    #10 loadn=1;
    #10 number= 4'd9;
    #10 loadn=0;
    #10 loadn=1;

    #10 enable=1;

    #700
    #10 enable=0;
    #300
    #10 enable=1;
    #500

    #10 enable=0;
    #10 clearn=0;
    #10 clearn=1;
    #100;

    #10 number= 4'd2;
    #10 loadn=0;
    #10 loadn=1;
    #10 number= 4'd7;
    #10 loadn=0;
    #10 loadn=1;

    #10 enable=1;

    #500

    $display("U_Seg\tD_Seg\tMin\t");
    $monitor("%d\t%d\t%d\t", sec_ones, sec_tens, mins);

    $finish;
  end

endmodule