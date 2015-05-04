module Bricks (		input	 [9:0] brick_in_x,
							input	 [9:0] brick_in_y,
							input	 [9:0] brick_in_width,
							input  [9:0] brick_in_height,
							output [9:0] brick_width,
							output [9:0] brick_height,
							output [9:0] brick_x,
							output [9:0] brick_y
						);
						
	assign brick_x = brick_in_x;
	assign brick_y = brick_in_y;
	assign brick_width = brick_in_width;
	assign brick_height = brick_in_height;
	
	
	
	
	
endmodule