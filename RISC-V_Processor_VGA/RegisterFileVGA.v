module RegisterFileVGA(
    input CLK, RST_RF, RegWrite,
    input [4:0] A1, A2, A3,
    input [31:0] WD3,
  	output [31:0] RD1, RD2,
    output [31:0] R0, R1, R2, R3, R4, 
    R5, R6, R7, R8, R9, R10, R11, 
    R12, R13, R14, R15, R16, R17,
    R18, R19, R20, R21, R22, R23,
    R24, R25, R26, R27, R28, R29,
    R30, R31
);
  

reg [31:0] REGISTERS[0:31]; //32 registers of size 32 bits each
integer i;
  
assign RD1 = REGISTERS[A1];
assign RD2 = REGISTERS[A2];

  always @ (posedge CLK or posedge RST_RF)
    if (RST_RF)
      begin
        for (i = 0; i <= 31; i=i+1)
          begin
            REGISTERS[i] <= i;
          end
      end
    else REGISTERS[A3] <= RegWrite ? WD3 : 32'bX; 
  
  assign R0 = REGISTERS[0];
  assign R1 = REGISTERS[1];
  assign R2 = REGISTERS[2];
  assign R3 = REGISTERS[3];
  assign R4 = REGISTERS[4];
  assign R5 = REGISTERS[5];
  assign R6 = REGISTERS[6];
  assign R7 = REGISTERS[7];
  assign R8 = REGISTERS[8];
  assign R9 = REGISTERS[9];
  assign R10 = REGISTERS[10];
  assign R11 = REGISTERS[11];
  assign R12 = REGISTERS[12];
  assign R13 = REGISTERS[13];
  assign R14 = REGISTERS[14];
  assign R15 = REGISTERS[15];
  assign R16 = REGISTERS[16];
  assign R17 = REGISTERS[17];
  assign R18 = REGISTERS[18];
  assign R19 = REGISTERS[19];
  assign R20 = REGISTERS[20];
  assign R21 = REGISTERS[21];
  assign R22 = REGISTERS[22];
  assign R23 = REGISTERS[23];
  assign R24 = REGISTERS[24];
  assign R25 = REGISTERS[25];
  assign R26 = REGISTERS[26];
  assign R27 = REGISTERS[27];
  assign R28 = REGISTERS[28];
  assign R29 = REGISTERS[29];
  assign R30 = REGISTERS[30];
  assign R31 = REGISTERS[31];
  
endmodule