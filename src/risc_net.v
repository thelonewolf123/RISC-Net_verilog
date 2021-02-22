module RISC_Net(input wire clk,
                input wire reset);


    wire cs;
    wire [15:0] pc_in;
    wire [31:0] read_memory;
    reg rd;
    reg wn;
    reg [15:0] address;
    reg [31:0] instruction;    

endmodule
