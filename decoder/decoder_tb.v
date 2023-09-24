`include "./decoder_component.v"

module decoder_tb();

    reg [3:0] sec_ones;
    reg [3:0] sec_tens;
    reg [3:0] mins;
    wire [6:0] sec_ones_bcd;
    wire [6:0] sec_tens_bcd;
    wire [6:0] mins_bcd;


    decoder uut (
        .sec_ones(sec_ones),
        .sec_tens(sec_tens),
        .mins(mins),
        .sec_ones_bcd(sec_ones_bcd),
        .sec_tens_bcd(sec_tens_bcd),
        .mins_bcd(mins_bcd)
    );

    initial begin

        $dumpfile("decoder_wave.vcd"); 
        $dumpvars(0, decoder_tb); 
        sec_ones = 4'b0010;
        sec_tens = 4'b0100; 
        mins = 4'b0101;     
        #10
        sec_ones = 4'b0110;
        sec_tens = 4'b0001;
        mins = 4'b0111;

        #10
        sec_ones = 4'b1001;
        sec_tens = 4'b1000;
        mins = 4'b0100;



        #10 $finish;
    end

endmodule
