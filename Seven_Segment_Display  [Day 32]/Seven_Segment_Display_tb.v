module Seven_Segment_Display_tb;

    reg [3:0] in;
    wire [7:0] segment;
    integer i;

    Seven_Segment_Display dut ( .in(in),  .segment(segment));

task initialize;
    { in } = 0;
endtask

task stimulus;
begin
for(i = 0; i < 16; i = i+1) 
begin 
    { in } = i;
#10;
end     
end
endtask

initial
begin
initialize;
stimulus;
$finish();
end

initial
    $monitor("{in}=%b, {7segment}=%b", {in}, {segment});

/*initial begin
        for(i = 0;i < 16;i = i+1) 
        begin
            bcd = i; 
            #10; 
        end     
    end*/

endmodule
