`include "./decoder/decoder_component.v"


module decoder(

    input wire [3:0] sec_ones,
    input wire [3:0] sec_tens,
    input wire [3:0] mins,

    output wire [6:0] sec_ones_bcd,
    output wire [6:0] sec_tens_bcd,
    output wire [6:0] mins_bcd

);

    bcd_display seconds(.number(sec_ones), .number_bcd(sec_ones_bcd));
    bcd_display d_seconds(.number(sec_tens), .number_bcd(sec_tens_bcd));
    bcd_display minutes(.number(mins), .number_bcd(mins_bcd));

endmodule