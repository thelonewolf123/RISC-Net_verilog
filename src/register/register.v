module Register(input clk,
                input rd,
                input wn,
                input wire [3:0] reg_id,
                input wire [31:0] write_data,
                output reg [31:0] read_data);
    
    reg [31:0] register_memory[16:0];
    
    always @ (posedge clk) begin
        if (rd == 1'b1 && wn == 1'b0) read_data      = register_memory[reg_id];
        else if (rd == 1'b0 && wn == 1'b1) register_memory[reg_id] = write_data;
    end
    
endmodule
