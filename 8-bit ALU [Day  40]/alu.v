module alu (a, b, opcode, rslt);
//define inputs and output
input [3:0] a, b;
input [2:0] opcode;
output [7:0] rslt;
//the rslt is left-hand side target in always
//and is declared as type reg
reg [7:0] rslt;
//define operation codes
//parameter defines a constant
parameter add_op = 3'b000,
sub_op = 3'b001,
mul_op = 3'b010,
and_op = 3'b011,
or_op = 3'b100,
not_op = 3'b101, //negation
xor_op = 3'b110,
xnor_op = 3'b111;
//perform the operations
always @ (a or b or opcode)
begin
case (opcode)
add_op: rslt = a + b;
sub_op: rslt = a - b;
mul_op: rslt = a * b;
and_op: rslt = a & b; //also ab
or_op: rslt = a | b;
not_op: rslt = ~a; //also ~b
xor_op: rslt = a ^ b;
xnor_op: rslt = ~(a ^ b);
endcase
end
endmodule
