module mux4X1( in0,in1,in2,in3,s1,s0,out);
input in0,in1,in2,in3;
input   s1,s0;
output  out;
assign out = s1 ? (s0 ? in3 : in2) : (s0 ? in1 : in0);

endmodule


module comp_mux(a,b,greater,lesser,equal);
input a,b;
output  greater,lesser,equal;

mux4X1 mux1(1'b0,1'b1,1'b0,1'b0,a,b,lesser);
mux4X1 mux2(1'b1,1'b0,1'b0,1'b1,a,b,equal);
mux4X1 mux3(1'b0,1'b0,1'b1,1'b0,a,b,greater);

endmodule
