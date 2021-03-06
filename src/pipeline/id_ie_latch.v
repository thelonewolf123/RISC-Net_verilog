module ID_IE_Latch(input clk,
                    input wire [7:0] opcode_in,
                    input wire [1:0] mode_in,
                    input wire [15:0] op1_in,
                    input wire [15:0] op2_in,
                    output reg [7:0] opcode_out,
                    output reg [1:0] mode_out,
                    output reg [15:0] op1_out,
                    output reg [15:0] op2_out);

    reg [7:0] opcode_reg;
    reg [1:0] mode_reg;
    reg [15:0] op1_reg;
    reg [15:0] op2_reg;

    always @ (posedge clk) begin
      opcode_reg <= opcode_in;
      mode_reg <= mode_in;
      op1_reg <= op1_in;
      op2_reg <= op2_in;
    end

    always @ (negedge clk) begin
      opcode_out <= opcode_reg;
      mode_out <= mode_reg;
      op1_out <= op1_reg;
      op2_out <= op2_reg;
    end

endmodule
