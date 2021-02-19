module ProgramCounter(PCNext, PCResult, Reset, Clk, PCWrite);

	input       [15:0]  PCNext;
	input               Reset, Clk,PCWrite;

	output reg  [15:0]  PCResult;

    /* Please fill in the implementation here... */

	initial begin
		PCResult <= 16'h0000;
	end

    always @(posedge Clk)
    begin
    	if (Reset == 1)
    	begin
    		PCResult <= 16'h0000;
    	end
    	else
    	begin
			if (PCWrite == 1) begin
				PCResult <= PCNext;
			end
    	end
		$display("PC=%h",PCResult);
    end

endmodule
