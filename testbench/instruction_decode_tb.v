`timescale 1ns/1ns

module instruction_fetch_tb;

    reg clk;
    reg reset;
    reg [23:0] instruction;
    wire rd_mem;
    wire wr_mem;
    wire rd_reg1;
    wire wn_reg1;
    wire rd_reg2;
    wire wn_reg2;
    wire mode_mem;
    wire [3:0] reg_id1;
    wire [3:0] reg_id2;
    wire [15:0] reg_data1;
    wire [15:0] reg_data2;
    wire [15:0] write_data1;
    wire [15:0] write_data2;
    wire [15:0] write_data_mem;
    wire [15:0] mem_data;
    wire [15:0] address;

    wire [5:0] opcode;
    wire [1:0] mode;
    wire [15:0] op1;
    wire [15:0] op2;

    assign  wn = 1'b0;
    assign  rd = 1'b1;

    DataMemory data_memory (clk, rd_mem, wr_mem, address, mode_mem, write_data_mem, mem_data);

    Register register(clk, reset, rd_reg1, wn_reg1, rd_reg2, wn_reg2, reg_id1, reg_id2, write_data1, write_data2, reg_data1, reg_data2);

    InstructionDecode instruction_decode(clk, instruction, reg_data1, reg_data2, mem_data, rd_reg1, wn_reg1, rd_reg2, wn_reg2, rd_mem, wr_mem, reg_id1, reg_id2, address, opcode, mode, op1, op2);

    // IF_ID_latch if_id_latch(clk, instruction, instruction_out);

    initial begin

        $dumpfile("vcd/instruction_decode_tb.vcd");
        $dumpvars(0, instruction_fetch_tb);

        // Initialize Inputs

        clk  <= 1'b0;

        // Wait 100 ns for global reset to finish
        #100;

        // Add stimulus here

        instruction <= 24'b00000000011000000000100;
        #20
        instruction <= 24'b000100010011000000000110;
        #20
        instruction <= 24'b00001100011000000000100;
        #20
        instruction <= 24'b000100010011000000000110;
        #20
        instruction <= 24'b11000000011000000000100;
        #20
        instruction <= 24'b000110010011000000000110;
        #20
        // instruction <= 2;
        // #20
        // instruction <= 3;
        // #20
        // instruction <= 4;
        // #20
        // instruction <= 5;
        #1000

        $finish;

    end

    always #10 clk=~clk;

endmodule
