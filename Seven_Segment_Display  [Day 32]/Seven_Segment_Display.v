module Seven_Segment_Display( in, segment );
         
         input [3:0] in;
    output [7:0] segment;
    reg [7:0] segment;

always @(bcd)
    begin
        case (bcd) 
            4'b0000 : segment = 8'b11000000;      
            4'b0010 : segment = 8'b10100100;      
            4'b0100 : segment = 8'b10011001;     
            4'b0110 : segment = 8'b10000010;    
            4'b1000 : segment = 8'b10000000;   
            4'b1010 : segment = 8'b00010001; 
            4'b1100 : segment = 8'b01100011; 
            4'b1110 : segment = 8'b01100001;
                 
            default: segment=8'b00000000;
        endcase
    end
    
endmodule
