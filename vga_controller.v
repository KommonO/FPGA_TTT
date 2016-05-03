//This will be the module that displays items to the screen
//Spartan 3E Starter Board
//Written by:Kommon Ousley
//refer to the user guide for initialization parameters
//UCF values
//H14 - VGA_RED
//H15 - VGA_GREEN
//G15 - VGA_BLUE
//F15 - VGA_HSYNC
//F14 - VGA_VSYNC

//NEED TO DESIGN AN INPUT
//KERYBOARD
//BEGINNER:ARROWS AND ENTER
//INTERMEDIATE:ARROWS ENTER X, O
//ADVANCED:ARROWS ENTER ANY CHARACTER
//Will also need tp set several count values for the different timers, refer to the washer machinr timers
//NET 	"RD"			LOC = "H14"	| IOSTANDARD = LVTTL | DRIVE = 8 | SLEW = FAST;
//NET 	"GR"			LOC = "H15"	| IOSTANDARD = LVTTL | DRIVE = 8 | SLEW = FAST;
//NET 	"BL"			LOC = "G15"	| IOSTANDARD = LVTTL | DRIVE = 8 | SLEW = FAST;
//NET 	"HS"			LOC = "F15"	| IOSTANDARD = LVTTL | DRIVE = 8 | SLEW = FAST;
//NET 	"VS"			LOC = "F14"	| IOSTANDARD = LVTTL | DRIVE = 8 | SLEW = FAST;

module vga_controller(input BTN0, CCLK , output  reg VGA_RED, VGA_GREEN, VGA_BLUE, VGA_HSYNC, VGA_VSYNC);
//counters are found in thr vga_timer
wire clk_50mhz, hsync_out,vsync_out,vga_on;
wire [10:0] Pixel_X;
wire [10:0] Pixel_Y;

assign hsync = ~hsync_out;
assign vsync = ~vsync_out;


//processes
always @(posedge CCLK or posedge BTN0) begin
  //If reset,colors set to 0 to print out black.correct?
  if(BTN0) begin
    VGA_RED <=1'b0;
    VGA_BLUE <=1'b0;
    VGA_GREEN <=1'b0;
  end

  else if(vga_on) begin
    VGA_RED <= 1;//TicTacToeR;
    VGA_BLUE <=1;//TicTacToeB;
    VGA_GREEN <= 1;//TicTacToeG;
  end
  //else if video is not on screen should be black
  else begin
    VGA_RED = 1'b0;
    VGA_BLUE = 1'b0;
    VGA_GREEN = 1'b0;
  end
end


//initialize other modules
vga_timer vga_timer(.mclk(clk_50mz), .clr(BTN0),.hsync(hsync_out), .vsync(vsync_out),.Pixel_X(Pixel_X), .Pixel_Y(Pixel_Y), .vga_on(vga_on));

//ttt_logic ttt_logic();
//ASCCII TRANSLATE






endmodule 