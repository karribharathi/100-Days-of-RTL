// Code your testbench for sequence composition
module intersect_construct;   
  
  bit clk, a, b, stop, start ;  
  
  always #5 clk = ~clk; //clock generation  
  
  initial begin
    	a=0; b=0; start=1; stop=0;
    #10 b=1;
    #10 a=1; start=0; stop=1;
    #20 a=0; b=0; stop=0;
    #20 start=1;
    #10 b=1;
    #10 a=1; start=0; stop=1;
    #10 a=0;
    #20 a=1; b=0;  
    $finish;
  end
  
  sequence s1;
    ##[1:2] a;
  endsequence
  
  sequence s2;
    b ##[2:3] stop;
  endsequence
  
  //  intersect construct
  property p1;
    @(posedge clk) $rose(start) |=> s1 intersect s2;
  endproperty   
  
  property p2;
    @(posedge clk) $rose(start) |-> s1 intersect s2;
  endproperty   
  
  //	calling assert property
  a_1: assert property(p1);
    a_2: assert property(p2);
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end    
    
endmodule
