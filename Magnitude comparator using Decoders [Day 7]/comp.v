module decoder2x4(a,b,en,d0,d1,d2,d3);
input a,b,en;
output d0,d1,d2,d3;
assign d0=~a & ~b & en;
assign d1=~a & b & en;
assign d2=a & ~b & en;
assign d3=a & b & en;
endmodule

module comp(a,b,en,greater,equal,less);
input [1:0]a,b;
input en;
output greater,less,equal;
wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;

decoder2x4 dec1(a[1],b[1],en,w0,w1,w2,w3);
decoder2x4 dec2(a[0],b[0],w0,w4,w5,w6,w7);
decoder2x4 dec3(a[0],b[0],w3,w8,w9,w10,w11);

or or1(greater,w9,w1,w5);
or or2(equal,w4,w7,w8,w11);
or or3(less,w10,w2,w6);

endmodule
