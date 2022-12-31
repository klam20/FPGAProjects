module fourBitRCA(sum,a,b,cin);
    input [3:0] a,b;    //4 bit inputs
    input cin;          //cin either 0 or 1
    output [4:0] sum;   //5 bit sum
    wire w1,w2,w3;      //wires to propagate cout signal to cin of next module
    oneBitFA fa1(sum[0],w1, a[0],b[0],cin);
    oneBitFA fa2(sum[1],w2, a[1],b[1],w1);
    oneBitFA fa3(sum[2],w3, a[2],b[2],w2);
    oneBitFA fa4(sum[3],sum[4], a[3],b[3],w3);    
endmodule
