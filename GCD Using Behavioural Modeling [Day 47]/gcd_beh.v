`timescale 1ns / 1ps
module gcd_beh#( parameter W = 7)
(
input [W-1:0] A, B,
output  reg [W-1:0] GCD
);
reg [W-1:0] Ain, Bin;
always @(*)
begin
Ain = A; Bin = B;
while( Ain != Bin)
begin
if ( Ain < Bin )
Bin = Bin-Ain;
else
Ain = Ain - Bin;
end
GCD = Ain;
end
endmodule 
