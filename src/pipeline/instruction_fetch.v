module Instruction_fetch(input clk,
                         input [31:0] read_memory,
                         input [31:0] pc,
                         output reg [31:0] instruction);
    reg [1:2] count;
    reg [31:0] address;
    reg [31:0] write_data;
    
    reg rd,wn;
    
    
    Memory mem(.clk(clk),.rd(rd),.address(address),.read_data(read_memory),.write_data(write_data));
    
    always @ (posedge clk)
    begin
        wn = 1'b0
        rd = 1'b1
        address     = pc;
        instruction = read_data;
    end
    
endmodule
