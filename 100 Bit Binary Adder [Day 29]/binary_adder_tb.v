module binary_adder_tb();
reg [99:0] a,b;
reg cin;
wire [99:0] sum;
reg i;

binary_adder dut(a,b,cin,sum);

initial
begin
{a, b, cin} = 0;
#10;
for(i = 0; i<8; i =i+1)
begin
{a} = {$random}%5000;
{b} = {$random}%5000;
#10;
end
end

initial
$monitor("input A=%d B=%d C=%d Sum=%d",a,b,cin,sum);

initial #100 $finish();
endmodule
