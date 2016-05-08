`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:24:25 05/07/2016 
// Design Name: 
// Module Name:    square_status 
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

//
// Depending on the input it will change the status of the square here,
//8 but input rot_ctr, is the square_num from ttt_logic, that, along with the rot_ctr to display when it is selected
//
module square_status(input clk, clr, rot_ctr,player_turn, input wire [7:0]square_num,  
	output [2:0] square_1_status,
	square_2_status,
	square_3_status,
	square_4_status,
	square_5_status,
	square_6_status,
	square_7_status,
	square_8_status,
	square_9_status
    );
	 
	 
	 //Parameters for the square selected Case statement
	 parameter SQUARE1_SELECTED = 8'd1,
				  SQUARE2_SELECTED = 8'd2,
				  SQUARE3_SELECTED = 8'd3,
				  SQUARE4_SELECTED = 8'd4,
				  SQUARE5_SELECTED = 8'd5,
				  SQUARE6_SELECTED = 8'd6,
				  SQUARE7_SELECTED = 8'd7,
				  SQUARE8_SELECTED = 8'd8,
				  SQUARE9_SELECTED = 8'd9;
	 //parameters for the square status
	 parameter BLANK = 2'b00,
				  MARKER_O = 2'b01,
				  MARKER_X = 2'b10;
	 //parameter to determine who's turn it is
	 parameter PLAYER_1 = 1'b0,
				  PLAYER_2 = 1'b1; 
	 
	 
	 //registers
	 
	 reg [7:0] square_selected;
   //registers of square status'
reg [2:0] square_1_status_reg,
	square_2_status_reg,
	square_3_status_reg,
	square_4_status_reg,
	square_5_status_reg,
	square_6_status_reg,
	square_7_status_reg,
	square_8_status_reg,
	square_9_status_reg;
	
	always @(clk or clr) begin
	//reset the squares to blank, 
	if(clr) begin
		square_1_status_reg = 1'b0;
		square_2_status_reg = 1'b0;
		square_3_status_reg = 1'b0;
		square_4_status_reg = 1'b0;
		square_5_status_reg = 1'b0;
		square_6_status_reg = 1'b0;
		square_7_status_reg = 1'b0;
		square_8_status_reg = 1'b0;
		square_9_status_reg = 1'b0;
	end//end clr if statement
	//else if the rotary button is pressed, 
	else if (rot_ctr) begin
	 square_selected = square_num;
	 //case to handle which square is selected and the status
	 case(square_selected) 
	 SQUARE1_SELECTED: begin
		//if statement to determine if it is empty, only need if statement because if not blank, do nothing
		if(square_1_status == BLANK)begin
			//another if statement to determine who's turn it is
			//0 equals player 1 and 1 equals player 2
			if(player_turn == PLAYER_1) begin
				//player1's turn so need to mark the space as an x.
				square_1_status_reg = 2'd1; 
				//maybe add a "end_turn" register here to show it is the next player's turn
			end
			else if(player_turn == PLAYER_2) begin
				//player 2's turn so need to mark the space as an o. 2'b10 = 2'd2
				square_1_status_reg = 2'd2;
			end
		end
		
	 end
	 
	 SQUARE2_SELECTED: begin
	 		//if statement to determine if it is empty, only need if statement because if not blank, do nothing
		if(square_2_status == BLANK)begin
			//another if statement to determine who's turn it is
			//0 equals player 1 and 1 equals player 2
			if(player_turn == PLAYER_1) begin
				//player1's turn so need to mark the space as an x.
				square_2_status_reg = 2'd1; 
				//maybe add a "end_turn" register here to show it is the next player's turn
			end
			else if(player_turn == PLAYER_2) begin
				//player 2's turn so need to mark the space as an o. 2'b10 = 2'd2
				square_2_status_reg = 2'd2;
			end
		end
	 end
	 
	 SQUARE3_SELECTED: begin
	 		//if statement to determine if it is empty, only need if statement because if not blank, do nothing
		if(square_3_status == BLANK)begin
			//another if statement to determine who's turn it is
			//0 equals player 1 and 1 equals player 2
			if(player_turn == PLAYER_1) begin
				//player1's turn so need to mark the space as an x.
				square_3_status_reg = 2'd1; 
				//maybe add a "end_turn" register here to show it is the next player's turn
			end
			else if(player_turn == PLAYER_2) begin
				//player 2's turn so need to mark the space as an o. 2'b10 = 2'd2
				square_3_status_reg = 2'd2;
			end
		end
	 end
	 
	 SQUARE4_SELECTED: begin
	 		//if statement to determine if it is empty, only need if statement because if not blank, do nothing
		if(square_4_status == BLANK)begin
			//another if statement to determine who's turn it is
			//0 equals player 1 and 1 equals player 2
			if(player_turn == PLAYER_1) begin
				//player1's turn so need to mark the space as an x.
				square_4_status_reg = 2'd1; 
				//maybe add a "end_turn" register here to show it is the next player's turn
			end
			else if(player_turn == PLAYER_2) begin
				//player 2's turn so need to mark the space as an o. 2'b10 = 2'd2
				square_4_status_reg = 2'd2;
			end
		end
	 end
	 
	 //Square 5
	 SQUARE5_SELECTED: begin
	 		//if statement to determine if it is empty, only need if statement because if not blank, do nothing
		if(square_5_status == BLANK)begin
			//another if statement to determine who's turn it is
			//0 equals player 1 and 1 equals player 2
			if(player_turn == PLAYER_1) begin
				//player1's turn so need to mark the space as an x.
				square_5_status_reg = 2'd1; 
				//maybe add a "end_turn" register here to show it is the next player's turn
			end
			else if(player_turn == PLAYER_2) begin
				//player 2's turn so need to mark the space as an o. 2'b10 = 2'd2
				square_5_status_reg = 2'd2;
			end
		end
	 end
	 
	 //Square 6
	 SQUARE6_SELECTED: begin
	 		//if statement to determine if it is empty, only need if statement because if not blank, do nothing
		if(square_6_status == BLANK)begin
			//another if statement to determine who's turn it is
			//0 equals player 1 and 1 equals player 2
			if(player_turn == PLAYER_1) begin
				//player1's turn so need to mark the space as an x.
				square_6_status_reg = 2'd1; 
				//maybe add a "end_turn" register here to show it is the next player's turn
			end
			else if(player_turn == PLAYER_2) begin
				//player 2's turn so need to mark the space as an o. 2'b10 = 2'd2
				square_6_status_reg = 2'd2;
			end
		end
	 end
	 
	 //Square 7
	 SQUARE7_SELECTED: begin
	 		//if statement to determine if it is empty, only need if statement because if not blank, do nothing
		if(square_7_status == BLANK)begin
			//another if statement to determine who's turn it is
			//0 equals player 1 and 1 equals player 2
			if(player_turn == PLAYER_1) begin
				//player1's turn so need to mark the space as an x.
				square_7_status_reg = 2'd1; 
				//maybe add a "end_turn" register here to show it is the next player's turn
			end
			else if(player_turn == PLAYER_2) begin
				//player 2's turn so need to mark the space as an o. 2'b10 = 2'd2
				square_7_status_reg = 2'd2;
			end
		end
	 end
	 
	 //Square 8
	 SQUARE8_SELECTED: begin
	 		//if statement to determine if it is empty, only need if statement because if not blank, do nothing
		if(square_8_status == BLANK)begin
			//another if statement to determine who's turn it is
			//0 equals player 1 and 1 equals player 2
			if(player_turn == PLAYER_1) begin
				//player1's turn so need to mark the space as an x.
				square_8_status_reg = 2'd1; 
				//maybe add a "end_turn" register here to show it is the next player's turn
			end
			else if(player_turn == PLAYER_2) begin
				//player 2's turn so need to mark the space as an o. 2'b10 = 2'd2
				square_8_status_reg = 2'd2;
			end
		end
	 end
	 
	 //Square 9
	 SQUARE9_SELECTED: begin
	 		//if statement to determine if it is empty, only need if statement because if not blank, do nothing
		if(square_9_status == BLANK)begin
			//another if statement to determine who's turn it is
			//0 equals player 1 and 1 equals player 2
			if(player_turn == PLAYER_1) begin
				//player1's turn so need to mark the space as an x.
				square_9_status_reg = 2'd1; 
				//maybe add a "end_turn" register here to show it is the next player's turn
			end
			else if(player_turn == PLAYER_2) begin
				//player 2's turn so need to mark the space as an o. 2'b10 = 2'd2
				square_9_status_reg = 2'd2;
			end
		end
	 end
	 
	 //default case here
	 
	 endcase 
	end
	end
	
	
	//assign output wires to the internal registers
	assign square_1_status = square_1_status_reg;
	assign square_2_status = square_2_status_reg;
	assign square_3_status = square_3_status_reg;
	assign square_4_status = square_4_status_reg;
	assign square_5_status = square_5_status_reg;
	assign square_6_status = square_6_status_reg;
	assign square_7_status = square_7_status_reg;
	assign square_8_status = square_8_status_reg;
	assign square_9_status = square_9_status_reg;

endmodule
