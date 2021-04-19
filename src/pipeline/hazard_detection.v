module hazard_detection(input wire clk,
                        input wire [15:0] instruction_in,
                        output wire [15:0] instruction_out,
                        output wire fetch_next);
    reg [15:0] temp_instruction_out;
    reg temp_fetch_next;
    
    reg [119:0] instruction_cache;
    reg [2:0] nop_counter;
    
    wire [15:0] instruction1;
    wire [15:0] instruction2;
    wire [15:0] instruction3;
    wire [15:0] instruction4;
    wire [15:0] instruction5;
    
    assign instruction1 = instruction_cache[23:0];
    assign instruction2 = instruction_cache[47:23];
    assign instruction3 = instruction_cache[71:47];
    assign instruction4 = instruction_cache[95:71];
    assign instruction5 = instruction_cache[119:95];
    
    assign fetch_next = temp_fetch_next;
    
    always @(posedge clk) begin
        if (nop_counter == 0) begin
            
            if (dependency_detection(instruction1, instruction2)) begin
                nop_counter = 4;
                temp_fectch_next = 0;
                end else if (dependency_detection(instruction1, instruction3)) begin
                nop_counter = 3;
                temp_fectch_next = 0;
                end  else if (dependency_detection(instruction1, instruction4)) begin
                nop_counter = 2;
                temp_fectch_next = 0;
                end  else if (dependency_detection(instruction1, instruction5)) begin
                nop_counter = 1;
                temp_fectch_next = 0;
                end else begin
                    temp_fectch_next = 1;
                end
            
            temp_instruction_out = instruction_cache[23:0];
            instruction_cache    = instruction_cache << 24;
            
            end else begin
            nop_counter     = nop_counter - 1;
            temp_fetch_next = 1'b0;
        end
    end
    
    always @(negedge clk) begin
        instruction_cache[119:95] = instruction_in;
    end
    
    function wire dependency_detection(instruction_fun1, instruction_fun2);
        
        input wire [23:0] instruction_fun1;
        input wire [23:0] instruction_fun2;
        
        wire [1:0] mode1;
        wire [1:0] mode2;
        wire [3:0] reg_id1;
        wire [3:0] reg_id2;
        wire [11:0] op1;
        wire [11:0] op2;
        
        assign mode1 = instruction_fun1[17:16];
        assign mode2 = instruction_fun2[17:16];
        
        
        assign reg_id1 = instruction_fun1[15:12];
        assign reg_id2 = instruction_fun2[15:12];
        
        assign op1 = instruction_fun1[11:0];
        assign op2 = instruction_fun2[11:0];
        
        
        if (mode1 == mode2) begin
            
            case (mode1)
                2'b00: begin
                    if ((reg_id1 == reg_id2) || (reg_id1 == op2[11:8])) begin
                        return 1;
                    end
                    
                    default: begin
                        if (reg_id1 == reg_id2) begin
                            return 1;
                            end else begin
                                return 0;
                            end
                        end
                    end
            endcase
            
            end else begin
            
            if (reg_id1 == reg_id2) begin
                return 1;
                end else begin
                return 0;
            end
        end
        
    endfunction
    
endmodule
