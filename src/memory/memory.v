module Memory(input clk,
              input rd,
              input wn,
              input wire [31:0] address,
              input wire [31:0] write_data,
              output reg [31:0] read_data);
    
    reg [31:0] sRAM[2047:0];
    
    always @ (posedge clk) begin
        if (rd == 1'b1 && wn == 1'b0) read_data      = sRAM[address];
        else if (rd == 1'b0 && wn == 1'b1) sRAM[address] = write_data;
    end
    
endmodule
