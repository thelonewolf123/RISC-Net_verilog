module InstructionFetch(input wire clk,
                        input wire [31:0] read_memory,
                        input wire [15:0] read_data_reg,
                        output reg rd,
                        output reg wn,
                        output reg [15:0] address,
                        output reg [3:0] reg_id,
                        output reg rdi,
                        output reg wni,
                        output reg [15:0] write_data_reg,
                        output reg [31:0] instruction);
    
    
    
    
    
    always @ (posedge clk)
    begin
        
        wni     = 1'b0;
        rdi     = 1'b1;
        reg_id  = 4'b0000;

        address = read_data_reg;

        wn      = 1'b0;
        rd      = 1'b1;
        
        instruction = read_memory;
        
        wni = 1'b1;
        rdi = 1'b0;
        
        write_data_reg = read_data_reg + 1;
    end
    
endmodule
