`timescale 1ns / 1ns

module memory_tb;


 // Inputs
 reg [31:0] dataIn;
 reg [15:0] Addr;
 reg CS;
 reg WE;
 reg RD;
 reg Clk;
 // Outputs

 wire [31:0] dataOut;
 // Instantiate the Unit Under Test (UUT)

 InstructionMemory uut (
  .write_data(dataIn), 
  .read_data(dataOut), 
  .address(Addr), 
  .wn(WE), 
  .rd(RD), 
  .clk(Clk)
  );


 initial begin

     $dumpfile("vcd/memory.vcd");
     $dumpvars(0,uut);

  // Initialize Inputs
  dataIn  <= 32'h0;
  Addr  <= 16'h0;
  CS  <= 1'b0;
  WE  <= 1'b0;
  RD  <= 1'b0;
  Clk  <= 1'b0;

  // Wait 100 ns for global reset to finish
  #100;
 
  // Add stimulus here

  dataIn  <= 32'h0;
  Addr  <= 16'h0;
  CS  <= 1'b1;
  WE  <= 1'b1;
  RD  <= 1'b0;

  #20;

  dataIn  <= 32'h0;
  Addr  <= 16'h0;
  #20;

  dataIn  <= 32'h1;
  Addr  <= 16'h1;
  #20;

  dataIn  <= 32'h10;
  Addr  <= 16'h2;
  #20;

  dataIn  <= 32'h6;
  Addr  <= 16'h3;
  #20;

  dataIn  <= 32'h12;
  Addr  <= 16'h4;
  #40;

  Addr  <= 16'h0;
  WE  <= 1'b0;
  RD  <= 1'b1;
  #20;

  Addr   <= 16'h1;
  #20;

  Addr   <= 16'h2;
  #20;

  Addr   <= 16'h3;
  #20;

  Addr   <= 16'h4;
  
 end
 always #10 Clk <= ~Clk;
endmodule