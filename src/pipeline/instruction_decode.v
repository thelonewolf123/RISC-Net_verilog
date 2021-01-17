module InstructionDecode(input clk,
                         input wire [31:0] instruction,
                         output reg [7:0] opcode,
                         output reg [15:0] op1,
                         output reg [15:0] op2);
    
    
    always @ (posedge clk) begin
        case(instruction[7:0])

        case (instruction[7:0])
            8'h00: begin
                
            end

            default: begin
                
            end
        endcase
    end
endmodule
