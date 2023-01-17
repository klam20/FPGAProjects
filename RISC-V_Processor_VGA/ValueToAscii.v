module ValueToAscii(
    input [3:0] in, //4 bits in
    output reg [6:0] out //translated to 7'hASCII
);

always@*
    case(in)
        4'd0: out = 7'h30; //0
        4'd1: out = 7'h31;
        4'd2: out = 7'h32;
        4'd3: out = 7'h33;
        4'd4: out = 7'h34;
        4'd5: out = 7'h35;
        4'd6: out = 7'h36;
        4'd7: out = 7'h37;
        4'd8: out = 7'h38;
        4'd9: out = 7'h39;
        4'd10: out = 7'h41; //A
        4'd11: out = 7'h42;
        4'd12: out = 7'h43;
        4'd13: out = 7'h44;
        4'd14: out = 7'h45;
        4'd15: out = 7'h46; //F
    endcase

endmodule