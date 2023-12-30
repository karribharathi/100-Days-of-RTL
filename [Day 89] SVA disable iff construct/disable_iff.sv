module impli_aser;
  
  bit clk,a,b,reset;  
  
  always #5 clk = ~clk; //clock generation  
  
  initial begin 
        a=1; b=1; 
    #15 reset =1;
    	a=0; b=0;
    #10 reset=0;
        a=1; b=0; 
    #10 a=0; b=0;
    #10 a=0; b=1;
    #10 a=1; b=1;
    #10;
    $finish;
  end  
 property non_overlapped_p;
    @(posedge clk) a |=> b;
  endproperty
  
  property disable_iff_p;
    disable iff(reset)
    @(posedge clk) a |=> b;
  endproperty
  
  a_1: assert property(non_overlapped_p);
  a_2: assert property(disable_iff_p);     
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule
