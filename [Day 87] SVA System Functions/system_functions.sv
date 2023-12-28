module system_functions;
  
  bit clk,a,b;  
  
  always #5 clk = ~clk; //clock generation  
  
  initial begin 
        a=1; b=1; 
    #15 a=0; b=0;
    #10 a=1; b=0; 
    #10 a=0; b=0;
    #10 a=0; b=1;
    #10 a=1; b=1;
    #10;
    $finish;
  end  

  
  property rose_p;
    @(posedge clk) a |-> $rose(b);
  endproperty
  
   property fell_p;
     @(posedge clk) a |-> $fell(b);
  endproperty
  
   property stable_p;
     @(posedge clk) a |-> $stable(b);
  endproperty
  
   property changed_p;
     @(posedge clk) a |-> $changed(b);
  endproperty
  
  a_1: assert property(rose_p); 
  a_2: assert property(fell_p); 
  a_3: assert property(stable_p); 
  a_4: assert property(changed_p); 
 
    
    
    
    initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule
