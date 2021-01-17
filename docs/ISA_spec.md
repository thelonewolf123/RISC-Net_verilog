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
- Use 5 stage pipelining to improve overall instruction per cycle count.
- UART and SPI communications for external device interface.
- 2 timers and 2 counters.
- 4 I/O ports with 32 digital pins.

## Blocks

- Registers
- Data Memory
- Instruction Memory
- Pipeline
  - instruction fetch
  - instruction decode
  - operand fetch
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

## Registers