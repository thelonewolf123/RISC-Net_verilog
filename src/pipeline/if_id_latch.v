module IF_ID_latch (input wire clk,
                    input wire [23:0] instruction_in,
                    output reg [23:0] instruction_out
                    );

    reg [31:0] instruction_reg;

    always @(posedge clk) begin
        instruction_reg <= instruction_in;
    end

    always @(negedge clk) begin
        instruction_out <= instruction_reg;
    end

endmodule
