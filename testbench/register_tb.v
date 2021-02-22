`timescale 1ns / 1ns

module register_tb;
    reg clk;
    reg reset;
    reg rd;
    reg wn;
    reg stack_en;
    reg push_en;
    reg pop_en;
    reg [3:0] reg_id;
    reg [15:0] write_data;
    wire [15:0] read_data;

    Register UUT(clk,
                reset,
                rd,
                wn,
                stack_en,
                push_en,
                pop_en,
                reg_id,
                write_data,
                read_data);

initial begin
    $dumpfile("vcd/register.vcd");
    $dumpvars(0,UUT);
    clk        = 0;
    rd         = 0;
    wn         = 1;
    reg_id     = 2;
    write_data = 15;
    stack_en   = 0;
    #10
    stack_en = 1;
    pop_en   = 0;
    push_en  = 1;
    rd       = 1;
    wn       = 0;
    
    #10
    stack_en = 1;
    pop_en   = 1;
    push_en  = 0;
    
    #10
    stack_en = 0;
    rd       = 1;
    wn       = 0;
    #100
    $finish;
end

always #10 clk <= ~clk;
endmodule
