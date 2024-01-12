// Code your testbench here
module tb;
  bit [3:0] a;
  bit [3:0] b;
  bit [3:0] c;
  bit [4:0] d;
  bit [1:0] e;
  
  //covergroup with implicit bins 
  covergroup cg_1;
    option.per_instance =1;
    label_1 : coverpoint a;
    endgroup 
  
  covergroup cg_2;
    option.per_instance =1;
    label_1 : coverpoint a;
    label_2 : coverpoint b{
      bins b1={1};
      bins b2={[5:10]};
    }
    label_2_1 : coverpoint c{
     bins c1={15};
     bins c2={[11:13]};
    }
    //cross coverage  
    cross_1_2 : cross label_2,label_2_1;   
  endgroup
  
   //STATE BINS
  covergroup cg_3;
    option.per_instance =1;
    label_3 : coverpoint d{
      bins sep[]={10,15,30};
      bins fixed[2]={[0:5],10,15,30};
    }
  endgroup
  
  cg_1 c1=new();
  cg_2 c2=new();
  cg_3 c3=new();
 
  initial begin 
    for (int i=0;i<100;i++) begin 
      {a,b,c,d,e}=$random;
    #1;
      $display("a=%0d  b=%0d  c=%0d  d=%0d  e=%0d",a,b,c,d,e);
      c1.sample();
      c2.sample();
      c3.sample();
    end
  end
  
   initial begin
 #500 $display ("Coverage of cg_1 = %0.2f %% Coverage of cg_2 = %0.2f %% Coverage of cg_3 = %0.2f %% ", c1.get_inst_coverage(),c2.get_inst_coverage(),c3.get_inst_coverage());
    $finish;
  end
  
endmodule
