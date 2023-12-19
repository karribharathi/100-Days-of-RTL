// Code your design for ecoder
module encoder(d,o);
  input  [3:0] d;
  output  reg [1:0] o;
always @(d)
begin
casex(d)
4'b0001: o= 3'b00;
4'b001x: o= 3'b01;
4'b01xx: o= 3'b10;
4'b1xxx: o= 3'b11;
endcase
end
endmodule


