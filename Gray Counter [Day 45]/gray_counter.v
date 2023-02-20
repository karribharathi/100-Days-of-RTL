`timescale 1ns/1ps
module gray_decoder_4bit(
input [3:0] gray_in,
output [3:0] bin_out);

assign bin_out[3] = gray_in[3];
assign bin_out[2] = bin_out[3] ^ gray_in[2];
assign bin_out[1] = bin_out[2] ^ gray_in[1];
assign bin_out[0] = bin_out[1] ^ gray_in[0];
endmodule

module gray_encoder_4bit(
input [3:0] bin_in,
output [3:0] gray_out);

assign gray_out[3] = bin_in[3];
assign gray_out[2] = bin_in[2] ^ bin_in[3];
assign gray_out[1] = bin_in[1] ^ bin_in[2];
assign gray_out[0] = bin_in[0] ^ bin_in[1];
endmodule

module gray_counter(
input clk,
input reset_n,
output reg [3:0] gray_counter_out);

wire [3:0] bin_out;
wire [3:0] bin_in;
wire [3:0] next_gray_code;

gray_decoder_4bit d1(.gray_in(gray_counter_out),.bin_out(bin_out));
assign bin_in = bin_out+1'b1;

gray_encoder_4bit d2(.bin_in(bin_in),.gray_out(next_gray_code));

always @(posedge clk or negedge reset_n)
if(!reset_n)
gray_counter_out<=4'b0;
else
gray_counter_out<=next_gray_code;
endmodule


