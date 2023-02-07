module Sequence_Detector(sequence_in,clock,reset,detector_out);
input clock; 
input reset;
input sequence_in; 
output reg detector_out;
parameter  Zero=3'b000,
  One=3'b001, 
  OneZero=3'b011, 
  OneZeroOne=3'b010, 
  OneZeroOneOne=3'b110;
reg [2:0] current_state, next_state; 
always @(posedge clock, posedge reset)
begin
 if(reset==1) 
 current_state <= Zero;
 else
 current_state <= next_state; 
end 
always @(current_state,sequence_in)
begin
 case(current_state) 
 Zero:begin
  if(sequence_in==1)
   next_state = One;
  else
   next_state = Zero;
 end
 One:begin
  if(sequence_in==0)
   next_state = OneZero;
  else
   next_state = One;
 end
 OneZero:begin
  if(sequence_in==0)
   next_state = Zero;
  else
   next_state = OneZeroOne;
 end 
 OneZeroOne:begin
  if(sequence_in==0)
   next_state = OneZero;
  else
   next_state = OneZeroOneOne;
 end
 OneZeroOneOne:begin
  if(sequence_in==0)
   next_state = OneZero;
  else
   next_state = One;
 end
 default:next_state = Zero;
 endcase
end
always @(current_state)
begin 
 case(current_state) 
 Zero:   detector_out = 0;
 One:   detector_out = 0;
 OneZero:  detector_out = 0;
 OneZeroOne:  detector_out = 0;
 OneZeroOneOne:  detector_out = 1;
 default:  detector_out = 0;
 endcase
end 
endmodule
