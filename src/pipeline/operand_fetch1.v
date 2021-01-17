module OperandFtech1(input clk,
                     input wire [7:0] opcode,
                     input wire [1:0] mode1,
                     input wire [15:0] op1,
                     input wire [1:0] mode2,
                     input wire [15:0] op2,
                     output reg [7:0] op_opcode,
                     output reg [15:0] op_op1,
                     output reg [1:0] op_mode2,
                     output reg [15:0] op_op2);
    
    always @(posedge clk ) begin
        case (mode1)
            2'b00: begin
                
            end 
            default: begin
                
            end
        endcase
    end
    
endmodule

