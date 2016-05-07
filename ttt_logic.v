//Logic to handle the tic tac toe game for my final
//project in Rapid Prototyping with FPGAs
//Engineer: Kommon Ousley
//Date Started: 4/30/2016
//Inputs(May attempt to use the PS/2 Keyboard)
//
//Outputs
//player_1_win:1 bit wire
//player_2_win:1 bit wire
//
module ttt_logic(input clk, clr, vga_on, Pixel_X, Pixel_Y,  output wire vga_red, vga_blue, vga_green/*, player_1_win,player_2_win*/);

//wires
wire [9:0] Pixel_X;
wire [8:0] Pixel_Y;
/*wire player1_turn, player2_turn;
wire enter;//also known as select depending on keyboard use or button use


//parameters
parameter 

	IDLE = ,	//IDLE state means that the screen is black
	START = ,	//Here we will also print the starting board 
	PLAYER1_MOVE = ,//takes in player 1's move, prints the new board, it is now player 2's turn
	PLAYER2_MOVE = ,//if it is player 2's turn in 

*/

reg vga_red_reg, vga_blue_reg, vga_green_reg;
parameter LINE_WIDTH_MAX = 3'd3;
//test block to assign values
always @( clk or  clr or vga_on or Pixel_X or Pixel_Y) begin
   //test to make screen green
	if(vga_on) begin
		if((Pixel_X >= 212) && (Pixel_X <= 214) || (Pixel_X >= 425) &&(Pixel_X <= 427) ||(Pixel_Y >= 132) && (Pixel_Y <= 134) || (Pixel_Y >= 265)&&(Pixel_Y <= 267) ) begin
		vga_red_reg <= 1'b0;
		vga_blue_reg <= 1'b0;
		vga_green_reg <= 1'b0;
		end
		else begin
		vga_red_reg <= 1'b0;//0
		vga_blue_reg <= 1'b1;//1
		vga_green_reg <= 1'b1;//1
	   end
	end
	else begin
	vga_red_reg <= 1'b0;
	vga_blue_reg <= 1'b0;
	vga_green_reg <= 1'b0;
	end

end



assign vga_red = vga_red_reg;
assign vga_blue = vga_blue_reg;
assign vga_green = vga_green_reg;
//process to handle the width of lines

//clock process



//instantiate module to decide who's turn it is and their player marker
turn_marker turn_marker();


//ASCII TEXT



endmodule
