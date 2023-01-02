module clockdivider(clk,clk2,clk4,clk8,rst);
input clk,rst;
reg [3:0]count;
output clk2,clk4,clk8;
reg clk2,clk4,clk8;
always@(posedge clk)
begin
if(rst==0)
count=4'b0000;
else
count=count+1;
clk2=count[1];
clk4=count[2];
clk8=count[3];
end
endmodule
