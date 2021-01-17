module Instruction_fetch(input clk,
                         input [31:0] read_memory,
                         input [31:0] pc,
                         output reg [31:0] instruction);
    reg [1:2] count;
    reg [31:0] address;
    reg [31:0] write_data;
    
    reg rd,wn;

    reg rdi,
    reg wni,
    reg  [3:0] reg_id;
    reg  [31:0] write_data_reg;
    wire [31:0] read_data_reg;
    
    
    InstructionM memory(.clk(clk),.rd(rd),.address(address),.read_data(read_memory),.write_data(write_data));

    Register register(.clk(clk),.rd(rdi),.address(reg_id),.read_data(read_data_reg),.write_data(write_data_reg));
    
    always @ (posedge clk)
    begin
        wn <= 1'b0;
        rd <= 1'b1;
        wni <= 1'b0;
        rdi <= 1'b1;
        reg_id <= 4'b0000;
        address     <= read_data_reg;
        instruction <= read_data;
    end
    
endmodule
