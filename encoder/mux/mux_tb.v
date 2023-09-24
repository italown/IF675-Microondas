module testbench_mux;

    reg seletor;
    reg a;
    reg b;
    wire out;

    mux uut (
        .seletor(seletor),
        .a(a),
        .b(b),
        .out(out)
    );

    always begin
    #5 a = ~a;
    end


    always begin
    #20 b = ~b;
    end

    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0, testbench_mux);

        a=0;
        b=0;
        seletor = 1;
        #100 seletor = 0;
        #100 seletor = 1;

        #500
        $finish;
    end

endmodule
