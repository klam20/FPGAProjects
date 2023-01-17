module InstructionMemory(
    input [31:0] A, //PC
    output [31:0] RD //Read Data at that Address (machine code)
);

reg [31:0] InstrMemory[0:1023];
//Read txt file here
initial begin
  $readmemh("InstructionMemory.txt", InstrMemory);
end

//Have addresses be read in increments of 4
assign RD = InstrMemory[A >> 2]; //Due to PC+4, the simplified version is to divide PC by 4 to get increments of 1
endmodule

//This then loops 3 times
//First 5 instructions are add x31, x31, x1
//Next instruction is  add x8, x31, x28
//Next 5 instructions are sub x4, x4, x2
