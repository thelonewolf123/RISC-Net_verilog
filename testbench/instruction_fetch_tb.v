`timescale 1ns/1ns

module instruction_fetch_tb;

    // Inputs
    reg [31:0] dataIn;
    reg [15:0] address;
    reg wn;
    reg rd;
    reg clk;
    reg reset;
    reg cs;
    
    // Outputs
    
    wire [31:0] dataOut;
    
    reg rdi;
    reg wni;
    reg [3:0] reg_id;
    reg [15:0] write_data_reg;
    wire [15:0] read_data_reg;
    
    
    wire [31:0] instruction;
    
    wire i_rd;
    wire i_wn;
    wire [15:0] i_address;
    wire [3:0] i_reg_id;
    wire i_rdi;
    wire i_wni;
    wire [15:0] i_write_data_reg;
    wire [31:0] i_instruction;
    
    assign i_rd = rd;
    assign i_wn = wn;
    
    InstructionMemory memory (
    .write_data(dataIn),
    .read_data(dataOut),
    .address(address),
    .wn(wn),
    .rd(rd),
    .clk(clk)
    );
    
    Register register(.clk(clk),
    .reset(reset),
    .rd(rdi),
    .wn(wni),
    .reg_id(reg_id),
    .write_data(write_data_reg),
    .read_data(read_data_reg));
    
    InstructionFetch instruction_fetch(.clk(clk),
    .cs(cs),
    .read_memory(dataOut),
    .read_data_reg(read_data_reg),
    .rd(i_rd),
    .wn(i_wn),
    .address(i_address),
    .reg_id(i_reg_id),
    .rdi(i_rdi),
    .wni(i_wni),
    .write_data_reg(i_write_data_reg),
    .instruction(instruction));

    assign i_address        = address;
    assign i_reg_id         = reg_id;
    assign i_rdi            = rdi;
    assign i_wni            = wni;
    assign i_write_data_reg = write_data_reg;


    initial begin
        $dumpfile("vcd/instruction_fetch_tb.vcd");

        $dumpvars(0,memory);
        $dumpvars(0,register);
        $dumpvars(0,instruction_fetch);

        // initialize input

                // Initialize Inputs
        dataIn  <= 32'h0;
        address  <= 16'h0;
        reset  <= 1'b0;
        wn  <= 1'b0;
        rd  <= 1'b0;
        clk  <= 1'b0;
        cs <= 1'b0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here

        dataIn  <= 32'h0;
        address  <= 16'h0;
        wn  <= 1'b1;
        rd  <= 1'b0;

        #20;

        dataIn  <= 32'h0;
        address  <= 16'h0;
        #20;

        dataIn  <= 32'h1;
        address  <= 16'h1;
        #20;

        dataIn  <= 32'h10;
        address  <= 16'h2;
        #20;

        dataIn  <= 32'h6;
        address  <= 16'h3;
        #20;
        reset = ~ reset;
        #30;
        reset = ~ reset;

        #5000;

        $finish;


    end
    
    always #10 clk=~clk;

endmodule