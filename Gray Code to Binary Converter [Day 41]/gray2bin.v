module gray2bin(input g0,g1,g2,g3, output b0,b1,b2,b3);

assign b3 = g3;
assign b2 = g2 ^ b3;
assign b1 = g1 ^ b2;
assign b0 = g0 ^ b1;

endmodule
