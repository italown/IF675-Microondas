`include "./control/control.v"
`include "./decoder/decoder.v"
`include "./encoder/encoder.v"
`include "./timer/timer.v"

module microwave(
    input wire startn, clearn, stopn, door_closed, clock,
    input wire [9:0] keypad,    
    output wire [6:0] sec_ones_segs,
    output wire [6:0] sec_tens_segs,
    output wire [6:0] mins_segs,
    output wire mag_on

);

    wire mag_output;
    assign mag_on = mag_output;


    wire timer_loadn;
    wire timer_clk;
    wire [3:0] timer_data;
    wire timer_done;

    wire [3:0] sec_ones_input_BCD;
    wire [3:0] sec_tens_input_BCD;
    wire [3:0] min_input_BCD;

    control micro (.startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done), .mag_on(mag_output));

    encoder keyboard_input(.key(keypad), .enbn(mag_on), .clk(clock), .D(timer_data), .loadn(timer_loadn), .pgt(timer_clk));

    timer main_timer(.number(timer_data), .loadn(timer_loadn), .clearn(clearn), .clock(timer_clk), .enable(mag_on), .sec_ones(sec_ones_input_BCD), .sec_tens(sec_tens_input_BCD), .mins(min_input_BCD), .zero(timer_done));

    decoder bcd(.sec_ones(sec_ones_input_BCD), .sec_tens(sec_tens_input_BCD), .mins(min_input_BCD), .sec_ones_bcd(sec_ones_segs), .sec_tens_bcd(sec_tens_segs), .mins_bcd(mins_segs));



endmodule