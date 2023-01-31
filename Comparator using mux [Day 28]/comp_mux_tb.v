module comp_mux_tb;
	reg a;
	reg b;
	wire greater;
	wire lesser;
	wire equal;

	
	comp_mux uut (
		.a(a), 
		.b(b), 
		.greater(greater), 
		.lesser(lesser), 
		.equal(equal)
	);

	initial 
	begin
		a=0; b=0;
		#10 a=0;b=1;
		#10 a=1;b=0;
		#10 a=1;b=1;

	end
	
	initial 
	begin
	$monitor("A=%b | B=%b | Greater =%b | Lesser=%b | Equal=%b",a,b,greater,lesser,equal);
	#100 $finish;
	end
      
endmodule
