module Arithmetic_unit (input wire clk,
                        input wire [2:0] operation,
                        input wire [31:0] op1,
                        input wire [31:0] op2,
                        output reg [63:0] result );
    
    // reg [63:0] result;
    
    always @ (posedge clk)
    begin
        case(operation)
            
            3'h0: result = op1 + op2;
            
            3'h1: result = op1 - op2;
            
            3'h2: result = op1 * op2;
            
            3'h3: result = op1 / op2;
            
            3'h4: result = op1 & op2;
            
            3'h5: result = op1 | op2;
            
            3'h6: result = ~ op1;
            
            3'h7: result = op1 ^ op2;
            
        endcase
    end
    
    
endmodule
