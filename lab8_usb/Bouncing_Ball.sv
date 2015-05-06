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
//	logic [1:0]		velocity_x, velocity_y, velocity_x_out, velocity_y_out; // ball velocities
	logic [8:0]		brick_exists;
	logic [9:0]		brick_width, brick_height;
	logic [89:0]	brickList_x_vals;
	reg   [99:0]	brick_x_vals, brick_y_vals;
	
	parameter logic [9:0] paddle_step = 10'd5;
	
	vga_controller vga_ctrlr (.*, .pixel_clk (VGA_clk));
	ball mBall (.*, .frame_clk (vs));//, .velocity_x_in (velocity_x), .velocity_y_in (velocity_y));
	BrickList brickList (.*, .frame_clk (vs), .brick_x_vals (brickList_x_vals));
	color_mapper color_map (.*, .Ball_size (BallS));
	
	assign brick_x_vals[89:0] = brickList_x_vals;
	
	// move paddle based on keycode
	always_ff @ (posedge vs or posedge Reset)
	begin
		if (Reset)
			brick_x_vals[99:90] = 10'd260;
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
