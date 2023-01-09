`timescale 1ns / 1ps

module par_gen_tb;

	// Inputs
	reg x;
	reg y;
	reg z;

	// Outputs
	wire result;

	// Instantiate the Unit Under Test (UUT)
	par_gen uut (
		.x(x), 
		.y(y), 
		.z(z), 
		.result(result)
	);

	initial begin

// Initialize Inputs

x = 0;

y = 0;

z = 0;

// Wait 100 ns for global reset to finish

#100;

// Add stimulus here

x = 0;

y = 0;

z = 1;

// Wait 100 ns for global reset to finish

#100;

x = 0;

y = 1;

z = 0;

// Wait 100 ns for global reset to finish

#100;

x = 0;

y = 1;

z = 1;

// Wait 100 ns for global reset to finish

#100;

x = 1;

y = 0;

z = 0;

// Wait 100 ns for global reset to finish

#100;

x = 1;

y = 0;

z = 1;

// Wait 100 ns for global reset to finish

#100;

x = 1;

y = 1;

z = 0;

// Wait 100 ns for global reset to finish

#100;

x = 1;

y = 1;

z = 1;

// Wait 100 ns for global reset to finish

#100;

end

endmodule
