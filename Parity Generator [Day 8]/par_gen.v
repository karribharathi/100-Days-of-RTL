`timescale 1ns / 1ps
module par_gen(x,y,z,result);
input x,y,z;
output result;
xor (result,x,y,z);  
endmodule
