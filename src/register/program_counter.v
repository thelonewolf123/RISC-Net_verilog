module ProgramCounter (
	input wire clk,
	input wire reset,
	input wire pc_write,
	input wire [15:0] pc_in,
	output wire [15:0] pc_result
	);

	reg [15:0] program_counter;

	assign pc_result = program_counter;

	@always @ ( negedge clk ) begin
		if(pc_write) begin
			program_counter <= pc_in;
		end
	end

	@always @ ( posedge clk ) begin
		if(reset) begin
			program_counter <= 16'h0;
		end
	end
endmodule // ProgramCounter
