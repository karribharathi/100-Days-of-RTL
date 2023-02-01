module one_bit_FA(
    input a,b,
    input cin,
    output cout,sum);
    assign sum  = a^b^cin;
    assign cout = (a&b)|(b&cin)|(cin&a);
endmodule

module binary_adder( 
    input [99:0] a, b,
    input cin,
	output [99:0] sum );
    wire [99:0] c_out;
    genvar i;
    one_bit_FA FA1(a[0],b[0],cin,c_out[0],sum[0]);
    generate
        for (i=1; i<100; i=i+1)
		begin : Full_adder_block
        one_bit_FA FA(a[i],b[i],c_out[i-1],c_out[i],sum[i]);
    end
    endgenerate
endmodule
