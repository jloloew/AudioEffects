/// A list of every object that needs to be drawn.
module ObjectList (	input frame_clk, Reset,
					input vx_paddle,
					
					);
	
	// applies to every brick
	logic [9:0]		brick_width, brick_height;
	// 10 bits for each brick, up to 10 total
	logic [99:0]	brick_x_vals, brick_y_vals;
	
	BrickList brickList (.*);
	Ball ball (.*);
	CollisionDetector colDctr (.*);
	
endmodule
