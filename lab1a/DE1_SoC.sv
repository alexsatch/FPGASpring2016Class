// Top-level module that defines the I/Os for the DE-1 SoC board
// [3:0] KEY - 4x pushbuttons at the front right
// [9:0] SW  - 10x sliders at the front left
// [6:0] HEX5-HEX0 - 6x 7-segment displays
// [9:0] LEDR - 10x red LED just above the slidersz

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	
	mux2_1 m (.out(LEDR[0]), .i0(SW[0]), .i1(SW[1]), .sel(SW[9]));
	
	assign HEX0 = '1;
	assign HEX1 = '1;
	assign HEX2 = '1;
	assign HEX3 = '1;
	assign HEX4 = '1;
	assign HEX5 = '1;
endmodule
