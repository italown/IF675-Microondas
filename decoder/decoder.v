module decoder(
    input wire [3:0] sec_ones,
    input wire [3:0] sec_tens,
    input wire [3:0] mins,
    output wire [6:0] sec_ones_bcd,
    output wire [6:0] sec_tens_bcd,
    output wire [6:0] mins_bcd
);

    assign sec_ones_bcd = 
            (sec_ones == 4'b0000) ? 7'b1000000 :  // 0
            (sec_ones == 4'b0001) ? 7'b1111001 :  // 1
            (sec_ones == 4'b0010) ? 7'b0100100 :  // 2
            (sec_ones == 4'b0011) ? 7'b0110000 :  // 3
            (sec_ones == 4'b0100) ? 7'b0011001 :  // 4
            (sec_ones == 4'b0101) ? 7'b0010010 :  // 5
            (sec_ones == 4'b0110) ? 7'b0000010 :  // 6
            (sec_ones == 4'b0111) ? 7'b1111000 :  // 7
            (sec_ones == 4'b1000) ? 7'b0000000 :  // 8
            (sec_ones == 4'b1001) ? 7'b0011000 :  // 9
            7'b1111111;  // Default: All segments off


    assign sec_tens_bcd = 
            (sec_tens_bcd == 4'b0000) ? 7'b1000000 :  // 0
            (sec_tens_bcd == 4'b0001) ? 7'b1111001 :  // 1
            (sec_tens_bcd == 4'b0010) ? 7'b0100100 :  // 2
            (sec_tens_bcd == 4'b0011) ? 7'b0110000 :  // 3
            (sec_tens_bcd == 4'b0100) ? 7'b0011001 :  // 4
            (sec_tens_bcd == 4'b0101) ? 7'b0010010 :  // 5
            (sec_tens_bcd == 4'b0110) ? 7'b0000010 :  // 6
            (sec_tens_bcd == 4'b0111) ? 7'b1111000 :  // 7
            (sec_tens_bcd == 4'b1000) ? 7'b0000000 :  // 8
            (sec_tens_bcd == 4'b1001) ? 7'b0011000 :  // 9
            7'b1111111;  // Default: All segments off

    assign mins_bcd = 
            (mins_bcd == 4'b0000) ? 7'b1000000 :  // 0
            (mins_bcd == 4'b0001) ? 7'b1111001 :  // 1
            (mins_bcd == 4'b0010) ? 7'b0100100 :  // 2
            (mins_bcd == 4'b0011) ? 7'b0110000 :  // 3
            (mins_bcd == 4'b0100) ? 7'b0011001 :  // 4
            (mins_bcd == 4'b0101) ? 7'b0010010 :  // 5
            (mins_bcd == 4'b0110) ? 7'b0000010 :  // 6
            (mins_bcd == 4'b0111) ? 7'b1111000 :  // 7
            (mins_bcd == 4'b1000) ? 7'b0000000 :  // 8
            (mins_bcd == 4'b1001) ? 7'b0011000 :  // 9
            7'b1111111;  // Default: All segments off

endmodule


