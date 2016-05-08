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
//NET 	"VGA_RED"			LOC = "H14"	| IOSTANDARD = LVTTL | DRIVE = 8 | SLEW = FAST;
//NET 	"VGA_GREEN"			LOC = "H15"	| IOSTANDARD = LVTTL | DRIVE = 8 | SLEW = FAST;
//NET 	"VGA_BLUE"			LOC = "G15"	| IOSTANDARD = LVTTL | DRIVE = 8 | SLEW = FAST;
//NET 	"VGA_HSYNC"			LOC = "F15"	| IOSTANDARD = LVTTL | DRIVE = 8 | SLEW = FAST;
//NET 	"VGA_VSYNC"			LOC = "F14"	| IOSTANDARD = LVTTL | DRIVE = 8 | SLEW = FAST;

module vga_controller(input BTN0, CCLK, SW0, SW1, SW2,SW3,ROTA, ROTB,ROTCTR, output  wire VGA_RED, VGA_GREEN, VGA_BLUE, VGA_HSYNC, VGA_VSYNC, LD0, LD1, LD2, LD3,LD4, LD5, LD6, LD7);
//counters are found in thr vga_timer
wire  hsync_out,vsync_out,vga_on;
wire [9:0] Pixel_X;
wire [8:0] Pixel_Y;
//wire vga_on;

assign VGA_HSYNC = ~hsync_out;
assign VGA_VSYNC = ~vsync_out;

//wires needed for synthesizing
wire [35:0] CONTROL0;
wire CLKIN_IBUFG_OUT;
wire CONTROL;
wire [7:0] LED;
wire [7:0] square_num;

clock_divider clock_divider (
    .CLKIN_IN(CCLK),  
    .CLKDV_OUT(clk_25mhz), 
    .CLKIN_IBUFG_OUT(CLKIN_IBUFG_OUT), 
    .CLK0_OUT(CLK0), 
    .LOCKED_OUT()
    );  
	 
icon icon (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);
ila ila (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(CLKIN_IBUFG_OUT), // IN
    .TRIG0({square_num}) // IN BUS [7:0]
);

//debounced
debounce debounce_rst(.clk(clk_25mhz), .rst(1'b0),.async_in(BTN0), .sync_out(clr_debounce));
//oneshotted
oneshot oneshot(.oneshot_in(clr_debounce), .rst(1'b0), .clk(clk_25mhz), .oneshot_out(clr));
//initialize other modules
vga_timer vga_timer(.Clk(clk_25mhz),/* .clr(clr),*/.vga_h_sync(hsync_out), .vga_v_sync(vsync_out),.CounterX(Pixel_X), .CounterY(Pixel_Y), .vga_on(vga_on));
ttt_logic ttt_logic(.square_num(square_num),.clk(clk_25mhz), .clr(clr), .vga_on(vga_on), .Pixel_X(Pixel_X),.Pixel_Y(Pixel_Y), .vga_green(VGA_GREEN),.vga_red(VGA_RED),.vga_blue(VGA_BLUE));


//testing rotary method 2,needed to add debounce
//wire [7:0] LED;
wire ROTA_debounce, ROTB_debounce, ROTCTR_debounce;
wire rotctr, rota,rot;

rotary rotary(.C_CLK(CLK0), .ROT_A(ROTA_debounce),.ROT_B(ROTB_debounce),.ROT_CTR(ROTCTR_debounce), .LED(LED));
//debounce rotary signals may need to change CLK0 to clk_25mhz
debounce debounce_ROTA(.clk(CLK0), .rst(1'b0), .async_in(ROTA), .sync_out(ROTA_debounce));
debounce debounce_ROTB(.clk(CLK0), .rst(1'b0), .async_in(ROTB), .sync_out(ROTB_debounce));
debounce debounce_ROTCTR(.clk(CLK0),.rst(1'b0), .async_in(ROTCTR), .sync_out(ROTCTR_debounce));

//for debugging purposes, display rotary value on LEDs
assign LD0 = LED[0];
assign LD1 = LED[1];
assign LD2 = LED[2];
assign LD3 = LED[3];
assign LD4 = LED[4];
assign LD5 = LED[5];
assign LD6 = LED[6];
assign LD7 = LED[7];
//wire to transfer LED count values to the ttt_logic module for handling
wire square_num0, square_num1, square_num2, square_num3, square_num4, square_num5, square_num6, square_num7;
 assign square_num0 = LED[0];
 assign square_num1 = LED[1];
 assign square_num2 = LED[2];
 assign square_num3 = LED[3];
 assign square_num4 = LED[4];
 assign square_num5 = LED[5];
 assign square_num6 = LED[6];
 assign square_num7 = LED[7];
 //concatinates the data into one 8 bit value.
 assign square_num = {square_num7,square_num6,square_num5,square_num4, square_num3, square_num2,square_num1, square_num0};

endmodule 