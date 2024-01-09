// Code your testbench here
module repetition_operators;   
  
  bit clk, a, b, c;  
  
  always #5 clk = ~clk; //clock generation  
  
  initial begin 
        a=1; b=0; c=0;
    #10 a=0;
    #10 b=1;
    #10 b=0;
    #10 b=1;
    #10 b=0; c=1;
    #10 a=1; c=0;
    #10 a=0;
    #10 b=1;
    #10 b=0;
    #10 b=1;
    #20 a=1; b=0;
    #10 a=0; c=1;
    #10 b=1; c=0; 
    #10 a=1; b=0; c=0;
    #10 a=0; 
    #10 b=1;
    #10 b=0;
    $finish;
  end
  
  //  non-consecutive_repetition_operator [=n]
  property non_consecutive_repetition_p;
    @(posedge clk) $rose(a) |=> ##1 (b[=2]) ##1 c;
  endproperty    
  
   //  consecutive_repetition_operator [*n]
  property consecutive_repetition_p;
    @(posedge clk) $rose(a) |=> ##1 (b[*3]) ##1 c;
  endproperty
    
  //  go_to_operator [->n]
  property go_to_repetition_p;
    @(posedge clk) $rose(a) |=> ##1 (b[-> 2:4]) ##1 c;
  endproperty
    
  //	calling assert property
  a_1: assert property(non_consecutive_repetition_p);
  a_2: assert property(consecutive_repetition_p);
  a_3: assert property(go_to_repetition_p); 
  
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end    
    
endmodule
