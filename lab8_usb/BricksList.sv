module BricksList	(	input Reset, frame_clk,
							input level
							);
	
	Bricks bricks (.brick_in_x(320), .brick_in_y(340), .brick_in_width(10), .brick_in_height(5),
								.brick_x (), .brick_y (), .brick_width (), .brick_height ());
								
	always_ff @ (posedge Reset or posedge frame_clk )
	begin : createBricks
		if (Reset)
		begin
			if(level == 1'b1)
				;
		end
	end
	

endmodule
