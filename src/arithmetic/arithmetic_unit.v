module Arithmetic_unit (input wire clk,
                        input wire [2:0] operation,
                        input wire [15:0] op1,
                        input wire [15:0] op2,
                        input wire [3:0] wb_reg_in,
                        output wire [15:0] result_low,
                        output wire [15:0] result_high,
                        output wire [2:0] flag_en,
                        output wire [2:0] flag_val,
                        output wire [3:0] wb_reg_out );

    reg [15:0] result_low_temp;
    reg [15:0] result_high_temp;
    reg [2:0] flag_en_temp;
    reg [2:0] flag_val_temp;


    assign result_low  = result_low_temp;
    assign result_high = result_high_temp;
    assign flag_en  = flag_en_temp;
    assign flag_val = flag_val_temp;

    always @ (posedge clk) begin
    
        case(operation)

            4'h0: begin
                  {flag_val_temp[2],result_low_temp} = op1 + op2; // add
                  flag_en_temp[2] = 1;
            end

            4'h1: result_low_temp = op1 - op2; // subtract

            4'h2: {result_high_temp, result_low_temp} = op1 * op2; // mult

            4'h3: result_low_temp = op1 & op2; // and

            4'h4: result_low_temp = op1 | op2; // or

            4'h5: result_low_temp = ~ op1; // not

            4'h6: result_low_temp = op1 ^ op2; // xor

            4'h7: result_low_temp = op1 ~^ op2; // xnor

            4'h8: result_low_temp = op1 >> op2; // shift right

            4'h9: result_low_temp = op1 << op2; // shift left

            // 4'h10: result_low_temp = (op1 >> op2) | (op1 << ~op2); // rotate right

            4'h1a: result_low_temp = (op1 << op2) | (op1 >> ~op2); //rotate left

            4'hb: begin // compare
              result_low_temp = 16'h0;
              result_high_temp = 16'h0;
              if(op1 == op2) begin
                flag_en_temp[1:0] = 2'b01;
                flag_val_temp[1:0] = 2'b01;
              end else if(op2 < op2) begin
                flag_en_temp[1:0] = 2'b10;
                flag_val_temp[1:0] = 2'b10;
              end
              else begin
                flag_en_temp[1:0] = 2'b00;
                flag_val_temp[1:0] = 2'b00;
              end
            end

            default: begin
              result_low_temp = 0;
              result_high_temp = 0;
            end

        endcase
    end


endmodule
