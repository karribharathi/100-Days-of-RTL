module task_tb;
  
  task compare(input int a, b, output z);
    if(a>b)
      $display("a is greater than b");
    else if(a<b)
      $display("a is less than b");
    else 
      $display("a is equal to b");
    
    #10;
    z = 1;
  endtask
  
  initial begin
    bit z;
    compare(10,10, z);
    if(z) $display("comparison completed at time = %0t", $time);
    compare(5,9, z);
    if(z) $display("comparison completed at time = %0t", $time);
    compare(9,5, z);
    if(z) $display("comparison completed at time = %0t", $time);
  end
endmodule
