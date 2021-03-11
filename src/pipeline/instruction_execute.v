module InstructionExecute(input clk,
                     input wire [5:0] opcode,
                     input wire [15:0] op1,
                     input wire [15:0] op2,
                     input wire [3:0] wb_reg_in,
                     output wire [3:0] alu_ctl,
                     output wire [15:0] op1_out,
                     output wire [15:0] op2_out,
                     output wire [3:0] wb_reg_out);


        reg [3:0] alu_ctl_temp;

        always @ ( posedge clk ) begin
          case (opcode)
          5'b0: begin
          
          end
          endcase
        end

endmodule
