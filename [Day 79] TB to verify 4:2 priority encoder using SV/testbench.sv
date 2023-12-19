// Code your testbench here
//top.sv
`include "interface.sv"
`include "test.sv"

 module testbench;
 
 encoder_if pif();
 test tb(pif);
 
   encoder d1(.d(pif.d),.o(pif.o));
 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(1);
 
 end
 endmodule
 
 
