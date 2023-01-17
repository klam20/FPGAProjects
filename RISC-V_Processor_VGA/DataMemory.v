module DataMemory(
    input CLK, RST_DM, MemWrite,
    input [31:0] A, WD,
    output [31:0] RD
);

reg [31:0] MEMORY[0:255];
integer j = 0;

  always@(posedge CLK or posedge RST_DM)
    if (RST_DM)
      begin
        for (j = 0; j < 256; j=j+1)
          begin
            MEMORY[j] <= j;
          end
      end
    else MEMORY[A] <= MemWrite ? WD : MEMORY[A]; //get written data else stall    

  assign RD = MEMORY[A];

endmodule