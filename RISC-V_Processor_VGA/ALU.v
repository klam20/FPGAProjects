module ALU(
    input [2:0] ALUControl,
    input [31:0] SrcA, SrcB,
  	output reg ZeroFlag,
    output reg [31:0] ALUResult
    
);

always@*
    case(ALUControl)
        3'b000: ALUResult = SrcA + SrcB; //ADD
        3'b001: 
            begin
            ALUResult = SrcA - SrcB; //SUB
            ZeroFlag = (SrcA - SrcB == 0) ? 1 : 0;
            end
        
        3'b010: ALUResult = SrcA & SrcB; //AND
        3'b011: ALUResult = SrcA | SrcB; //OR
        3'b101: ALUResult = (SrcA < SrcB) ? 1 : 0; //SLT
    endcase

endmodule