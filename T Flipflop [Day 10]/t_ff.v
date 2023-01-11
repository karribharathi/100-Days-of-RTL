module t_ff(T,Clk,Q,Qbar );
input T,Clk;
output Q,Qbar;
reg Q,Qbar;
always@(posedge(Clk))
begin
if(T==0)
begin
 Q =1'b1;
 Qbar=1'b0;
end
else
begin
 Q =1'b0;
 Qbar=1'b1;
 end
end
endmodule
