`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:35:42 05/09/2016 
// Design Name: 
// Module Name:    winner 
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
module winner(input clr, clk, input [1:0] square_1_status,
			square_2_status,
			square_3_status,
			square_4_status,
			square_5_status,
			square_6_status,
			square_7_status,
			square_8_status,
			square_9_status,
			output player_win,
			player_1_win,
			player_2_win
    );
	
	
	wire [5:0]column_1, column_2,  column_3, row_1, row_2, row_3, diag_1, diag_2;
	
	//concatonate signals to go inside
	//columns
	assign column_1 = {square_1_status,square_4_status, square_7_status};
	assign column_2 = {square_2_status, square_5_status, square_8_status};
	assign column_3 = {square_3_status, square_6_status, square_9_status};
	//rows 
	assign row_1 = {square_1_status,square_2_status,square_3_status};
	assign row_2 = {square_4_status,square_5_status,square_6_status};
	assign row_3 = {square_7_status,square_8_status,square_9_status};
	
	assign diag_1 = {square_1_status,square_5_status,square_9_status};
	assign diag_2 = {square_3_status,square_5_status,square_7_status};
	
	assign player_win = player_win_reg;
	reg player_win_reg, player_1_win_reg, player_2_win_reg;
	always @* begin
		player_win_reg = 1'b0;
	if(clr) begin
		player_win_reg = 1'b0;
	end//end clr state
	else begin
		//if columns is all 1 or the other
		if((column_1 == 6'b010101) || (column_1 == 6'b101010)) begin
		player_win_reg = 1'b1;
		end
		else if((column_2 == 6'b010101) || (column_2 == 6'b101010)) begin
		player_win_reg = 1'b1;
		end
		else if((column_3 == 6'b010101) || (column_3 == 6'b101010)) begin
		player_win_reg = 1'b1;
		end
		//rows
		else if((row_1 == 6'b010101) || (row_1 == 6'b101010)) begin
		player_win_reg = 1'b1;
		end
		else if((row_2 == 6'b010101) || (row_2 == 6'b101010)) begin
		player_win_reg = 1'b1;
		end
		else if((row_3 == 6'b010101) || (row_3 == 6'b101010)) begin
		player_win_reg = 1'b1;
		end
		//diagnols
		else if((diag_1 == 6'b010101) || (diag_1 == 6'b101010)) begin
		player_win_reg = 1'b1;
		end
		else if((diag_2 == 6'b010101) || (diag_2 == 6'b101010)) begin
		player_win_reg = 1'b1;
		end
	end
	end //end main always


endmodule
