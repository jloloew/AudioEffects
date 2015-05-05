/// Detects collisions between each and every one of the onscreen objects.
// Detects collisions, changing the direction of the ball and causing Blocks to disappear, if necessary.
module CollisionDetector (	input			frame_clk, Reset,
							// bricks
							input [9:0]		brick_width, brick_height,
							input [99:0]	brick_x_vals, brick_y_vals,
							inout [9:0]		brick_exists,
							// ball
							inout [9:0]		BallX, BallY,
							input [9:0]		BallS,
							// paddle
							input [9:0]		PaddleX, PaddleY,
											PaddleW, PaddleH
							);
	
	logic [9:0]	overlapX_vals, overlapY_vals;
	logic		overlapX_bricks, overlapY_bricks;
	logic		overlapX_screen, overlapY_screen; // check if the ball is trying to fly offscreen
	
	assign overlapX_bricks = (((overlapX_vals & brick_exists) != 10'b0) ? 1'b1 : 1'b0);
	assign overlapY_bricks = (((overlapY_vals & brick_exists) != 10'b0) ? 1'b1 : 1'b0);
	
	OverlapChecker screenBoundsChecker (	.x1 (BallX), .y1 (BallY), .w1 (BallS), .h1 (BallS),
											.x2 ('0), .y2 ('0), .w2 ('640), .h2 ('480),
											.overlapX (overlapX_screen), .overlapY (overlapY_screen));
	
	genvar i;
	for (i = 0; i < 10; i = i+1)
	begin : Overlap_checkers
		OverlapChecker checker (	.x1 (BallX), .y1 (BallY), .w1 (BallS), .h1 (BallS),
									.x2 (brick_x_vals[10*i+9 : 10*i]), .y2 (brick_y_vals[10*i+9 : 10*i]),
									.w2 (brick_width), .h2 (brick_height),
									.overlapX (overlapX_vals[i]), .overlapY (overlapY_vals[i]));
	end
	
	
	always_ff @ (posedge frame_clk)
	begin
		// check if the ball has hit a block
		if (overlapX_bricks != '0) begin
			
		end
		if (overlapY_bricks != '0) begin
			
		end
		
		// check if the ball is going offscreen
		if (overlapX_screen != '0) begin
			
		end
		if (overlapY_screen != '0) begin
			
		end
	end
	
endmodule
