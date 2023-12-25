class abc;
  rand bit[3:0]a;
  int queue[$:5];
  
  constraint npo {!(a inside {queue});}
  
  function void post_randomize();
    queue.push_front(a);
    $display("value of a = %d \n",a);
    if(queue.size == 4)
      queue.pop_back();
    $display("Prev_occurences = %0p",queue);
  endfunction
endclass

module not_prev;
  abc h1;
  initial
  begin
    h1 = new();
    repeat(15) begin
      h1.randomize();
    end
  end
endmodule

  
