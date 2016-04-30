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

module vga_controller(input mclk, rst, output VGA_RED, VGA_GREEN, VGA_BLUE, VGA_HSYNC, VGA_VSYNC);
//counters are found in thr vga_timer

//Parameter Count values
parameter PULSE_WIDTH_COUNT_MAX;

//processes
always @(posedge mclk or posedge rst) begin
  //If reset,colors set to 0 to print out black.correct?
  if(rst) begin
    VGA_RED =1'B0;
    VGA_BLUE =1'B0;
    VGA_GREEN =1'B0;
  end

  else if(video_on) begin
    VGA_RED = TicTacToeR;
    VGA_BLUE =TicTacToeB;
    VGA_GREEN = TicTacToeG;
  end
  //else if video is not on screen should be black
  else begin
    VGA_RED = 1'b0;
    VGA_BLUE = 1'b0;
    VGA_GREEN = 1'b0;
  end
end


//initialize other modules
vga_timer vga_timer();

//ASCCII TRANSLATE






endmodule 