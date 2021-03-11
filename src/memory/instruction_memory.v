module InstructionMemory(input clk,
              input rd,
              input wn,
              input [15:0] address,
              input [23:0] write_data,
              output wire [23:0] read_data);

    reg [23:0] sRAM[2047:0];
    assign read_data   = (rd == 1'b1 && wn == 1'b0) ? sRAM[address] : 32'h0;

    // initial begin
    //     sRAM[0] = 1;
    //     sRAM[1] = 2;
    //     sRAM[2] = 3;
    //     sRAM[3] = 4;
    //     sRAM[4] = 5;
    //     sRAM[5] = 6;
    //     sRAM[6] = 7;
    //     sRAM[7] = 8;
    // end

    always @ (posedge clk) begin
        if (rd == 1'b0 && wn == 1'b1) sRAM[address] <= write_data;
    end

endmodule
