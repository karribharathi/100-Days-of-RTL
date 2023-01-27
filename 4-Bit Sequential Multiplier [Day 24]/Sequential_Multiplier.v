`timescale 1ns / 1ps
module Sequential_Multiplier (Result, X, A, Clock, c, temp);
input Clock;
input [3:0] A, X;
output reg [7:0] Result;
integer i;
output reg c;
output reg [7:0] temp;
always @ (posedge Clock)
begin
temp [7:0] = 8'b00000000;
for (i =0; i<4; i=i+1)
begin
if(X[i]==0)
begin
{c, temp [7:4]} = temp [7:4] +4'b0000;
temp [7:0] = {c, temp [7:1]};
end
else
begin
{c, temp [7:4]} = temp [7:4] + A;
temp [7:0] = {c, temp [7:1]};
end
end
Result [7:0] = temp [7:0];
end
endmodule
