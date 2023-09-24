module bcd_display(
    input wire [3:0] number,
    output wire [6:0] number_bcd
);

    assign number_bcd = 
            (number == 4'b0000) ? 7'b1000000 :  // 0
            (number == 4'b0001) ? 7'b1111001 :  // 1
            (number == 4'b0010) ? 7'b0100100 :  // 2
            (number == 4'b0011) ? 7'b0110000 :  // 3
            (number == 4'b0100) ? 7'b0011001 :  // 4
            (number == 4'b0101) ? 7'b0010010 :  // 5
            (number == 4'b0110) ? 7'b0000010 :  // 6
            (number == 4'b0111) ? 7'b1111000 :  // 7
            (number == 4'b1000) ? 7'b0000000 :  // 8
            (number == 4'b1001) ? 7'b0011000 :  // 9
            7'b1111111;  // Default: All segments off

endmodule


