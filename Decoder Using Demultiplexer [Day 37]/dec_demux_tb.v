module dec_demux_tb();
reg a,b,c;
wire [0:7]out;
integer i;
dec_demux dut(a,b,c,out);
initial
begin
for(i=0;i<8;i=i+1)
begin
{a,b,c}=i;
#10;
end
#100 $finish;
end
endmodule
