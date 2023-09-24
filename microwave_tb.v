`timescale 1ns / 1ps 
module microwave_tb;

    reg startn, clearn, stopn, door_closed, clock;
    reg [9:0] keypad;
    wire [6:0] sec_ones_segs, sec_tens_segs, mins_segs;
    wire mag_on;

    microwave uut (
        .startn(startn),
        .clearn(clearn),
        .stopn(stopn),
        .door_closed(door_closed),
        .clock(clock),
        .keypad(keypad),
        .sec_ones_segs(sec_ones_segs),
        .sec_tens_segs(sec_tens_segs),
        .mins_segs(mins_segs),
        .mag_on(mag_on)
    );


    always begin
        #1 clock = ~clock;
    end

    initial begin
        $dumpfile("microwave_tb.vcd"); 
        $dumpvars(0, microwave_tb); 
        clock=0;
        startn=1;
        clearn=1;
        stopn=1;
        door_closed=1;
        keypad= 10'b0000000000;

        //1
        #100 keypad = 10'b0000000010;
        #100 keypad = 10'b0000000000;
        
        #100 keypad = 10'b0000000010;
        #100 keypad = 10'b0000000000;

        #100 keypad = 10'b0000000001;
        #100 keypad = 10'b0000000000;

        #100 startn=0;
        #500 startn=1;
        #10 stopn = 0;
        #10 clearn = 0;

        #800;




        $finish; 
    end

    // Display outputs (optional)
    always @(sec_ones_segs, sec_tens_segs, mins_segs, mag_on) begin
        // Display or log the output values for debugging (optional)
        $display("sec_ones_segs = %h, sec_tens_segs = %h, mins_segs = %h, mag_on = %b", 
                 sec_ones_segs, sec_tens_segs, mins_segs, mag_on);
    end

endmodule
