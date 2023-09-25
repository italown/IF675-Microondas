module mod10_counter(
    input wire [3:0] input_number,
    input wire loadn,
    input wire clearn,
    input wire clock,
    input wire enable,
    output wire [3:0] output_number,
    output wire tc,
    output wire zero
    );


    reg[3:0] number;
    assign output_number = number;
    assign tc = ((number == 0) & enable) ? 1 : 0;
    assign zero = (number == 0) ? 1 : 0;

    always@(posedge clock or negedge clearn)
        begin
            if(enable)
                begin
                    if(number == 4'b0000)
                        begin
                            number <= 4'b1001;
                        end
                    else
                        begin
                            number <= number-1;
                        end
                end
            else
                begin
                    if(!loadn & !enable)
                        begin
                            number <= input_number;
                        end
                end

            if(!clearn & !enable)
                begin
                    number <= 4'b0000;
                end

        end
endmodule
