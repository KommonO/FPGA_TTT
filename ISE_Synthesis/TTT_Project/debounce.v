`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:43 05/06/2016 
// Design Name: 
// Module Name:    debounce 
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
module debounce(input wire clk,rst, async_in, output reg sync_out);
  reg q_1;
  reg [14:0] count;
  
  wire count_MAX = &count;
 //15'd25001
always @ (posedge clk or posedge rst) begin
  if(rst)
    q_1 <= 1'b0;
  else
    q_1 <= async_in;
end
always @ (posedge clk or posedge rst) begin
  if(rst) begin
    sync_out <= 1'b0;
    count <= 1'b0;
  end
  else begin
    count <= count + 1'b1;
    if(count_MAX) begin
      sync_out <= q_1;
      count <= 1'b0;
    end
  end
end




endmodule 


