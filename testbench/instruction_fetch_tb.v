`timescale 1ns/1ns

module instruction_fetch_tb;
    reg clk;
    reg cs;
    reg [15:0] pc_in;
    wire [31:0] read_memory;
    wire rd;
    wire wn;
    wire [15:0] address;
    wire [31:0] instruction; 

    reg [31:0] write_data;

    assign  wn = 1'b0;
    assign  rd = 1'b1;

    InstructionMemory instruction_memory (
    .write_data(write_data), 
    .read_data(read_memory), 
    .address(address), 
    .wn(wn), 
    .rd(rd), 
    .clk(clk)
    );

    InstructionFetch instruction_fetch(clk, pc_in, read_memory, address, instruction);

    initial begin

        $dumpfile("vcd/instruction_fetch_tb.vcd");
        $dumpvars(0, instruction_fetch_tb);

        // Initialize Inputs

        clk  <= 1'b0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here

        pc_in <= 0;
        #10
        pc_in <= 1;
        #10
        pc_in <= 2;
        #10
        pc_in <= 3;
        #10
        pc_in <= 4;
        #10
        pc_in <= 5;
        #1000

        $finish;
    
    end
    
    always #10 clk=~clk;

endmodule