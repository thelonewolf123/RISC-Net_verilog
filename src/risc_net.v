module RISC_Net(input wire clk,
                input wire reset);
    
    // Inputs
    reg [31:0] dataIn;
    reg [15:0] address;
    reg wn;
    reg rd;
    
    // Outputs
    
    wire [31:0] dataOut;
    
    reg rdi;
    reg wni;
    reg [3:0] reg_id;
    reg [15:0] write_data_reg;
    wire [15:0] read_data_reg;
    
    
    wire [31:0] instruction;
    
    reg cs;
    wire i_rd;
    wire i_wn;
    wire [15:0] i_address;
    wire [3:0] i_reg_id;
    wire i_rdi;
    wire i_wni;
    wire [15:0] i_write_data_reg;
    wire [31:0] i_instruction;
    
    assign i_rd = rd;
    assign i_wn = wn;
    
    InstructionMemory uut (
    .write_data(dataIn),
    .read_data(dataOut),
    .address(address),
    .wn(wn),
    .rd(rd),
    .clk(clk)
    );
    
    Register register(.clk(clk),
    .reset(reset),
    .rd(rdi),
    .wn(wni),
    .reg_id(reg_id),
    .write_data(write_data_reg),
    .read_data(read_data_reg));
    
    InstructionFetch instruction_fetch(.clk(clk),
    .cs(cs),
    .read_memory(dataOut),
    .read_data_reg(read_data_reg),
    .rd(i_rd),
    .wn(i_wn),
    .address(i_address),
    .reg_id(i_reg_id),
    .rdi(i_rdi),
    .wni(i_wni),
    .write_data_reg(i_write_data_reg),
    .instruction(instruction));
    
    
    always @(posedge clk) begin
        
        address        = i_address;
        reg_id         = i_reg_id;
        rdi            = i_rdi;
        wni            = i_wni;
        write_data_reg = i_write_data_reg;
    end
    
endmodule
