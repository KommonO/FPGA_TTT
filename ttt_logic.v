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
module ttt_logic(input clk, clr, vga_on, Pixel_X, Pixel_Y, input wire [7:0] square_num, ROTCTR_debounce,  output wire vga_red, vga_blue, vga_green/*, player_1_win,player_2_win*/);

//wires
wire [9:0] Pixel_X;
wire [8:0] Pixel_Y;

//Parameters for square_num 
parameter 
			 NO_SQUARE  = 4'd0,
			 SQUARE_1	=	4'd1,
			 SQUARE_2	=	4'd2,
			 SQUARE_3	=	4'd3,
			 SQUARE_4	=	4'd4,
			 SQUARE_5	=	4'd5,
			 SQUARE_6	=	4'd6,
			 SQUARE_7	=	4'd7,
			 SQUARE_8	=	4'd8,
			 SQUARE_9	=	4'd9;



//count to produce one square and duplicate it
//98 cout max less than max starting from 0
parameter SQUARE_COUNT_MAX = 10'd98;
reg square_pcount; //square pixel counter
//counter for the process that will fill out the square   else if(square_num == 4)
always @(posedge clk or posedge clr) begin
  if(clr) begin
  square_pcount <= 0;
  end
  else if(square_pcount < SQUARE_COUNT_MAX) begin
	square_pcount <= square_pcount -1;
  end
  else 
	square_pcount <= 1'b0;
end

//process to fill out the square that will blink according to the cursor 
//variable that holds the value of X top left corner,
reg [9:0] cursor_start_x;
reg [8:0] cursor_start_y;
//variable that holds the value of Y top left corner
//process that physicall creates the cursor block color
/*always @( clk or  clr or square_num ) begin
	if (clr) begin
	vga_red_reg =1'b0;
	vga_blue_reg =1'b0;
	vga_green_reg =1'b0;
	end
	else if((Pixel_X >= cursor_start_x) && (Pixel_X <= (cursor_start_x + 50)) || (Pixel_Y >= cursor_start_y) && (Pixel_Y <= (cursor_start_y + 50))) begin
	vga_red_reg =1'b0;
	vga_blue_reg =1'b0;
	vga_green_reg =1'b0;
	end
   if 

end*/


//register to hold the pixel coordinates for the rotary switch

reg [9:0] pixel_x_fill;
reg [8:0] pixel_y_fill;
//process that decides what block its in
always @*/*(clk or clr or vga_on or Pixel_X or Pixel_Y or square_num)*/ begin
	if(vga_on) begin
		//defaults
		//cursor_start_x <= 200;
		//cursor_start_y <= 200;
		//pixel_x_fill <= 200;
		//pixel_y_fill <= 200;
		if(square_num == 2) begin
		cursor_start_x <= 100;
		cursor_start_y <= 0;
		end
		else if (square_num == 3) begin
		cursor_start_x <= 200;
		cursor_start_y <= 0;
		end
		
		
		case(square_num) 
		//case the rotary number is 1
		NO_SQUARE: begin
		cursor_start_x <= 0;
		cursor_start_y <= 0;
		end
		SQUARE_1: begin
		cursor_start_x <= 0;
		cursor_start_y <= 0;
		end
		SQUARE_2: begin
		cursor_start_x <= 100;
		cursor_start_y <= 0;
		end
		SQUARE_3: begin
		cursor_start_x <= 200;
		cursor_start_y <= 0;
		end
		SQUARE_4: begin
		cursor_start_x <= 0;
		cursor_start_y <= 100;
		end
		SQUARE_5: begin
		cursor_start_x <= 100;
		cursor_start_y <= 100;
		end
		SQUARE_6: begin
		cursor_start_x <= 200;
		cursor_start_y <= 100;
		end
		SQUARE_7: begin
		cursor_start_x <= 0;
		cursor_start_y <= 200;
		
		end
		SQUARE_8: begin
		cursor_start_x <= 100;
		cursor_start_y <= 200;
		end
		SQUARE_9:begin 
		cursor_start_x <= 200;
		cursor_start_y <= 200;
		end
		
		
		
		
		endcase
	
	
	
	end



end


/*wire player1_turn, player2_turn;
wire enter;//also known as select depending on keyboard use or button use

//98 cout max less than max starting from 0

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
//try changing <= to = 
always @*/*( clk or  clr or vga_on or Pixel_X or Pixel_Y or square_num or cursor_start_x or cursor_start_y)*/ begin
   //test to make screen green
	if(vga_on) begin
//		if((Pixel_X >= 212) && (Pixel_X <= 214) || (Pixel_X >= 425) &&(Pixel_X <= 427) ||(Pixel_Y >= 132) && (Pixel_Y <= 134) || (Pixel_Y >= 265)&&(Pixel_Y <= 267) ) begin
		if(((Pixel_X >=0) && (Pixel_X <= 300) && ((Pixel_Y == 100) ||(Pixel_Y == 200))) || ((Pixel_Y >=0) && (Pixel_Y <= 300) && ((Pixel_X == 100) ||(Pixel_X == 200)))) begin
		vga_red_reg <= 1'b0;
		vga_blue_reg <= 1'b0;
		vga_green_reg <= 1'b0;
		end
		//else if for cursor
	else if(((Pixel_X >= cursor_start_x) && (Pixel_X <= (cursor_start_x + 100))) && ((Pixel_Y >= cursor_start_y) && (Pixel_Y <= (cursor_start_y + 100)))) begin
		vga_red_reg <=1'b0;
		vga_blue_reg <=1'b0;
		vga_green_reg <=1'b0;
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
square_status square_status();

//ASCII TEXT



endmodule
