module PCPlus4(
    input [31:0] PC,
    output [31:0] PCPlus4
);

assign PCPlus4 = PC + 32'd4;
endmodule