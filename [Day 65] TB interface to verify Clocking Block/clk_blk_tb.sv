interface mult_if (input logic clk, reset);
  logic [7:0] a, b;
  logic [15:0] out;
  logic en;
  logic ack;
  
  clocking cb @(posedge clk);
    default input #1 output #2;
    input out, ack;
    output a,b, en;
  endclocking
  
  modport TB (clocking cb, input clk, reset);
  modport RTL (input clk, reset, a,b, en, output out, ack);
  
endinterface

module clk_blk_tb;
  bit clk;
  bit reset;
  
  always #2 clk = ~clk;
  
  initial begin
    clk = 0;
    reset = 1;
    #2;
    reset = 0;
  end 
  mult_if inf(clk, reset);
  multiplier DUT(inf);
  
  `define TB_IF inf.TB.cb
   
  initial begin
    #5;
    `TB_IF.a <= 'd5; `TB_IF.b <= 'd6;    
    `TB_IF.en <= 1;
    #10 `TB_IF.en <= 0;
    wait(`TB_IF.ack);
    $display("time = %0t: a=%d b=%d, out=%d", $time, inf.a,inf.b,inf.out);
    
    #25;
    `TB_IF.a <= 'd20; `TB_IF.b <= 'd7;
    #5ns `TB_IF.en <= 1;
    #6 `TB_IF.en <= 0;
    wait(`TB_IF.ack);
    $display("time = %0t: a=%d b=%d, out=%d", $time, inf.a,inf.b,inf.out);
    
    #25;
    `TB_IF.a <= 'd10; `TB_IF.b <= 'd4;
    #6ns `TB_IF.en <= 1;
    #5 `TB_IF.en <= 0;
    wait(`TB_IF.ack);
    $display("time = %0t: a=%d b=%d, out=%d", $time, inf.a,inf.b,inf.out);

    #10;
    $finish;
  end
  endmodule
