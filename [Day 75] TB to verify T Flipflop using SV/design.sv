module tff (tff_if vif);
  
  always@(posedge vif.clk)
    begin
      if(vif.rst == 1'b1)
        vif.q <= 1'b0;
      else
        if(vif.t)
         vif.q <= ~vif.q;
       else  
            vif.q <= vif.q;  
  
    end
  
endmodule
 
 
interface tff_if;
  logic clk;
  logic rst;
  logic t;
  logic q;
  
endinterface
