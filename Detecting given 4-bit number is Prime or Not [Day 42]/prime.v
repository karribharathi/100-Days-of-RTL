module prime(input [3:0]a, output reg prime);
always @(a)
begin
case(a)
4'b0000:prime=0;
4'b0001:prime=0;
4'b0010:prime=1;
4'b0011:prime=1;
4'b0100:prime=0;
4'b0101:prime=1;
4'b0110:prime=0;
4'b0111:prime=1;
4'b1000:prime=0;
4'b1001:prime=0;
4'b1010:prime=0;
4'b1011:prime=1;
4'b1100:prime=0;
4'b1101:prime=1;
4'b1110:prime=0;
4'b1111:prime=0;
default:prime=0;
endcase
end
endmodule



