`timescale 1ns/1ns

module instruction_fetch_tb;

    reg clk;
    reg [15:0] pc_in;
    reg [31:0] instruction;
    wire [31:0] read_memory;
    wire rd_mem;
    wire wn_mem;
    wire rd_reg1;
    wire wn_reg1;
    wire rd_reg2;
    wire wn_reg2;
    wire [15:0] reg_data1;
    wire [15:0] reg_data2;
    wire [15:0] address;

    wire [5:0] opcode;
    wire [1:0] mode;
    wire [15:0] op1;
    wire [15:0] op1;

    assign  wn = 1'b0;
    assign  rd = 1'b1;

    DataMemory data_memory (
    .write_data(write_data),
    .read_data(read_memory),
    .address(address),
    .mode(mem_mode),
    .wn(wn),
    .rd(rd),
    .clk(clk)
    );

    InstructionDecode instruction_decode(clk, pc_in, read_memory, address, instruction);

    // IF_ID_latch if_id_latch(clk, instruction, instruction_out);

    initial begin

        $dumpfile("vcd/instruction_fetch_tb.vcd");
        $dumpvars(0, instruction_fetch_tb);

        // Initialize Inputs

        clk  <= 1'b0;

        // Wait 100 ns for global reset to finish
        #100;

        // Add stimulus here

        pc_in <= 0;
        #20
        pc_in <= 1;
        #20
        pc_in <= 2;
        #20
        pc_in <= 3;
        #20
        pc_in <= 4;
        #20
        pc_in <= 5;
        #1000

        $finish;

    end

    always #10 clk=~clk;

endmodule
