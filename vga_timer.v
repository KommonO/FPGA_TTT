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
	output hsync,vsync, 
	output reg [10:0] Pixel_X, Pixel_Y );


//Counter values set as parameters
//Horizontal Parameters
//We are using a down counter so these values are a countdown value from the total 1040
parameter TOTAL_HORIZONTAL = 11'd1040,	//May need to be 1042
	  HORIZONTAL_PW    = 11'd120, 	//Minimum may need to be 116 or something like that
	  HORIZONTAL_FP    = 11'd984,
	  HORIZONTAL_BP	   = 11'd184;
//Vertical Parameters
parameter TOTAL_VERTICAL   = 11'd666,
          VERTICAL_PW    = 11'd6, 	//Minimum may need to be 116 or something like that
	  VERTICAL_FP    = 11'd643,
	  VERTICAL_BP	   = 11'd43;
	
	  
reg vertical_sync_en;	//VerticalSyncEnable

//Registers to hould count values for the horizontal and vertical lines
reg [10:0] HorizontalCount;
reg [10:0] VeritcalCount;




//Need to change names and values and erase Tw most likely

assign Ts = (HorizontalCount >= 5);
   assign Tdisp =5;
   assign Tpw =5;
   assign Tfp = 5;
   assign Tbp = 5;

endmodule