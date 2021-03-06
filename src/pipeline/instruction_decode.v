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


    reg [1:0] mode_temp;
    reg [15:0] op1_temp;
    reg [15:0] op2_temp;

    // assign opcode = instruction[23:18];
    // assign mode = instruction[17:16];
    // assign op1 = instruction[15:12];
    // assign op2 = instruction[11:0];

    assign opcode = instruction[23:18];
    assign mode = mode_temp;
    assign op1 = op1_temp;
    assign op2 = op2_temp;

    always @ (posedge clk) begin

    // op1 fetch
    rd_en_reg1 = 1'b1;
    wr_en_reg1 = 1'b0;
    reg_id1 = instruction[15:12]
    op1_temp = reg_data1;

    case(instruction[17:16])

      2'b00: begin
        // op2 fetch
        rd_en_reg2 = 1'b1;
        wr_en_reg2 = 1'b0;
        reg_id2 = instruction[11:8];
        op2_temp = reg_data2;
      end

      2'b01: begin
        // op2 fetch
        rd_en_mem = 1'b1;
        wr_en_mem = 1'b0;
        mem_addr = {4'b0000, instruction[11:0]};
        op2_temp = mem_data;
      end
      2'b10: begin
        // op2 fetch
        op2_temp = {4'b0000, instruction[11:0]};
      end
    endcase
    end
endmodule
