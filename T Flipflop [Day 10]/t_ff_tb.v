module t_ff_tb;
reg T;
reg Clk;
wire Q;
wire Qbar;

t_ff uut (
.T(T), 
.Clk(Clk), 
.Q(Q), 
.Qbar(Qbar)
);

 initial Clk = 0;
    always #100 Clk = ~Clk;
 initial T=0;
   always #100 T=~T;
initial begin
T = 0;
Clk = 0;
end
endmodule
