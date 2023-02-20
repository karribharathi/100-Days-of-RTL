`timescale 1ns/1ps
module gray_counter_tb();
//Declare variable and nets for module ports
reg reset_n;
reg clk=0;
wire [3:0] gray_counter_out;//connects the two modules

gray_counter dut(.clk(clk),.reset_n(reset_n),.gray_counter_out(gray_counter_out));
//Create the clock signal
always begin#0.5 clk = ~clk; end
//Generate the stimulus and monitor module ports
initial begin
$monitor("gray_counter_out=%4b",gray_counter_out);
end

initial begin//change the value of bin_in and observe the effects
reset_n=0;
#1 reset_n=1;
#49 $stop;
end 
endmodule
