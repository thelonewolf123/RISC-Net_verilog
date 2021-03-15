module InstructionExecute(input clk,
                     input wire [5:0] opcode,
                     input wire [15:0] op1,
                     input wire [15:0] op2,
                     input wire [3:0] wb_reg_in,
                     input wire [15:0] pc_in,
                     input wire [3:0] flags,

                     output wire jump_ctl,
                     output wire [3:0] alu_ctl,
                     output wire [15:0] op1_out,
                     output wire [15:0] op2_out,
                     output wire [3:0] wb_reg_out,
                     output wire [15:0] jump_pc,
                     output wire [2:0] wb_mode);


        reg [3:0] alu_ctl_temp;
        reg [15:0] op1_out_temp;
        reg [15:0] op2_out_temp;

        reg [3:0]  wb_reg_out_temp;
        reg [2:0] wb_mode_temp;

        reg jump_ctl_temp;
        reg [15:0] jump_pc_temp;

        assign alu_ctl = alu_ctl_temp;
        assign op1_out = op1_out_temp;
        assign op2_out = op2_out_temp;

        assign wb_reg_out = wb_reg_out_temp;
        assign wb_mode = wb_mode_temp;

        assign jump_ctl = jump_ctl_temp;
        assign jump_pc = jump_pc_temp;


        always @ ( posedge clk ) begin
          case (opcode)
          `NOP : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= 16'h0;
          op2_out_temp <= 16'h0;
          wb_reg_out_temp <= 16'h0;
          wb_mode_temp <= `WB_NOP;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;
          end

          `LD  : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op2;
          op2_out_temp <= 16'h0;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `LDH : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op2[15:8];
          op2_out_temp <= 16'h0;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REGH;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `LDL : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op2[7:0];
          op2_out_temp <= 16'h0;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REGL;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `LDPC: begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= pc_in;
          op2_out_temp <= 16'h0;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `STR : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'b0;
          wb_mode_temp <= `WB_MEM;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `STRH: begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op1[15:8];
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'b0;
          wb_mode_temp <= `WB_MEMH;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `STRL: begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op1[7:0];
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_MEML;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `ADD : begin

          alu_ctl_temp <= `ALU_ADD;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `SUB : begin

          alu_ctl_temp <= `ALU_SUB;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `MUL : begin

          alu_ctl_temp <= `ALU_MUL;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'h0;
          wb_mode_temp <= `WB_MUL;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `AND : begin

          alu_ctl_temp <= `ALU_AND;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `OR  : begin

          alu_ctl_temp <= `ALU_OR;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `NOT : begin

          alu_ctl_temp <= `ALU_NOT;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `XOR : begin

          alu_ctl_temp <= `ALU_XOR;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `XNOR: begin

          alu_ctl_temp <= `ALU_XNOR;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `SHR : begin

          alu_ctl_temp <= `ALU_SHR;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `SHL : begin

          alu_ctl_temp <= `ALU_SHL;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `ROR : begin

          alu_ctl_temp <= `ALU_ROR;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `ROL : begin

          alu_ctl_temp <= `ALU_ROL;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `STF : begin


          end

          `RDF : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= {13'h0,flags};
          op2_out_temp <= 16'h0;
          wb_reg_out_temp <= wb_reg_in;
          wb_mode_temp <= `WB_REG;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `CMP : begin

          alu_ctl_temp <= `ALU_CMP;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'h0;
          wb_mode_temp <= `WB_NOP;
          jump_ctl_temp <= 1'h0;
          jump_pc_temp <= 16'b0;

          end

          `JMP : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'h0;
          wb_mode_temp <= `WB_NOP;
          jump_ctl_temp <= 1'h1;
          jump_pc_temp <= op1;

          end

          `JC  : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'h0;
          wb_mode_temp <= `WB_NOP;

          if (flags[2] == 1) begin
            jump_ctl_temp <= 1'h1;
            jump_pc_temp <= op1;
          end else begin
            jump_ctl_temp <= 1'h0;
            jump_pc_temp <= 16'b0;
          end

          end

          `JE  : begin
          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'h0;
          wb_mode_temp <= `WB_NOP;

          if (flags[0] == 1) begin
            jump_ctl_temp <= 1'h1;
            jump_pc_temp <= op1;
          end else begin
            jump_ctl_temp <= 1'h0;
            jump_pc_temp <= 16'b0;
          end
          end

          `JNE : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'h0;
          wb_mode_temp <= `WB_NOP;

          if (flags[0] == 0) begin
            jump_ctl_temp <= 1'h1;
            jump_pc_temp <= op1;
          end else begin
            jump_ctl_temp <= 1'h0;
            jump_pc_temp <= 16'b0;
          end

          end

          `JL  : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'h0;
          wb_mode_temp <= `WB_NOP;

          if (flags[1] == 1) begin
            jump_ctl_temp <= 1'h1;
            jump_pc_temp <= op1;
          end else begin
            jump_ctl_temp <= 1'h0;
            jump_pc_temp <= 16'b0;
          end

          end

          `JLE : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'h0;
          wb_mode_temp <= `WB_NOP;

          if (flags[1] == 1 || flags[0] == 1) begin
            jump_ctl_temp <= 1'h1;
            jump_pc_temp <= op1;
          end else begin
            jump_ctl_temp <= 1'h0;
            jump_pc_temp <= 16'b0;
          end

          end

          `JG  : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'h0;
          wb_mode_temp <= `WB_NOP;

          if (flags[1] == 0) begin
            jump_ctl_temp <= 1'h1;
            jump_pc_temp <= op1;
          end else begin
            jump_ctl_temp <= 1'h0;
            jump_pc_temp <= 16'b0;
          end

          end

          `JGE : begin

          alu_ctl_temp <= `ALU_NOP;
          op1_out_temp <= op1;
          op2_out_temp <= op2;
          wb_reg_out_temp <= 4'h0;
          wb_mode_temp <= `WB_NOP;

          if (flags[1] == 0 || flags[0] == 1) begin
            jump_ctl_temp <= 1'h1;
            jump_pc_temp <= op1;
          end else begin
            jump_ctl_temp <= 1'h0;
            jump_pc_temp <= 16'b0;
          end

          end

          endcase
        end

endmodule
