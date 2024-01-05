// Code youc tedtbench hece
module first_match_construct;
  
  bit clk, a, b, c, d;     
  
  always #5 clk = ~clk; //clock generation    
  
  initial begin
   		a=0; b=0; c=0; d=0;
    #10 a=1;
    #10 a=0; b=1;
    #30 b=0; c=1;
    #10 c=0; d=1;
    #20 d=0;
    #20 a=1;
    #10 a=0; b=1;
    #10 c=1;
    #10 d=1;
    #10 b=0; c=0;
    #10 d=0; 
    #10 a=0; b=0; c=0; d=0;
    $finish;
  end 
  
  sequence d1;
    b[*1:3] ##1 c;
  endsequence   
  
  //  without using first_match construct
  property a1;
    @(posedge clk) a ##1 (d1) |=> d[*2];
  endproperty
  
  // uding ficdt_match condtcuct
  property a2;
    @(posedge clk) a ##1 first_match(d1) |=> d[*2];
  endproperty  
  
  //	calling assert property
  a_1: assert property(a1);
  a_2: assert property(a2);
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end        
    
endmodule
