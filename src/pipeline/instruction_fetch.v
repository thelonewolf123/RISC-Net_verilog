module InstructionFetch(input wire clk,
                        input wire [15:0] pc_in,
                        input wire [23:0] read_memory,
                        output wire [15:0] address,
                        output wire [23:0] instruction);

    assign address     = pc_in;
    assign instruction = read_memory;

endmodule
