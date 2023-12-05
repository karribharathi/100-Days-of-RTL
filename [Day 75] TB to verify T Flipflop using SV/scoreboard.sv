class scoreboard;
  
  transaction tr;
  transaction trref;
  mailbox #(transaction) mbx;
  mailbox #(transaction) mbxref;
  event sconext;
 
 
  function new( mailbox #(transaction) mbx,  mailbox #(transaction) mbxref);
   this.mbx = mbx;
   this.mbxref = mbxref;
  endfunction
  
  task run();
    forever begin
      mbx.get(tr);
      mbxref.get(trref);
      tr.display("SCO");
      trref.display("REF");
      if(tr.q == trref.t)
        $display("[SCO] : DATA MATCHED");
      else
        $display("[SCO] : DATA MISMATCHED"); 
      ->sconext;
    end
  endtask
  
  
endclass
 
