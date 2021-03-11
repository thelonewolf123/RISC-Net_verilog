module WriteBack (input clk,
  input wire mem_sel,
  input wire [1:0] write_mode,
  input wire [3:0] wb_reg,
  input wire [15:0] wb_mem,
  input wire [15:0] value,
  output wire rd_mem,
  output wire wr_mem,
  output wire rd_reg3,
  output wire wr_reg3,
  output wire [3:0] reg_id,
  output wire [15:0] reg_data,
  output wire [15:0] mem_data,
  );

  

endmodule // WriteBack
