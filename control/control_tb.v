`timescale 1ns/1ps 

module tb_control;

  reg startn;
  reg stopn;
  reg clearn;
  reg door_closed;
  reg timer_done;
  wire mag_on;

  control uut (
    .startn(startn),
    .stopn(stopn),
    .clearn(clearn),
    .door_closed(door_closed),
    .timer_done(timer_done),
    .mag_on(mag_on)
  );

  reg clk = 0;
  always begin
    #5 clk = ~clk;
  end

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(0, tb_control); 

    startn = 1'b1;
    stopn = 1'b1;
    clearn = 1'b1;
    door_closed = 1'b1;
    timer_done = 1'b0;

    #10 startn = 1'b0; 
    #20 timer_done = 1'b1; 
    #30 door_closed = 1'b0; 

    #100 $finish; 
  end

  always @(posedge clk) begin
    if (mag_on == 1'b1) begin
      $display("Magnetron está ligado.");
    end else begin
      $display("Magnetron está desligado.");
    end
  end

endmodule
