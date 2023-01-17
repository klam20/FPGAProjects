module RegToAscii(input [31:0] reg_in, output reg [6:0] ascii);

always@*
    case(reg_in)
        32'd0: ascii = 7'h30; //0
        32'd1: ascii = 7'h31;
        32'd2: ascii = 7'h32;
        32'd3: ascii = 7'h33;
        32'd4: ascii = 7'h34;
        32'd5: ascii = 7'h35;
        32'd6: ascii = 7'h36;
        32'd7: ascii = 7'h37;
        32'd8: ascii = 7'h38;
        32'd9: ascii = 7'h39; //9
        32'd10: ascii = 7'h41; //A
        32'd11: ascii = 7'h42; //B
        32'd12: ascii = 7'h43; //C
        32'd13: ascii = 7'h44; //D
        32'd14: ascii = 7'h45; //E
        32'd15: ascii = 7'h46; //F
    endcase

endmodule