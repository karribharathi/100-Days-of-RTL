module dual_trigger_ff(
    input clk,
    input d,
    output q
);
reg q1,q2;
    
    always @ (posedge clk) 
	begin
    	q1 <= d; 
    end
    
    always @ (negedge clk)
	begin
    	q2 <= d; 
    end
    
    assign q = ((~clk)&q2)| (clk&q1); 
endmodule
