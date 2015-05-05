module BrickList (	input frame_clk, Reset,
					output [9:0] brick_width,
					output [9:0] brick_height,
					output [99:0] brick_x_vals,
					output [99:0] brick_y_vals
					);
	
	assign brick_width = 10'd100;
	assign brick_height = 10'd80;
	
	assign brick_x_vals = { {7{10'b0}}, 10'd590, 10'd20, 10'd300 };
	assign brick_y_vals = { {7{10'b0}}, 10'd460, 10'd100, 10'd250 };
	
endmodule
