module impli_aser;
  
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

  
  property non_overlapped_implication_p;
    @(posedge clk) a |=> b;
  endproperty
  
  a_1: assert property(non_overlapped_implication_p);     
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule
