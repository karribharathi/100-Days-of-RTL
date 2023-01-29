module mux(a,b,s,y);
input a,b,s;
output reg  y;
always @(a or b or s)
begin
 y= (~s&a) | (s&b);
end
endmodule


module d_latch(d,clock,q);
input d,clock;
inout q;

mux mux1(.a(q),.b(d),.s(clock),.y(q));

endmodule
