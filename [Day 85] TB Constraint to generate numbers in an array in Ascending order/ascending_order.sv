class abc;
  rand bit[4:0]a[5];
  
  constraint C1 {foreach(a[i])
    				if(i>0)
      					a[i] > a[i-1];
                } 
  
  function void post_randomize();
    $display("\t Index    Value");
    foreach(a[i]) begin
      $display("\t [%0d]   |   %0d",i,a[i]);
    end
    $display("\t Ascending_order array =%p\n\n",a);
  endfunction
  
endclass

module ascending_order;
  abc h1;
  initial begin
    h1 = new();
    repeat(5) begin
      h1.randomize();
    end
  end
endmodule

   
      
