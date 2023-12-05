class transaction;
  rand bit t;
  bit q;
  
  function transaction copy();
    copy = new();
    copy.t = this.t;
    copy.q = this.q;
  endfunction
  
  function void display(input string tag);
    $display("[%0s] : TIN : %0b QOUT : %0b", tag,t, q);
  endfunction
  
  
endclass
