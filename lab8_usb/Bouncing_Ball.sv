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
	
	logic [9:0] DrawX, DrawY, BallX, BallY, BallS;
	logic [1:0] velocity_x, velocity_y, velocity_x_out, velocity_y_out; // ball velocities
	
	vga_controller vga_ctrlr (.*, .pixel_clk (VGA_clk));
	ball mBall (.*, .frame_clk (vs), .velocity_x_in (velocity_x), .velocity_y_in (velocity_y));
	color_mapper color_map (.*, .Ball_size (BallS));
	
	// set ball direction from keycode
	always_comb
	begin
		case (keycode)
			8'd26 : begin // W/up
				velocity_x = 2'b00;
				velocity_y = 2'b10;
			end
			8'd34 : begin // S/down
				velocity_x = 2'b00;
				velocity_y = 2'b01;
			end
			8'd04 : begin // A/left
				velocity_x = 2'b10;
				velocity_y = 2'b00;
			end
			8'd07 : begin // D/right
				velocity_x = 2'b01;
				velocity_y = 2'b00;
			end
			default : begin // keep same velocities (and handle bounces)
				velocity_x = velocity_x_out;
				velocity_y = velocity_y_out;
			end
		endcase
	end
	
endmodule
