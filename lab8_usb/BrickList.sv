module BrickList (	input			frame_clk, Reset,
					output [9:0]	brick_width,
					output [9:0]	brick_height,
					output [89:0]	brick_x_vals,
					output [99:0]	brick_y_vals
					);
	
	assign brick_width	= 10'd100;
	assign brick_height	= 10'd80;
	
	assign brick_x_vals = { 10'd70, 10'd170, 10'd270, 10'd370, 10'd470, // top row
								10'd120, 10'd220,  10'd320, 10'd420 };
	assign brick_y_vals = { 10'd400, // paddle
							{ 5{10'd60} }, // top row
							{ 4{10'd140} } }; // bottom row
	
endmodule
