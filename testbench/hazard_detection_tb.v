module hazard_detection_tb;
    
    reg [23:0] instruction_in;
    reg clk;
    reg [23:0] instructions[16];
    reg [3:0] pc;
    
    wire [23:0] instruction_out;
    wire fetch_next;
    
    hazard_detection UUT(.clk(clk), .instruction_in(instruction_in), .instruction_out(instruction_out), .fetch_next(fetch_next))

    initial begin
        clk = 1;
        pc = 0;
        instruction[0] <= 24'b000000_00_0100_000000000100;
        instruction[1] <= 24'b000100_01_0011_000000000110;
        instruction[2] <= 24'b000011_00_0110_000000001000;
        instruction[3] <= 24'b000100_10_0011_000000000110;
    end
    
    always @(posedge clk) begin
        if (! fetch_next) begin
            instruction_in <= instructions[pc];
            pc <= pc + 1;
        end
    end
    
    always #10 clk = !clk;
    
endmodule
