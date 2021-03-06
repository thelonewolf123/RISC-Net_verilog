module DataMemory(input clk,
              input rd,
              input wn,
              input wire [15:0] address,
              input wire mode,
              input wire [15:0] write_data,
              output wire [15:0] read_data);

    reg [7:0] sRAM[2047:0];

    assign read_data = (rd == 1'b1 && wn == 1'b0) ? {sRAM[address], sRAM[address + 1]}: 16'b0;

    // always @ (posedge clk) begin
    //     if (rd == 1'b1 && wn == 1'b0) begin
    //         if (mode == 1'b0) begin
    //             read_data <= {sRAM[address],sRAM[address+1]};
    //         end
    //         else if (mode == 1'b1) begin
    //             read_data <= {sRAM[address]};
    //         end
    //     end
    // end

    always @ (negedge clk) begin
        if (rd == 1'b0 && wn == 1'b1) begin
            if (mode == 1'b0) begin
                {sRAM[address], sRAM[address+1]} <= write_data;
            end
            else if (mode == 1'b1) begin
                sRAM[address] <= write_data[7:0];
            end
        end
    end

endmodule
