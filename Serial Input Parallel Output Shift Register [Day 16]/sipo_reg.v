`timescale 1ns / 1ps

module sipo_reg(clk,clear,din,dout);

input clk,din,clear;

output reg [3:0] dout;
reg [3:0] tmp;

always @(posedge clk )
begin
if (clear)
dout = 4'b0000;
else
tmp = dout >>1 ;
dout = {din,tmp[2:0]};
end
endmodule
