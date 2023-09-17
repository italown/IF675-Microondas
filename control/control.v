`include "latchsr.v"

module control (
    input wire startn, stopn, clearn, door_closed, timer_done,
    output wire mag_on
);
    wire rS, rR;
    wire rQ;

    assign rS = (!startn && door_closed) ? 1'b1 : 1'b0;
    assign rR = (!stopn || timer_done || !door_closed || !clearn) ? 1'b1 : 1'b0;

    latchsr LSR_ON (.Q(rQ), .S(rS), .R(rR));

    assign mag_on = rQ;

endmodule
