# RISC_Net CPU

- It's a simple 16 bit RISC processor, purely mode for educational purpose.
- This cpu uses Harvard architecture.

## Features

- 16 bit wide address bus for both data and instruction memory.
- 32 bit wide data read and write bus for instruction memory.
- 16 bit wide data read and write bus for data memory.
- Instruction memory is 4 byte addressable.
- Byte addressable data memory, with option to read or write two bytes at a same time.
- Special Instruction to operate on floating point numbers.
- Use 6 stage pipelining to improve overall instruction per cycle count.
  
<!-- - UART and SPI communications for external device interface.
- 2 timers and 2 counters. -->
  
- 4 I/O ports with 32 digital pins.

## Blocks

- Registers
- Data Memory
- Instruction Memory
- Pipeline
  - instruction fetch
  - instruction decode
  - operand fetch 1
  - operand fetch 2
  - execute
  - writeback
- ALU
- FPU

## Instruction set Architecture

- load \[byte\] op1,op2
- store \[word\] op1,op2
- iadd op1, op2
- isub op1,op2
- imul op1,op2
- idiv op1, op2
- fadd op1,op2
- fsub op1,op2
- fmul op1,op2
- fdiv op1, op2
- and op1,op2
- or op1,op2
- not op1,op2
- xor op1,op2
- shl op1, op2
- shr op1, op2
- in op1,op2
- out op1,op2
- push op1
- pop

## Registers

- Program counter - 4'b0000
- Primary Accumulator - 4b'0001
- Secondary Accumulator - 4'b0010
- Stack pointer - 4'b0011
- Base pointer - 4'b0100
- General Purpose (A) - 4'b0101
- General Purpose (B) - 4'b0110
- General Purpose (C) - 4'b0111
- General Purpose (D) - 4'b1000
- General Purpose (X) - 4'b1001
- General Purpose (Y) - 4'b1010
- Flag register - 4'b1011

## OP codes

### Dataflow instructions

- load \[byte\] reg,mem -> 8'h00
- load \[byte\] reg, value -> 8'h01
- load \[byte\] reg, reg -> 8'h02
  
- store \[word\] value, mem -> 8'h03
- store \[word\] reg, mem -> 8'h04

### Arithmetic instructions

- iadd reg, reg -> 8'h05
- iadd reg, value -> 8'h06
- iadd value, reg -> 8'h07

- isub reg, reg -> 8'h08
- isub reg,value -> 8'h09
- isub value, reg -> 8'h0a
  
- imul reg, reg -> 8'h0b
- imul reg,value -> 8'h0c
- imul value, reg -> 8'h0d
  
- idiv reg, reg -> 8'h0e
- idiv reg, value -> 8'h0f
- idiv value, reg -> 8'h10

### Floatin point instructions

- fadd reg, reg -> 8'h11
- fadd reg,value -> 8'h12
- fadd value, reg -> 8'h13
  
- fsub reg, reg -> 8'h14
- fsub reg,value -> 8'h15
- fsub value, reg -> 8'h16
  
- fmul reg, reg -> 8'h17
- fmul reg,value -> 8'h18
- fmul value, reg -> 8'h19
  
- fdiv reg, reg -> 8'h1a
- fdiv reg,value -> 8'h1b
- fdiv value, reg -> 8'h1c
  
### Logical instructions

- and reg, reg -> 8'1d
- and reg, value -> 8'1e
- and value, reg -> 8'h1f
  
- or reg,value -> 8'h20
- or reg,value -> 8'h21
- or value,reg -> 8'h22
  
- not reg  -> 8'h23
- not value -> 8'h24
  
- xor reg,reg -> 8'h25
- xor value,reg -> 8'h26
- xor reg,value -> 8'h27
  
- shl reg, reg -> 8'h28
- shl reg, value -> 8'h29
- shl value, reg -> 8'h2a
  
- shr reg, reg -> 8'h2b
- shr reg, value -> 8'h2c
- shr value, reg -> 8'h2d
  
### Pin control instructions

- in reg, reg -> 8'h2e
- in reg, value -> 8'h2f
- out reg,reg -> 8'h30
- out reg,value -> 8'h31

### Control flow instructions

- cmp reg, reg -> 8'h32
- cmp reg, value -> 8'h33
- cmp value, reg -> 8'h34

- jmp value -> 8'h35
- jmp reg -> 8'h036
- jmp \[memorry\] -> 8'h37

- je value -> 8'h38
- je reg -> 8'h39
- je \[memorry\] -> 8'h3a

- jle value -> 8'h3b
- jle reg -> 8'h3c
- jle \[memorry\] -> 8'h3d

- jg value -> 8'h3e
- jg reg -> 8'h3d
- jg \[memorry\] -> 8'h3e

### Stack instructions

- push value -> 8'h3f
- push reg -> 8'h40
- push \[memorry\] -> 8'h41
  
- pop  -> 8'h42
- pop reg -> 8'h43
