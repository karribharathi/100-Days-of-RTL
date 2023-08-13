module logic_tb;
	logic [3:0]  data; // Declare a 4-bit logic type variable
	logic  en; 			// Declare a 1-bit logic type variable
	bit [3:0]  bit_data;

	
	initial begin
    	$display ("data=0x%0h en=%0b", data, en);    	// Default value of logic type is X
		data = 4'h69; 				// logic datatype can be driven in initial/always blocks
      $display ("data=0x%0h en=%0b", data, en); 	 
      	#1;
      	$display ("data=0x%0h en=%0b", data, en);
	end
  
  assign en = data[3]; 					// logic datatype can also be driven via assign statements
endmodule
