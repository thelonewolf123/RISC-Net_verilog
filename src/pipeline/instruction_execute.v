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
          `NOP : begin


          end

          `LD  : begin


          end

          `LDH : begin


          end

          `LDL : begin


          end

          `LDPC: begin


          end

          `STR : begin


          end

          `STRH: begin


          end

          `STRL: begin


          end

          `ADD : begin


          end

          `SUB : begin


          end

          `MUL : begin


          end

          `AND : begin


          end

          `OR  : begin


          end

          `NOT : begin


          end

          `XOR : begin


          end

          `XNOR: begin


          end

          `SHR : begin


          end

          `SHL : begin


          end

          `ROR : begin


          end

          `ROL : begin


          end

          `STF : begin


          end

          `RDF : begin


          end

          `CMP : begin


          end

          `JMP : begin


          end

          `JC  : begin


          end

          `JE  : begin


          end

          `JNE : begin


          end

          `JL  : begin


          end

          `JLE : begin


          end

          `JG  : begin


          end

          `JGE : begin


          end

          endcase
        end

endmodule
