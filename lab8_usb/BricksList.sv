module BricksList	(	input Reset, fram_clk,
							input level,
							);
	
	always_ff @ (posedge Reset or posedge frame_clk )
	begin: createBricks
		if (Reset)
		begin
			if(level = 1)
				Bricks bricks(.brick_in_x(320), .bricks_in_y(340), .brick_in_width(10), .brick_in_height(5));
		end
	end
	

	endmodule