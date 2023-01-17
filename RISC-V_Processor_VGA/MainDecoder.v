module MainDecoder(
    input [6:0] op,//opcode
    output reg RegWrite, ALUSrc, MemWrite, ResultSrc, Branch,
    output reg [1:0] ImmSrc, ALUOp
);

always @*
    case(op) 
        7'd3: //lw case
            begin
            RegWrite = 1; ImmSrc = 2'b00; ALUSrc = 1; MemWrite = 0; ResultSrc = 1; Branch = 0; ALUOp = 2'b00; 
            end
        7'd35: //sw case
            begin
            RegWrite = 0; ImmSrc = 2'b01; ALUSrc = 1; MemWrite = 1; ResultSrc = 1'bX; Branch = 0; ALUOp = 2'b00; 
            end
        7'd51: //R-type
            begin
            RegWrite = 1; ImmSrc = 2'bXX; ALUSrc = 0; MemWrite = 0; ResultSrc = 0; Branch = 0; ALUOp = 2'b10; 
            end
        7'd99: //beq
            begin
            RegWrite = 0; ImmSrc = 2'b10; ALUSrc = 0; MemWrite = 0; ResultSrc = 1'bX; Branch = 1; ALUOp = 2'b01; 
            end
    endcase

endmodule