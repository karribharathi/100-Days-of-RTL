// Code your testbench here
class transaction #(parameter WIDTH = 2, type D_TYPE = bit [2:0]);
  bit [WIDTH-1:0] data;
  D_TYPE id;
  
  function void display();
    $display("data = %0d, id = %0d", data, id);
  endfunction
endclass

module param_cls_tb;
  transaction tr1;
  transaction #(3,int) tr2;
  
  initial begin
    tr1 = new();
    tr2 = new();
    
    tr1.data = 7;
    tr1.id = 15;
    tr1.display();
    
    tr2.data = 7;
    tr2.id = 15;
    tr2.display();
  end
endmodule
