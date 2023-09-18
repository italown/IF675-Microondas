`include "./control/control.v"
`include "./encoder/encoder.v"
`include "./decoder/decoder.v"
`include "./timer/timer.v"

module main(
    input wire startn, clearn, stopn, door_closed,
    input wire [9:0] keypad,
    input wire clock,
    output wire [6:0] sec_ones_seg, sec_tens_seg, mins_seg,
    output wire mag_on
);

wire mag_out;
assign mag_on = mag_out;

//Parte interna do microondas
wire timer_loadn;
wire timer_clk;
wire [3:0] timer_data;
wire timer_done;

wire [3:0] sec_ones;
wire [3:0] sec_tens;
wire [3:0] min;

encoder encod(.key(keypad), .enbn(mag_out), .clk(clock), 
                .D(timer_data), .loadn(timer_loadn), .pgt(timer_clk));

timer cnt(.number(timer_data), .loadn(timer_loadn), .clearn(clearn), .clock(clock), 
                .enable(mag_on), .sec_ones(sec_ones), .sec_tens(sec_tens), .mins(min), .zero(timer_done));

decoder bcd_display(.sec_ones(sec_ones), .sec_tens(sec_tens), .mins(min), 
                        .sec_ones_bcd(sec_ones_seg), .sec_tens_bcd(sec_ones_seg), .mins_bcd(mins_seg));

control control_main(.startn(startn), .stopn(stopn), .door_closed(door_closed), .timer_done(timer_done), .mag_on(mag_out));

endmodule