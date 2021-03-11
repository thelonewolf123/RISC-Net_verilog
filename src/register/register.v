module Register(input wire clk,
                input wire reset,
                input wire rd1,
                input wire wn1,
                input wire rd2,
                input wire wn2,
                input wire rd3,
                input wire wn3,
                input wire [1:0] write_mode,
                input wire [3:0] reg_id1,
                input wire [3:0] reg_id2,
                input wire [3:0] reg_id3,
                input wire [15:0] write_data3,
                output wire [15:0] read_data1,
                output wire [15:0] read_data2);

    reg [15:0] register_memory[7:0];

    assign read_data1 = (rd1 == 1'b1 && wn1 == 1'b0)? register_memory[reg_id1] : 16'h0;
    assign read_data2 = (rd2 == 1'b1 && wn2 == 1'b0)? register_memory[reg_id2] : 16'h0;

    // integer i;
    //
    // initial begin
    //   for(i=0; i< 16; i++) begin
    //     register_memory[i] = i+5;
    //   end
    // end

    always @ (posedge clk) begin
        if (rd3 == 1'b0 && wn3 == 1'b1)  begin
            case (write_mode)
              2'b00: register_memory[reg_id3]       = write_data3;
              2'b01: register_memory[reg_id3][7:0]  = write_data[7:0];
              2'b10: register_memory[reg_id3][15:8] = write_data[7:0];
            endcase
        end
    end

endmodule
