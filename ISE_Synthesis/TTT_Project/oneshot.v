`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:07 05/06/2016 
// Design Name: 
// Module Name:    oneshot 
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
module oneshot(input oneshot_in, clk, rst, output wire oneshot_out);
reg oneshot_q;
always @ (posedge clk) begin
  if (rst)
    oneshot_q <= 0;
  else
    oneshot_q <= oneshot_in;
  
end
assign oneshot_out = ~oneshot_q && oneshot_in;



endmodule

