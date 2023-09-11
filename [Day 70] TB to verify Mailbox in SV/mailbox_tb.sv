module mailbox_tb();
  mailbox mb = new(3);
  
  task process_A();
    int value = 4;
    string name = "LinkedIn";
    mb.put(value);
    $display("Put data = %0d", value);
    mb.put(name);
    $display("Put data = %s", name);
  endtask

  task process_B();
    int value;
    string name;
    mb.get(value);
    $display("Retrieved data = %0d", value);
    mb.get(name);
    $display("Retrieved data = %s", name);
  endtask
  
  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule
