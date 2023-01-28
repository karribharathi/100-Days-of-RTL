`timescale 1ns / 1ps
  module Array_multi_tb;       
  
   reg [3:0]inp1;
   reg [3:0]inp2;       
   wire [7:0]product;  
        
   Array_multiplier uut(.inp1(inp1),.inp2(inp2),.product(product));

   initial
   begin 
     inp1=3;
     inp2=20;
     #30 ;

     inp1=13;
     inp2=16;
     #30 ;
   
     inp1=10;
     inp2=28;
     #30 ;
   
     inp1=11;
     inp2=22;
     #30 ;
   
     inp1=17;
     inp2=15;
     #30 ;
   
     $finish;
   end 
endmodule
