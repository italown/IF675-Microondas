`timescale 1ns / 1ns 

module mod10_counter_tb;

    // Inputs
    reg [3:0] input_number;
    reg loadn;
    reg clearn;
    reg clock;
    reg enable;

    // Outputs
    wire [3:0] output_number;
    wire tc;
    wire zero;

    // Instantiate the module
    mod10_counter uut (
        .input_number(input_number),
        .loadn(loadn),
        .clearn(clearn),
        .clock(clock),
        .enable(enable),
        .output_number(output_number),
        .tc(tc),
        .zero(zero)
    );


    always begin
        clock = 0;
        #5; 
        clock = 1;
        #5;
    end


    initial begin
        $dumpfile("mod10_counter_tb.vcd");
        $dumpvars(0, mod10_counter_tb);

        //Com o enable desligado, estamos no modo de adicionar números
        enable=0;
        clearn=1;
        loadn=1;
        input_number= 4'b0101;
        //Colocamos o número de input e mudamos loadn para 0 para carregar ele no contador
        #10 loadn=0;
        #10 loadn=1;
        //Mudamos o loadn para 1 e enable para 1 para começar a contagem.
        #10 enable=1;

        //Para zerarmos, temos que parar a contagem (enable=0) e ativar clear (clear=0). Não se esquecer de mudar para 1 de novo, simulando um botão
        #70 enable=0;
        #10 clearn=0;

        #10 enable=1;
        #10 clearn=1;

        #30 enable=0;
        #10 clearn=0;

        #10 enable=1;
        #100

        $display("Input\tLoad\tClear\tEnable\tOutput\tTC\tZero");
        $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b", input_number, loadn, clearn, enable, output_number, tc, zero);
           
        $finish;
    end

endmodule
