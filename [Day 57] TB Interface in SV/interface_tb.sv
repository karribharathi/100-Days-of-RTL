interface fa_if;
  logic a, b, c;
  logic s_out, c_out;
endinterface

module interface_tb;
  fa_if inf();
  full_adder fa(inf);
  
  initial begin
    $monitor("a=%b b=%b c=%b, sum=%b, carry=%b",inf.a,inf.b,inf.c,inf.s_out,inf.c_out);
    inf.a = 1; inf.b = 0; inf.c = 0;
    #1;
    inf.a = 1; inf.b = 0; inf.c = 1;
    #1;
    inf.a = 0; inf.b = 1; inf.c = 1;
  end
endmodule
