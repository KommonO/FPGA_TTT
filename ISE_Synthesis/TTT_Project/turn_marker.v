`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:03:47 05/07/2016 
// Design Name: 
// Module Name:    turn_marker 
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
module turn_marker(input clk, start, output player_turn, player1_marker, player2_marker
    );
	 
	 
	 //if playerx_marker = 1, marker = x
	 //if playerx_marker = 0,marker = o
	 //player_turn, 0 = player 1, 1 = player2;
	 parameter 
		START = 6'b000000;
		reg [5:0] current_state, next_state;
		reg player_turn_reg, player1_marker_reg, player2_marker_reg;//for now player markers are never changed
	 always @(clk or start) begin	 
	   case(current_state) 
		START: begin
		player_turn_reg = 0;
		
		
		end//end START state
		
		
		
		endcase
	 
	 end


endmodule
