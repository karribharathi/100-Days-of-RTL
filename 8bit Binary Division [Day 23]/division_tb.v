`timescale 1ns / 1ps

module division_tb;

	reg [7:0] divisor;
	reg [7:0] dividend;

	wire [7:0] remainder;
	wire [7:0] result;

	division uut (.divisor(divisor),.dividend(dividend),.remainder(remainder),.result(result));

	initial begin

		divisor = 12;
		dividend = 73;
		
		#100;
		divisor = 3;
		dividend = 15;
		
		#100;
		divisor = 7;
		dividend = 47;
	end
      
	initial begin
		$monitor("Divisor: %d, Dividend: %d, Remainder: %d, Result: %d\n", divisor, dividend,remainder, result);
	#300 $finish;
	end
endmodule
