`timescale 1ns / 1ps
module vga_timer(Clk, vga_h_sync, vga_v_sync, vga_on, CounterX, CounterY);
input Clk;
output vga_h_sync, vga_v_sync;
output vga_on;
output [9:0] CounterX;
output [8:0] CounterY;

reg [9:0] CounterX;
reg [8:0] CounterY;
wire x_count_max = (CounterX==10'd767);

always @(posedge Clk)
if(x_count_max)
	CounterX <= 0;
else
	CounterX <= CounterX + 1;

always @(posedge Clk)
if(x_count_max) CounterY <= CounterY + 1;

reg	vga_HS, vga_VS;
always @(posedge Clk)
begin
	vga_HS <= (CounterX[9:4]==6'd45); // change this value to move the display horizontally
	vga_VS <= (CounterY==500); // change this value to move the display vertically
end

reg vga_on;
always @(posedge Clk)
if(vga_on==0)
	vga_on <= (x_count_max) && (CounterY<480);
else
	vga_on <= !(CounterX==639);
	
assign vga_h_sync = ~vga_HS;
assign vga_v_sync = ~vga_VS;

endmodule 