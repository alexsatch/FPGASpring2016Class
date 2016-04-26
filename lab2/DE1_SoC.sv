// Top-level module that defines the I/Os for the DE-1 SoC board
// [3:0] KEY - 4x pushbuttons at the front right
// [9:0] SW  - 10x sliders at the front left
// [6:0] HEX5-HEX0 - 6x 7-segment displays
// [9:0] LEDR - 10x red LED just above the slidersz

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input  logic [3:0]  KEY;
	input  logic [9:0]   SW;
	
	logic bot, top;
	
	assign HEX0 = '1;
	assign HEX1 = '1;
	assign HEX2 = '1;
	assign HEX3 = '1;
	assign HEX4 = '1;
	assign HEX5 = '1;
	
	assign bot = (~SW[3] & SW[2] & ~SW[1] & SW[0]);
	assign top = (~SW[7] & SW[6] & SW[5] & ~SW[4]);
	
	assign LEDR[0] = top & bot;
endmodule	

module DE1_SoC_testbench();	
	logic  [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 	
	logic  [9:0] LEDR; 	
	logic  [3:0] KEY; 	
	logic  [9:0] SW; 	
	
	DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);	
	
	// Try all combinations of inputs.	
	integer i;	
	initial begin	
		SW[9] = 1'b0;	
		SW[8] = 1'b0;	
		for(i = 0; i <256; i++) begin	
			SW[7:0] = i; #10;	
		end	
	end	
endmodule
