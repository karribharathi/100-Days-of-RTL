// Code your testbench here
module tb;
 
  bit [1:0] e;
  bit [2:0] f;
  bit [1:0] g;
  
 
 
  //TRANSITION BINS
  covergroup cg_1;
    option.per_instance =1;
    label_4 : coverpoint e{
      bins tns[]= (1=>0);
      bins tns1= (1,2=>0,3);
      bins tns_1[]= (1,2=>0,3);
      bins tns2[]= (1,2=>0,3);
      bins tns3[]=([1:3]=>2);
      bins tns4[]=([1:3]=>1),(2=>3);
      bins tns5=([1:3]=>1),(2=>3);
    }
  endgroup
  
  //WILDCARD BINS 
  covergroup cg_2;
    option.per_instance =1;
    label_5 : coverpoint f{
      wildcard bins wldcd={3'b1??};
      wildcard bins wldcd1[]=(3'b10?=>3'b11?);
      wildcard bins wldcd2=(3'b10x=>3'b11x);
      wildcard bins wldcd3_even={3'b??0};
      wildcard bins wldcd4_odd={3'b??1};
    }
  endgroup
  
  //ignore bins  and illegal bins 
  covergroup cg_3;
    option.per_instance =1;
    label_6 : coverpoint g{
      ignore_bins g1={1,3};
      ignore_bins g2=(1=>2);
      illegal_bins g4={0,2};
    
    }
  endgroup
  
  cg_1 c1=new();
  cg_2 c2=new();
  cg_3 c3=new();
  
  initial begin 
    for (int i=0;i<100;i++) begin 
      {e,f,g}=$random;
    #1;
      $display("e=%0d f=%0d g=%0d",e,f,g);
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
