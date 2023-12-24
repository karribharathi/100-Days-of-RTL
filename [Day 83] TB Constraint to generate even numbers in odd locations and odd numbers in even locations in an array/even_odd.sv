class abc;
  rand bit[3:0] a[15];
  int i;
  constraint position{ foreach (a[i]) {
    					if(i%2 ==0)
      							a[i]%2 == 1;
    					else
     						 	a[i]%2 == 0;
  										} 
                     }
  function void disp();
    foreach(a[i])begin
      if(i%2 == 0)
        $write("\tindex=%0d(Even location)",i);
      else
        $write("\tindex=%0d(Odd location)",i);
      
      if(a[i]%2 == 0)
        $display("Value = %0d (Even Number)",a[i]);
      else
        $display("Value = %0d (Odd Number)",a[i]);
    end
  endfunction
endclass

module even_odd;
 
initial begin
  abc c_h;
  c_h=new();
  repeat(2) begin
    c_h.randomize();
    c_h.disp();
  end
end
endmodule
