module CSA_tb;

    reg [3:0] x,y,z;
    wire [4:0] s;
    wire cout;  
    integer i,j,k,error;

    CSA uut (x,y,z,s,cout);

    initial begin
        // Initialize Inputs
        x = 0;
        y = 0;
        z = 0;
        error = 0;
        //three for loops to test all input combinations.
      for(i=0;i<16;i=i+1) begin
            for(j=0;j<16;j=j+1) begin
                for(k=0;k<16;k=k+1) begin
                     x = i;
                     y = j;
                     z = k;
                     #10;
                     if({cout,s} != (i+j+k)) 
                          error <= error + 1;
                end       
            end  
      end
    end 
    
endmodule
