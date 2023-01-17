`include "MainDecoder.v"
`include "ALUDecoder.v"
`include "PCCounter.v"
`include "PCPlus4.v"
`include "InstructionMemory.v"
`include "PCTarget.v"
`include "signExtender.v"
`include "ALU.v"
`include "DataMemory.v"
`include "RegisterFileVGA.v"

module Processor(input CLK, RST, RST_RF, RST_DM,
                output [31:0] R0, R1, R2, R3, R4, 
                    R5, R6, R7, R8, R9, R10, R11, 
                    R12, R13, R14, R15, R16, R17,
                    R18, R19, R20, R21, R22, R23,
                    R24, R25, R26, R27, R28, R29,
                    R30, R31);
  //PC Counter
  wire PCSrc;
  wire [31:0] PCNext;
  wire [31:0] PC;
  PCCounter U0(.CLK(CLK),
               .RST(RST), .PCNext(PCNext), .PC(PC));
  
  //PC Plus 4
  wire [31:0] PCPlus4;
  PCPlus4 U1(.PC(PC), .PCPlus4(PCPlus4));
  
  //InstructionMem
  wire [31:0] Instr;
  InstructionMemory U2(PC, Instr);
  
  //ALUControllers
//Wires incoming to MainDecoder 
  wire MemWrite, ResultSrc, ALUSrc, RegWrite, Branch;
  wire [1:0] ImmSrc, ALUOp;
  wire [6:0] op = Instr[6:0];
  wire [2:0] funct3 = Instr[14:12];
  wire funct7 = Instr[30];
  wire [2:0] ALUControl;
MainDecoder U3(.op(Instr[6:0]), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .MemWrite(MemWrite),
 .ResultSrc(ResultSrc), .Branch(Branch),.ImmSrc(ImmSrc), .ALUOp(ALUOp));

  ALUDecoder U4(.ALUOp(ALUOp), .funct3(funct3), .funct7(funct7), .op5(op[4]),.ALUControl(ALUControl));
  
  //Wires for signExtender
  wire [31:0] ImmExt;  
  signExtender U5(.ImmSrc(ImmSrc), .ImmExt(ImmExt), .Instr(Instr));
  
  //Wires for PCTarget
  wire [31:0] PCTarget;
  PCTarget U6(.PC(PC), .ImmExt(ImmExt), .PCTarget(PCTarget));
  
  //Wires for Register File
  wire [4:0] A1 = Instr[19:15];
  wire [4:0] A2 = Instr[24:20];
  wire [4:0] A3 = Instr[11:7];
  wire [31:0] Result;
  wire [31:0] RD1, RD2; //RD1 is SrcA, RD2 could be SrcB depending on MUX
  
  RegisterFileVGA U7(.CLK(CLK), .RST_RF(RST_RF), .A1(A1), .A2(A2), .A3(A3), .RegWrite(RegWrite), .WD3(Result), .RD1(RD1), .RD2(RD2),
                  .R0(R0),
                  .R1(R1),
                  .R2(R2),
                  .R3(R3),
                  .R4(R4),
                  .R5(R5),
                  .R6(R6),
                  .R7(R7),
                  .R8(R8),
                  .R9(R9),
                  .R10(R10),
                  .R11(R11),
                  .R12(R12),
                  .R13(R13),
                  .R14(R14),
                  .R15(R15),
                  .R16(R16),
                  .R17(R17),
                  .R18(R18),
                  .R19(R19),
                  .R20(R20),
                  .R21(R21),
                  .R22(R22),
                  .R23(R23),
                  .R24(R24),
                  .R25(R25),
                  .R26(R26),
                  .R27(R27),
                  .R28(R28),
                  .R29(R29),
                  .R30(R30),
                  .R31(R31)
                 );  
  
  //Wires for ALU
  wire [31:0] ALUResult;
  wire [31:0] SrcB; //SrcA not needed to declare since it comes from RD1 of Register File
  wire ZeroFlag;
  ALU U8(.SrcA(RD1), .SrcB(SrcB), .ALUControl(ALUControl), .ALUResult(ALUResult), .ZeroFlag(ZeroFlag));
  
  //Wires for Data Memory
  wire [31:0] ReadData;
  DataMemory U9(.CLK(CLK), .RST_DM(RST_DM), .A(ALUResult), .MemWrite(MemWrite), .WD(RD2), .RD(ReadData));
 
  assign PCSrc = ZeroFlag & Branch;
  assign PCNext = PCSrc ? PCTarget : PCPlus4;
  assign SrcB = ALUSrc ? ImmExt >> 2 : RD2;
  assign Result = ResultSrc ? ReadData : ALUResult;
endmodule