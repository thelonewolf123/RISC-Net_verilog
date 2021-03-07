module InstructionDecode(input clk,
                         input wire [23:0] instruction,

                         input wire [15:0] reg_data1,
                         input wire [15:0] reg_data2,

                         input wire [15:0] mem_data,

                         output wire rd_en_reg1,
                         output wire wr_en_reg1,

                         output wire rd_en_reg2,
                         output wire wr_en_reg2,

                         output wire rd_en_mem,
                         output wire wr_en_mem,

                         output wire [3:0] reg_id1,
                         output wire [3:0] reg_id2,

                         output wire [15:0] mem_addr,
                         output wire [5:0] opcode,

                         output wire [1:0] mode,
                         output wire [15:0] op1,
                         output wire [15:0] op2);


    reg rd_en_reg1_temp;
    reg rd_en_reg2_temp;
    reg wr_en_reg1_temp;
    reg wr_en_reg2_temp;

    reg rd_en_mem_temp;
    reg wr_en_mem_temp;

    reg [3:0] reg_id1_temp;
    reg [3:0] reg_id2_temp;

    reg [15:0] mem_addr_temp;

    assign opcode = instruction[23:18];
    assign mode = instruction[17:16];

    assign rd_en_reg1 = rd_en_reg1_temp;
    assign rd_en_reg2 = rd_en_reg2_temp;
    assign wr_en_reg1 = wr_en_reg1_temp;
    assign wr_en_reg2 = wr_en_reg2_temp;

    assign reg_id1 = reg_id1_temp;
    assign reg_id2 = reg_id2_temp;

    assign rd_en_mem = rd_en_mem_temp;
    assign wr_en_mem = wr_en_mem_temp;

    assign mem_addr = mem_addr_temp;

    assign op1 = reg_data1;
    assign op2 = (mode == 2'b00)? reg_data2 : ((mode == 2'b01)? mem_data : ((mode == 2'b10)? {4'b0000, instruction[11:0]} : 16'b0));

    always @ (posedge clk) begin

      // op1 fetch
      rd_en_reg1_temp = 1'b1;
      wr_en_reg1_temp = 1'b0;
      reg_id1_temp = instruction[15:12];

      case(mode)

        2'b00: begin
          // op2 fetch
          rd_en_reg2_temp = 1'b1;
          wr_en_reg2_temp = 1'b0;
          reg_id2_temp = instruction[11:8];
        end

        2'b01: begin
          // op2 fetch
          rd_en_mem_temp = 1'b1;
          wr_en_mem_temp = 1'b0;
          mem_addr_temp = {4'b0000, instruction[11:0]};
        end
      endcase
    end
endmodule
