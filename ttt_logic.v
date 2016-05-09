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
module ttt_logic(input clk, clr, vga_on, Pixel_X, Pixel_Y,ROTCTR_debounce, input wire [7:0] square_num,  output wire vga_red, vga_blue, vga_green, player_turn/*, player_1_win,player_2_win*/);

//wires
wire [9:0] Pixel_X;
wire [8:0] Pixel_Y;

//Simply to test the square_status module
//wire player_turn;
parameter PLAYER_1 = 1'b0,
			 Player_2 = 1'b1;
//assign player_turn = PLAYER_1; //Assign player_turn as player 1
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

//register to hold the pixel coordinates for the rotary switch

reg [9:0] pixel_x_fill;
reg [8:0] pixel_y_fill;
//process that decides what block its in
always @*/*(clk or clr or vga_on or Pixel_X or Pixel_Y or square_num)*/ begin
	if(vga_on) begin
		//defaults

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
end//end always 

reg vga_red_reg, vga_blue_reg, vga_green_reg;
parameter LINE_WIDTH_MAX = 3'd3;
//test block to assign values
//try changing <= to = 
always @*/*( clk or  clr or vga_on or Pixel_X or Pixel_Y or square_num or cursor_start_x or cursor_start_y)*/ begin
   
	if(vga_on) begin
		//code for whole screen criss cross
		//if((Pixel_X >= 212) && (Pixel_X <= 214) || (Pixel_X >= 425) &&(Pixel_X <= 427) ||(Pixel_Y >= 132) && (Pixel_Y <= 134) || (Pixel_Y >= 265)&&(Pixel_Y <= 267) ) begin
		//code for top left criss cross board
		if(((Pixel_X >=0) && (Pixel_X <= 300) && ((Pixel_Y == 100) ||(Pixel_Y == 200))) || ((Pixel_Y >=0) && (Pixel_Y <= 300) && ((Pixel_X == 100) ||(Pixel_X == 200)))) begin
		vga_red_reg <= 1'b0;
		vga_blue_reg <= 1'b0;
		vga_green_reg <= 1'b0;
		end
		//else if to show the cursor, the square the cursor is currently highlighting
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
		
		case(square_1_status)
		2'b00:begin
			if(((Pixel_X >=25) && (Pixel_X <= 75)) && ((Pixel_Y >= 25) && (Pixel_Y <= 75))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b1;
			end
		end
		2'b01: begin
			if(((Pixel_X >=25) && (Pixel_X <= 75)) && ((Pixel_Y >= 25) && (Pixel_Y <= 75))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b0;
			end
		end
		2'b10: begin
			if(((Pixel_X >=25) && (Pixel_X <= 75)) && ((Pixel_Y >= 25) && (Pixel_Y <= 75))) begin
				vga_red_reg <= 1'b1;
				vga_green_reg <= 1'b0;
				vga_blue_reg <= 1'b0;
			end
		end
		endcase //end case statement for square 1
		
		case(square_2_status)
		2'b00:begin
			if(((Pixel_X >=125) && (Pixel_X <= 175)) && ((Pixel_Y >= 25) && (Pixel_Y <= 75))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b1;
			end
		end
		2'b01: begin
			if(((Pixel_X >=125) && (Pixel_X <= 175)) && ((Pixel_Y >= 25) && (Pixel_Y <= 75))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b0;
			end
		end
		2'b10: begin
			if(((Pixel_X >=125) && (Pixel_X <= 175)) && ((Pixel_Y >= 25) && (Pixel_Y <= 75))) begin
				vga_red_reg <= 1'b1;
				vga_green_reg <= 1'b0;
				vga_blue_reg <= 1'b0;
			end
		end
		endcase //end case statement for square 2
		case(square_3_status)
		2'b00:begin
			if(((Pixel_X >=225) && (Pixel_X <= 275)) && ((Pixel_Y >= 25) && (Pixel_Y <= 75))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b1;
			end
		end
		2'b01: begin
			if(((Pixel_X >=225) && (Pixel_X <= 275)) && ((Pixel_Y >= 25) && (Pixel_Y <= 75))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b0;
			end
		end
		2'b10: begin
			if(((Pixel_X >=225) && (Pixel_X <= 275)) && ((Pixel_Y >= 25) && (Pixel_Y <= 75))) begin
				vga_red_reg <= 1'b1;
				vga_green_reg <= 1'b0;
				vga_blue_reg <= 1'b0;
			end
		end
		endcase //end case statement for square 3
		
		case(square_4_status)
		2'b00:begin
			if(((Pixel_X >=25) && (Pixel_X <= 75)) && ((Pixel_Y >= 125) && (Pixel_Y <= 175))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b1;
			end
		end
		2'b01: begin
			if(((Pixel_X >=25) && (Pixel_X <= 75)) && ((Pixel_Y >= 125) && (Pixel_Y <= 175))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b0;
			end
		end
		2'b10: begin
			if(((Pixel_X >=25) && (Pixel_X <= 75)) && ((Pixel_Y >= 125) && (Pixel_Y <= 175))) begin
				vga_red_reg <= 1'b1;
				vga_green_reg <= 1'b0;
				vga_blue_reg <= 1'b0;
			end
		end
		endcase //end case statement for square 4
		
		case(square_5_status)
		2'b00:begin
			if(((Pixel_X >=125) && (Pixel_X <= 175)) && ((Pixel_Y >= 125) && (Pixel_Y <= 175))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b1;
			end
		end
		2'b01: begin
			if(((Pixel_X >=125) && (Pixel_X <= 175)) && ((Pixel_Y >= 125) && (Pixel_Y <= 175))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b0;
			end
		end
		2'b10: begin
			if(((Pixel_X >=125) && (Pixel_X <= 175)) && ((Pixel_Y >= 125) && (Pixel_Y <= 175))) begin
				vga_red_reg <= 1'b1;
				vga_green_reg <= 1'b0;
				vga_blue_reg <= 1'b0;
			end
		end
		endcase //end case statement for square 5
		
		case(square_6_status)
		2'b00:begin
			if(((Pixel_X >=225) && (Pixel_X <= 275)) && ((Pixel_Y >= 125) && (Pixel_Y <= 175))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b1;
			end
		end
		2'b01: begin
			if(((Pixel_X >=225) && (Pixel_X <= 275)) && ((Pixel_Y >= 125) && (Pixel_Y <= 175))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b0;
			end
		end
		2'b10: begin
			if(((Pixel_X >=225) && (Pixel_X <= 275)) && ((Pixel_Y >= 125) && (Pixel_Y <= 175))) begin
				vga_red_reg <= 1'b1;
				vga_green_reg <= 1'b0;
				vga_blue_reg <= 1'b0;
			end
		end
		endcase //end case statement for square 6
		
		case(square_7_status)
		2'b00:begin
			if(((Pixel_X >=25) && (Pixel_X <= 75)) && ((Pixel_Y >= 225) && (Pixel_Y <= 275))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b1;
			end
		end
		2'b01: begin
			if(((Pixel_X >=25) && (Pixel_X <= 75)) && ((Pixel_Y >= 225) && (Pixel_Y <= 275))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b0;
			end
		end
		2'b10: begin
			if(((Pixel_X >=25) && (Pixel_X <= 75)) && ((Pixel_Y >= 225) && (Pixel_Y <= 275))) begin
				vga_red_reg <= 1'b1;
				vga_green_reg <= 1'b0;
				vga_blue_reg <= 1'b0;
			end
		end
		endcase //end case statement for square 7
		
		case(square_8_status)
		2'b00:begin
			if(((Pixel_X >=125) && (Pixel_X <= 175)) && ((Pixel_Y >= 225) && (Pixel_Y <= 275))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b1;
			end
		end
		2'b01: begin
			if(((Pixel_X >=125) && (Pixel_X <= 175)) && ((Pixel_Y >= 225) && (Pixel_Y <= 275))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b0;
			end
		end
		2'b10: begin
			if(((Pixel_X >=125) && (Pixel_X <= 175)) && ((Pixel_Y >= 225) && (Pixel_Y <= 275))) begin
				vga_red_reg <= 1'b1;
				vga_green_reg <= 1'b0;
				vga_blue_reg <= 1'b0;
			end
		end
		endcase //end case statement for square 8
		
		case(square_9_status)
		2'b00:begin
			if(((Pixel_X >=225) && (Pixel_X <= 275)) && ((Pixel_Y >= 225) && (Pixel_Y <= 275))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b1;
			end
		end
		2'b01: begin
			if(((Pixel_X >=225) && (Pixel_X <= 275)) && ((Pixel_Y >= 225) && (Pixel_Y <= 275))) begin
				vga_red_reg <= 1'b0;
				vga_green_reg <= 1'b1;
				vga_blue_reg <= 1'b0;
			end
		end
		2'b10: begin
			if(((Pixel_X >=225) && (Pixel_X <= 275)) && ((Pixel_Y >= 225) && (Pixel_Y <= 275))) begin
				vga_red_reg <= 1'b1;
				vga_green_reg <= 1'b0;
				vga_blue_reg <= 1'b0;
			end
		end
		endcase //end case statement for square 9
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
turn_marker turn_marker(.clk(clk), .clr(clr),.player_turn(player_turn), .enter(ROTCTR_debounce));
square_status square_status(
			.square_num(square_num),
			.player_turn(player_turn),	//
			.rot_ctr(ROTCTR_debounce),//,make sure this is right
			//Passing squares status' to determine what goes to each square
			.square_1_status(square_1_status),
			.square_2_status(square_2_status),
			.square_3_status(square_3_status),
			.square_4_status(square_4_status),
			.square_5_status(square_5_status),
			.square_6_status(square_6_status),
			.square_7_status(square_7_status),
			.square_8_status(square_8_status),
			.square_9_status(square_9_status));

//ASCII TEXT



endmodule
