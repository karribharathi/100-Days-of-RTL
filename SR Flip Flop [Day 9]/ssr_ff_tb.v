module sr_ff_tb;
reg S,R,clk;
wire Q, QBAR;

sr_ff dut(.q(Q), .qbar(QBAR), .s(S), .r(R), .clk(clk));

initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
 S= 1; R= 0;
 #100; S= 0; R= 1; 
 #100; S= 0; R= 0; 
 #100;  S= 1; R=1; 
end 

endmodule
