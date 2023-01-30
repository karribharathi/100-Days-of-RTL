module mux(a,b,s,y);
input a,b,s;
output reg y;
always @(a or b or s)
begin
y=(~s&a)| (s&b);
end
endmodule

module decoder_mux (a,b,w,y0,y1,y2,y3);
input a,b;
inout w,y0,y1,y2,y3;


mux m1(1'b1,1'b0,a,w);
mux m2(w,1'b0,b,y0);
mux m3(b,1'b0,a,y1);
mux m4(a,1'b0,b,y2);
mux m5(1'b0,a,b,y3);

endmodule
