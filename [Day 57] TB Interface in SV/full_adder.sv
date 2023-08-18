module half_addr(input a, b, output so, co);
  assign so = a^b;
  assign co = a & b;
endmodule

module full_adder(fa_if inf);
  wire s0, c0, c1;
  half_addr HA1 (inf.a, inf.b, s0, c0);
  half_addr HA2 (s0, inf.c, inf.s_out, c1);
  
  assign inf.c_out = c0 | c1;
endmodule
