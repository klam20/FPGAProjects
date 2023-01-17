module PCCounter(
    input CLK, RST,
    input [31:0] PCNext, //nextstate
    output reg [31:0] PC //current state
);
  
always @ (posedge CLK or posedge RST) //CS
    if (RST)
        PC <= 0;
    else PC <= PCNext;
endmodule