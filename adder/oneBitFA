module oneBitFA(sum, cout, a, b, cin);
    input a,b,cin;          //one bit inputs
    output sum, cout;       //one bit outputs
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a | b));
endmodule
