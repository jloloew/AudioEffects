module Bouncing_Ball (	input				Clk,
											Reset,
						input logic [7:0]	keycode,
						// VGA Interface 
						output [7:0]		Red,
											Green,
											Blue,
						output				VGA_clk,
											sync,
											blank,
											vs,
											hs
						);
	
	logic [9:0]		DrawX, DrawY, BallX, BallY, BallS;
	logic [8:0]		brick_exists;
	logic [9:0]		brick_width, brick_height;
	logic [89:0]	brickList_x_vals;
	reg   [99:0]	brick_x_vals, brick_y_vals;
	logic			did_win_game, did_lose_game;
	
	parameter logic [9:0] paddle_step = 10'd5;
	
	vga_controller vga_ctrlr (.*, .pixel_clk (VGA_clk));
	ball mBall (.*, .frame_clk (vs));
	BrickList brickList (.*, .frame_clk (vs), .brick_x_vals (brickList_x_vals));
	color_mapper color_map (.*, .Ball_size (BallS));
	
	assign brick_x_vals[89:0] = brickList_x_vals;
	
	// win and lose checks
	assign did_win_game = (~did_lose_game && (brick_exists == 9'h0)); // we can't win if we've already lost
	always_ff @ (posedge vs or posedge Reset)
	begin
		if (Reset) begin
			did_lose_game = 1'b0;
		end
		else begin
			if ((BallY + BallS) >= 10'd479) begin
				if (~did_win_game) // we can only lose if we haven't won yet
					did_lose_game = 1'b1;
			end
		end
	end
	// move paddle based on keycode
	always_ff @ (posedge vs or posedge Reset)
	begin
		if (Reset) begin
			brick_x_vals[99:90] = 10'd260;
		end
		else begin
			case (keycode)
				8'd04 : begin // A/left
					if ((brick_x_vals[99:90] - paddle_step) > 10'd0)
						brick_x_vals[99:90] -= paddle_step;
				end
				8'd07 : begin // D/right
					if ((brick_x_vals[99:90] + brick_width + paddle_step) <= 10'd640)
						brick_x_vals[99:90] += paddle_step;
				end
			endcase
		end
	end
	
endmodule
