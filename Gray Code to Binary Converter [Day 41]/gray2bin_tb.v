module gray2bin_tb;

reg g0,g1, g2, g3;
wire b0,b1, b2, b3;
integer i;


gray2bin dut(.g0(g0),.g1(g1),.g2(g2),.g3(g3),.b0(b0),.b1(b1),.b2(b2),.b3(b3));

initial
$monitor("{gray}=%b , {binary}=%b",  {g0, g1, g2, g3},{b0,b1, b2, b3});

initial
begin
   for (i=0; i<16; i=i+1)
    begin
    {g0, g1, g2, g3} = i ;
    #10;
end
end
endmodule
