module wait_fork_tb;

  initial begin
    $display("-----------------------------------------------------------------");
    fork
      //Process-1
      begin
        $display($time,"\tProcess-1 Started");
        #5;
        $display($time,"\tProcess-1 Finished");
      end

      //Process-2
      begin
        $display($time,"\tProcess-2 Started");
        #20;
        $display($time,"\tProcess-2 Finished");
      end
    join_any
     wait fork; //waiting for the completion of active fork threads     
    $display("-----------------------------------------------------------------");
    $finish; //ends the simulation
  end
endmodule
