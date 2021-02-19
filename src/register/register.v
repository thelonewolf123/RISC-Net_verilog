module Register(input clk,
                input reset,
                input rd,
                input wn,
                input stack_en,
                input push_en,
                input pop_en,
                // input carry_flag_in,
                // input less_flag_in,
                // input 
                input wire [3:0] reg_id,
                input wire [15:0] write_data,
                output reg [15:0] read_data);
    
    reg [15:0] register_memory[15:0];
    
    
    always @ (posedge clk or reset) begin
        
        if (rd == 1'b1 && wn == 1'b0) begin
            read_data = register_memory[reg_id];
        end
        else if (rd == 1'b0 && wn == 1'b1)  begin
            register_memory[reg_id] = write_data;
        end
            
        if (stack_en == 1'b1 && push_en == 1'b1 && pop_en == 1'b0) begin
                register_memory[2] = register_memory[2] + 1;
        end
        else if (stack_en == 1'b1 && pop_en == 1'b1 && push_en == 1'b0) begin
                register_memory[2] = register_memory[2] - 1;
        end
    end              
endmodule
