module prime_tb;
reg [3:0]a;
wire prime;
integer i;

prime dut(.a(a),.prime(prime));

initial 
begin
for (i=0; i<16; i=i+1)
    begin
    a = i ;
    #10;
	end
end
initial $monitor("Number=%b ,prime=%b",a,prime);
initial #200 $finish;
endmodule
	
