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
module turn_marker(input clk, enter,clr, output player_turn, player1_marker, player2_marker
    );
	 
	 
	 //if playerx_marker = 1, marker = x
	 //if playerx_marker = 0,marker = o
	 //player_turn, 0 = player 1, 1 = player2;
	 parameter 
		PLAYER_1 = 1'b0,
		PLAYER_2 = 1'b1;
		reg [1:0] current_state, next_state;
		reg player_turn_reg, player1_marker_reg, player2_marker_reg;//for now player markers are never changed
	 always @*/*(clk or enter)*/ begin	 
	   case(current_state) 
		PLAYER_1: begin
		player_turn_reg = 1'b0;
		if(enter)
			next_state <= PLAYER_2;
		else
			next_state <= PLAYER_1;
		end//end START state
		PLAYER_2: begin
		player_turn_reg = 1'b1;
		if(enter)
			next_state <= PLAYER_1;
		else
			next_state <= PLAYER_2;
		end//end Player 2 state
		endcase
	 end
	 
	 assign player_turn = player_turn_reg;
	 always @ (posedge clk or posedge clr) begin
	 if(clr)
		current_state <= PLAYER_1;
	 else if (enter)
		current_state <= next_state;
	 end//state transition

endmodule
