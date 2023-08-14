module sting_tb;
string s;
initial begin
 s = "LinkedIn";
  $display(s.getc(6)); // Display: 73 (‘I’)
  $display(s.toupper()); // Display: LINKEDIN
  s = {s, ".con"}; // "LinkedIn.con"
  s.putc(s.len()-1, "m"); // change n-> m
  $display(s.substr(0, 5)); // Display: Linked
 // Create temporary string, note format 
  my_log($sformatf("%s/feed/", s));
end
task my_log(string message);
 // Print a message to a log
 $display("@%0d: %s", $time, message);
endtask
endmodule
