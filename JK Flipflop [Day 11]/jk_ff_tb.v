module jk_ff_tb;  
   reg j,k,clk; 
   wire q;
   
   jk_ff    jk0 ( .j(j),  
                  .k(k),  
                  .clk(clk),  
                  .q(q)); 
initial clk = 0;
    always #5 clk = ~clk; 				  
  
   initial begin  
      j <= 0;  
      k <= 0;  
  
      #5 j <= 0;  
         k <= 1;  
      #20 j <= 1;  
          k <= 0;  
      #20 j <= 1;  
          k <= 1;  
      #20 $finish;  
	  end  
  
   initial  
      $monitor ("j=%0d k=%0d q=%0d", j, k, q);  
endmodule  
