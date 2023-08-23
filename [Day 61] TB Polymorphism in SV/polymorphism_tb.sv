class Base; 
  virtual task print (); 
    $display("This is Base Class"); 
  endtask 
endclass 
 
class Extended extends Base; 
  task print (); 
    $display("This is Extended Class"); 
  endtask 
endclass 
module polymorphism_tb; 
  Extended ext; 
  Base     ba; 
  
  initial 
    begin 
      ba = new(); 
      ba.print(); 
      
      ext = new();
      ext.print();
      ba  = ext; 
      ba.print(); 
    end
  endmodule
