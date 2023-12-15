// Code your design here
module demux(d,sel,y);
  input  d;
  input [2:0] sel;
  output reg [7:0]  y;
  
  always @(*)
    begin
      case(sel)
    3'b000: begin
          y[0]=d; 
         y[7:1] = 0;
        end
        3'b001: begin
          y[1]=d; 
          y[0] = 0;
        end
        3'b010:
          begin
            y[2]=d; 
            y[1:0] = 0;
          end
        3'b011:
          begin
            y[3]=d; 
            y[2:0] = 0;
          end
        3'b100:
          begin
            y[4]=d; 
            y[3:0] = 0;
          end
        3'b101:
          begin
            y[5]=d; 
            y[4:0] = 0;
          end
        3'b100:
          begin
            y[6]=d; 
            y[5:0] = 0;
          end
        3'b111:
          begin
            y[7]=d; 
            y[6:0] = 0;
          end 
      endcase
    end
endmodule
       
        
     
