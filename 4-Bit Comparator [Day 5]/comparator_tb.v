`timescale 1ns/1ps

module comparator_tb;
  reg [3:0] a,b;
  wire eq,lt,gt;
  
  comparator DUT (a,b,eq,lt,gt);
  
  initial
  begin
   a = 4'b1100;
   b = 4'b1100;
   #10;
 
   a = 4'b0100;
   b = 4'b1100;
   #10;
 
   a = 4'b1111;
   b = 4'b1100;
   #10;
 
   a = 4'b0000;
   b = 4'b0000;
   #10;
   $stop;
  end
endmodule
