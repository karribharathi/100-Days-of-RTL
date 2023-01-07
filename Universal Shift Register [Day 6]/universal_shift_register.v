`timescale 1ns / 1ps
module universal_shift_register (clr,clk,sel,parin,out);
input clr,clk;
input [1:0]sel;
input [3:0]parin;
output reg[3:0]out;

always @(posedge clk)
begin

if(clr)
out=4'b0000;

else
begin
case(sel)
2'b00: out=out;
2'b01: out={parin[0],parin[3:1]};
2'b10: out={parin[2:0],parin[3]};
2'b11: out=parin;
endcase
end

end
endmodule
