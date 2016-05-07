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

module vga_controller(input BTN0, CCLK, SW0, SW1, SW2,SW3, output  wire VGA_RED, VGA_GREEN, VGA_BLUE, wire VGA_HSYNC, VGA_VSYNC);
//counters are found in thr vga_timer
wire clk_50mhz, hsync_out,vsync_out,vga_on;
wire [9:0] Pixel_X;
wire [8:0] Pixel_Y;
//wire vga_on;

assign VGA_HSYNC = ~hsync_out;
assign VGA_VSYNC = ~vsync_out;

//wires needed for synthesizing
wire [35:0] CONTROL0;
wire CLKIN_IBUFG_OUT;
wire CONTROL;

clock_divider clock_divider (
    .CLKIN_IN(CCLK),  
    .CLKDV_OUT(clk_25mhz), 
    .CLKIN_IBUFG_OUT(CLKIN_IBUFG_OUT), 
    .CLK0_OUT(), 
    .LOCKED_OUT()
    );  
	 
icon icon (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);
ila ila (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(CLKIN_IBUFG_OUT), // IN
    .TRIG0({clr, VGA_GREEN, VGA_BLUE, VGA_RED,VGA_HSYNC, VGA_VSYNC, Pixel_X[0], Pixel_Y[0]}) // IN BUS [7:0]
);


//processes
/*always @(posedge clk_25mhz or posedge clr) begin
  //If reset,colors set to 0 to print out black.correct?
  if(clr) begin
    VGA_RED <=1'b0;
    VGA_BLUE <=1'b0;
    VGA_GREEN <=1'b0;
  end

  else if(vga_on) begin
    if(SW0) begin
    VGA_RED <= 0;//TicTacToeR;
    VGA_BLUE <=0;//TicTacToeB;
    VGA_GREEN <= 1;//TicTacToeG;
	 end
	 else if(SW1) begin
	 VGA_RED <= 0;//TicTacToeR;
    VGA_BLUE <=1;//TicTacToeB;
    VGA_GREEN <= 0;//TicTacToeG;
	 
	 end
	 
	 else if(SW2) begin
    VGA_RED <= 1;//TicTacToeR;
    VGA_BLUE <=0;//TicTacToeB;
    VGA_GREEN <= 0;//TicTacToeG;	 
	 end
	 
	 else if(SW3) begin
	 VGA_RED <= 1;//TicTacToeR;
    VGA_BLUE <=1;//TicTacToeB;
    VGA_GREEN <= 0;//TicTacToeG;
	 end
	 else begin
	 VGA_RED <= 1;//TicTacToeR;
    VGA_BLUE <=1;//TicTacToeB;
    VGA_GREEN <= 1;//TicTacToeG;
	 
	 end
	 
  end
  //else if video is not on screen should be black
  else begin
    VGA_RED <= 1'b0;
    VGA_BLUE <= 1'b0;
    VGA_GREEN <= 1'b0;
  end
end
*/

//debounced
debounce debounce_rst(.clk(clk_25mhz), .rst(1'b0),.async_in(BTN0), .sync_out(clr_debounce));
//oneshotted
oneshot oneshot(.oneshot_in(clr_debounce), .rst(1'b0), .clk(clk_25mhz), .oneshot_out(clr));
//initialize other modules
vga_timer vga_timer(.Clk(clk_25mhz),/* .clr(clr),*/.vga_h_sync(hsync_out), .vga_v_sync(vsync_out),.CounterX(Pixel_X), .CounterY(Pixel_Y), .vga_on(vga_on));
ttt_logic ttt_logic(.clk(clk_25mhz), .clr(clr), .vga_on(vga_on), .Pixel_X(Pixel_X),.Pixel_Y(Pixel_Y), .vga_green(VGA_GREEN),.vga_red(VGA_RED),.vga_blue(VGA_BLUE));


//ASCCII TRANSLATE






endmodule 