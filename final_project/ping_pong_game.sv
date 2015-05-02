
`timescale 1 ns / 1 ns
module ping_pong_game (	input			clk, Reset,
						input  [17:0]	SW,
						output [17:0]	LEDR
						);
	
	int ball_pos;
	logic is_traveling_right;
	
	always_ff @ (posedge clk)
	begin
		if (Reset) begin
			ball_pos = 17;
			is_traveling_right = 1'b1;
		end
		else begin
			// change direction if we're in a wall
			if (SW[ball_pos] == 1'b1)
				is_traveling_right = ~is_traveling_right;
			// don't go out of bounds
			if (ball_pos == 0)
				is_traveling_right = 1'b0;
			else if (ball_pos == 17)
				is_traveling_right = 1'b1;
			// move the ball
			if (is_traveling_right == 1'b1)
				ball_pos--;
			else
				ball_pos++;
		end
		// write to the LEDs
		LEDR = SW | (18'h1 << ball_pos);
	end
	
endmodule
