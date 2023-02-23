module clk_div_odd_tb;

	// Inputs
	reg clk_in;

	// Outputs
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)
clk_div_odd uut (
		.clk_in(clk_in), 
		.clk_out(clk_out)
	);

	initial begin
		clk_in=1;
		end
	
	always #10 clk_in= ~clk_in;
	
	initial 
	#200 $finish;
      
endmodule
