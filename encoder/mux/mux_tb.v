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

    // Defina os parâmetros de entrada
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_mux);

        // Caso de teste 1: Seletor 0, 'a' selecionado
        seletor = 0;
        a = 1;
        b = 0;
        #5; // Aguarde um ciclo de clock
        if (out == a) begin
            $display("Teste 1: Seletor 0, 'a' selecionado - Passou");
        end else begin
            $display("Teste 1: Seletor 0, 'a' selecionado - Falhou");
        end

        // Caso de teste 2: Seletor 1, 'b' selecionado
        seletor = 1;
        a = 1;
        b = 0;
        #5; 
        if (out == b) begin
            $display("Teste 2: Seletor 1, 'b' selecionado - Passou");
        end else begin
            $display("Teste 2: Seletor 1, 'b' selecionado - Falhou");
        end

        $dumpoff;
        
        // Terminar a simulação
        $finish;
    end

endmodule
