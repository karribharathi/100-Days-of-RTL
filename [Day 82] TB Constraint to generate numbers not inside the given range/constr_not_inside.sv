// Code your testbench here
class not_min_max;
  rand bit [3:0] data;
  rand bit [3:0] min;
  rand bit [3:0] max;
  
  constraint data_range {!( data inside {[min:max]});}
endclass

module constr_not_inside;
  initial begin
    not_min_max mm1;
    mm1 = new();
    $display("------------------------------------");
    repeat(3) begin
      mm1.randomize();
      $display("\tmin = %0d,max = %0d",mm1.min,mm1.max);
      $display("\tdata = %0d",mm1.data);
      $display("------------------------------------");
    end
  end
endmodule
