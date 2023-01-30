module decoder_mux_tb;
reg a,b;
wire  w,y0,y1,y2,y3;

decoder_mux dut(a,b,w,y0,y1,y2,y3);

initial
 begin
    a=0 ; b=0 ;
#10 a=0 ; b=1 ;
#10 a=1 ; b=0 ;
#10 a=1 ; b=1 ;
end

initial
begin
 $monitor("a=%d  b=%d  y0=%d y1=%d y2=%d y3=%d ",a,b,y0,y1,y2,y3);
#50 $finish;
end
endmodule
