// Code your testbench here
module tb;
  
  // Declare some variables that can be "sampled" in the covergroup
  bit [1:0] a;
  bit [2:0] b;
  
  // Declare a clock to act as an event that can be used to sample
  // coverage points within the covergroup
  bit clk;
  always #20 clk = ~clk;
  
  // "cg" is a covergroup that is sampled at every posedge clk
  covergroup cg @ (posedge clk);
    coverpoint a;
  endgroup
  
  // Create an instance of the covergroup
  cg  cg_inst;
  
  initial begin
    // Instantiate the covergroup object similar to a class object
    cg_inst= new();
    for (int i = 0; i < 8; i++) begin
      @(negedge clk);
      a = $random;
      b = $random;
       $display ("[%0t] a=%0h b=%0h", $time, a, b);
    end
  end
  
  // At the end of 500ns, terminate test and print collected coverage
  initial begin
    #500 $display ("Coverage = %0.2f %%", cg_inst.get_inst_coverage());
    $finish;
  end
endmodule
