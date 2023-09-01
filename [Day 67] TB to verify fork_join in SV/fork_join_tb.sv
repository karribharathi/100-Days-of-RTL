module fork_join_tb;
initial
begin
#(10);
$display(" BEFORE fork time = %d ",$time );
fork
begin
# (20);
$display("time = %d # 20 ",$time );
end
begin
#(10);
$display("time = %d # 10 ",$time );
end
begin
#(5);
$display("time = %d # 5 ",$time );
end
join
$display(" time = %d Outside the main fork ",$time );
#(40);
end
endmodule
