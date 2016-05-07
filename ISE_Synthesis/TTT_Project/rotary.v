`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:52 05/07/2016 
// Design Name: 
// Module Name:    ROT_Ary 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rotary(input wire C_CLK, ROT_A, ROT_B, ROT_CTR,
output wire [7:0] LED);
reg [5:0] quad_count;
assign LED[3:0] = quad_count[5:2];
reg [1:0] current_state, next_state;
reg increment, decrement;
always @* begin
// Defaults
increment = 0;
decrement = 0;
next_state = current_state;
case (current_state)
2'b11: begin
if (~ROT_A) begin
next_state = 2'b01;
increment = 1;
end
else if (~ROT_B) begin
next_state = 2'b10;
decrement = 1;
end
end2'b01: begin
if (~ROT_B) begin
next_state = 2'b00;
increment = 1;
end
else if ( ROT_A) begin
next_state = 2'b11;
decrement = 1;
end
end
2'b00: begin
if (ROT_A) begin
next_state = 2'b10;
increment = 1;
end
else if (ROT_B) begin
next_state = 2'b01;
decrement = 1;
end
end2'b10: begin
if ( ROT_B) begin
next_state = 2'b11;
increment = 1;
end
else if (~ROT_A) begin
next_state = 2'b00;
decrement = 1;
end
end // 2'b10
endcase
endalways @(posedge C_CLK or posedge ROT_CTR) begin
if (ROT_CTR)
current_state <= 2'b11;
else
current_state <= next_state;
end
always @(posedge C_CLK or posedge ROT_CTR) begin
if (ROT_CTR)
quad_count <= 0;
else if (increment)
quad_count <= quad_count + 1;
else if (decrement)
quad_count <= quad_count-1;
end
endmodule 
