//this will handle the timing restrictions aa required and stated in the user manual
//will be using the washer machine timer as a reference

//TS (Sync Pulse Time)
//  Vertical: Time- Clocks- Lines-
//  Horizontal: Time- Clocks-

//TDISP (Display Time)
//  Vertical: Time- Clocks- Lines-
//  Horizontal: Time- Clocks-

//TPW (Pulse Width)
//  Vertical: Time- Clocks- Lines-
//  Horizontal: Time- Clocks-

//TFP (Front Porch)
//  Vertical: Time- Clocks- Lines- 
//  Horizontal: Time- Clocks- 

//TBP (Back Porch)
//  Vertical: Time- Clocks- Lines-
//  Horizontal: Time- Clocks-

module vga_timer(input wire mclk, clr,
	output reg hsync,vsync, 
	output reg [10:0] Pixel_X, Pixel_Y,
	output reg vga_on);


//Counter values set as parameters
//Horizontal Parameters
//We are using a down counter so these values are a countdown value from the total 1040
/*parameter TOTAL_HORIZONTAL = 11'd1040,	//May need to be 1042
	  HORIZONTAL_PW    = 11'd120, 	//Minimum may need to be 116 or something like that, HorizontalSyncWidth
	  HORIZONTAL_FP    = 11'd984,
	  HORIZONTAL_BP	   = 11'd184;
//Vertical Parameters
parameter TOTAL_VERTICAL   = 11'd666,
          VERTICAL_PW    = 11'd6, 	//Minimum may need to be 116 or something like that
	  VERTICAL_FP    = 11'd643,
	  VERTICAL_BP	   = 11'd43;*/
	
parameter TOTAL_HORIZONTAL = 11'd743,	//56 clocks after the FP
	  HORIZONTAL_PW    = 11'd95, 	//Minimum may need to be 116 or something like that, HorizontalSyncWidth
	  HORIZONTAL_FP    = 11'd687,
	  HORIZONTAL_BP	   = 11'd47;
//Vertical Parameters
parameter TOTAL_VERTICAL   = 11'd546,
          VERTICAL_PW    = 11'd1, 	//Minimum may need to be 116 or something like that
			VERTICAL_FP    = 11'd523,
			VERTICAL_BP	   = 11'd43;
	  
reg vertical_sync_en;	//VerticalSyncEnable

//Registers to hould count values for the horizontal and vertical lines
reg [10:0] HorizontalCount;
reg [10:0] VerticalCount;


//Counter for the horizontal sync signal
always @(posedge mclk) begin
	if(clr)
		HorizontalCount <= 0;
	else begin
		if(HorizontalCount == TOTAL_HORIZONTAL - 1) begin //counter has reached end of horizontal line
			HorizontalCount <= 0;
			vertical_sync_en <=0;
		end
		else begin
			HorizontalCount <= HorizontalCount + 1;
			vertical_sync_en <= 0;	
		end
	end
end

//Counter for the Vertical sync signal
always @ (posedge mclk) begin
	if(clr)
		VerticalCount <= 0;
	else begin
		if(vertical_sync_en) begin
			if(VerticalCount == TOTAL_VERTICAL -1)
				VerticalCount <= 0;
			else
				VerticalCount <= VerticalCount + 1; 
		end
	end
end




//Generate the hsync pulse
//Horizontal sync is low when horizontal counter is 0-127
always @* begin
	if((HorizontalCount < HORIZONTAL_PW))
		hsync <= 1;
	else begin
		hsync <= 0;
			
	end
end

always @* begin
	if (VerticalCount < VERTICAL_PW)
		vsync<= 1;
	else
		vsync<= 0;
end
//process to handle the pixel location
always @(posedge mclk)begin
	if((HorizontalCount < HORIZONTAL_FP) && (HorizontalCount > HORIZONTAL_BP) && (VerticalCount < VERTICAL_FP) && (VerticalCount > VERTICAL_BP)) begin
		vga_on <= 1;
		Pixel_X <= HorizontalCount - HORIZONTAL_BP;
		Pixel_Y <= VerticalCount - VERTICAL_BP;
	end
	else begin
		vga_on <=  0;
		Pixel_X <= 0;
		Pixel_Y <= 0;
	end
end


endmodule 