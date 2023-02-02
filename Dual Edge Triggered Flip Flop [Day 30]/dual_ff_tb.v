module dual_ff_tb();
reg d;
reg clk;
wire q;

dual_trigger_ff dut(clk,d,q);

initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial 
begin 
 d <= 0;
 #10;
 d <= 1;
 #25;
 d <= 0;
 #15;
 d <= 1;
 #100 $finish;
end 

endmodule 
