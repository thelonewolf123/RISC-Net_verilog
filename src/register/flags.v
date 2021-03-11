module Flags (input wire clk,
              input wire [2:0] flag_sel,
              input wire [2:0] flag_val,
              output wire [2:0] flag_out);

      reg carry_flag;
      reg lessthan_flag;
      reg zero_flag;

      assign flag_out = {carry_flag,lessthan_flag,zero_flag};

      always @ ( posedge clk ) begin
        if(flag_sel[2] == 1'b1) carry_flag = flag_val[2];
        if(flag_sel[1] == 1'b1) lessthan_flag = flag_val[1];
        if(flag_sel[0] == 1'b1) zero_flag = flag_val[0];
      end

endmodule // Flags
