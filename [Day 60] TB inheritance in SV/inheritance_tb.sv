class parent_class;
  bit [15:0] data;
  
  function void disp_p();
    $display("Value of data = %0h", data);
  endfunction
endclass

class child_class extends parent_class;
  int id;
  
  function void disp_c();
    $display("Value of id = %0h", id);
  endfunction
endclass

module inheritance_tb;
  initial begin
    child_class c1;
    c1 = new();
    c1.data = 5; // child class is updating property of its base class
    c1.id = 1;
    
    c1.disp_p(); // child class is accessing method of its base class
    c1.disp_c();
  end
endmodule
