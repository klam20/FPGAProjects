module ALUDecoder(
    input [1:0] ALUOp,
    input [2:0] funct3,
    input op5, funct7,
    output reg [2:0] ALUControl
);

always@*
    case(ALUOp)
        2'b00: ALUControl = 3'b000; //lw, sw requires 000 ADD for Addresses out of Reg File
        2'b01: ALUControl = 3'b001; //beq utilizes 001 SUB to set zero flag
        2'b10: //R-type check funct3, 5th bit of op and funct7 field
        begin
            case(funct3)
                3'b000: ALUControl = {op5, funct7} == 2'b11 ? 3'b001: 3'b000; //SUB else ADD
                3'b010: ALUControl = 3'b101; //SLT
                3'b110: ALUControl = 3'b010; //OR
                3'b111: ALUControl = 3'b011;  //AND
            endcase
        end
    endcase

endmodule