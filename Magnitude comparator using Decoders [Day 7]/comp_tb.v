module comp_tb();
reg [1:0]a,b;
reg en;
wire greter,less,equal;
comp dut(a,b,en,greater,equal,less);
integer i;
task initialize;
{a,b,en}=0;
endtask

task stimulus;
begin
for(i=0;i<=16;i=i+1)
begin
#10{a,b}=i;
end
end
endtask

initial 
begin
initialize;
en=1;
stimulus;
$finish;
end

initial
$monitor($time,"en=%b,a=%b,b=%b,greater=%b,equal=%b,less=%b",en,a,b,greater,equal,less);
endmodule
