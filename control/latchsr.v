module latchsr (
    output wire Q,
    input wire R, S 
);
    reg rQ = 1'b0; // Inicialização explicita

    always @(S or R) begin
        if (S && R)
            rQ = rQ; // Mantém o valor atual de rQ
        else if (!S && R)
            rQ = 1'b0;
        else if (S && !R)
            rQ = 1'b1;
    end

    assign Q = rQ; 
endmodule
