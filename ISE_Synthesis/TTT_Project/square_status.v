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

//maybe this is where my inputs from the keyboard will go.!!!
// Depending on the input it will change the status of the square here,
// so add 9 inputs from the keyboard

module square_status(input clk, clr, key_1, key_2, key_3, key_4, key_5, key_6, key_7, key_8, key_9, 
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
//registers of square status'
reg square_1_status_reg,
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
	else if (1) begin
	
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
