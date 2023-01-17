`timescale 1ns / 1ps

module sipo_reg_tb;

reg clk,clear,din;
wire [3:0] dout;

sipo_reg uut (.clk(clk), .clear(clear),.din(din),.dout(dout));

initial begin

clk = 0;

clear = 0;

din = 0;

#5 clear=1'b1;

#5 clear=1'b0;

#10 din=1'b1;

end

always #5 clk = ~clk;
always #10 din=~din;

initial
begin
$monitor(" Data Input = %b | Data output =%b",din,dout);
 #150 $finish;
 end

endmodule
