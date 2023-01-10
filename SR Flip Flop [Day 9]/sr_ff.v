module sr_ff(s,r,clk, q, qbar);

input s,r,clk;
output reg q, qbar;

always@(posedge clk)
begin

if(s == 1)
begin
q = 1;
qbar = 0;
end
else if(r == 1)
begin
q = 0;
qbar =1;
end
else if(s == 0 & r == 0) 
begin 
q <= q;
qbar <= qbar;
end
end
endmodule
