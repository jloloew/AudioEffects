//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module color_mapper (	input		frame_clk, Reset,
						input [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
						input [8:0] brick_exists,
						input [9:0] brick_width,
						input [9:0] brick_height,
									paddle_height,
						input [99:0] brick_x_vals,
						input [99:0] brick_y_vals,
						input		did_win_game, did_lose_game,
						output logic [7:0] Red, Green, Blue );
    
    logic ball_on, brick_on, edge_of_brick_on, paddle_on,
			spriteOn, spritePixOn;
//	logic did_win_game, did_lose_game, out_of_bounds;
	int DistX, DistY, Size;
	
	logic [8:0]		brick_on_array;
	logic [8:0]		edge_of_brick_array;
	// animations
//	logic [99:0] brick_x_anim, brick_y_anim, brick_width_anim, brick_height_anim;
	
	logic [9:0]	spriteX = 300;
	logic [9:0]	spriteY = 300;
	logic [9:0]	spriteSizeX = 8;
	logic [9:0]	spriteSizeY = 16;
	text_luser lusertext (	.didWin (did_win_game), .didLose (did_lose_game),
							.DrawX (DrawX - spriteX), .DrawY (DrawY - spriteY),
							.SizeX (spriteSizeX), .SizeY (spriteSizeY), .char_pix_is_on (spritePixOn));
	
	assign DistX = DrawX - BallX;
	assign DistY = DrawY - BallY;
	assign Size = Ball_size;
	
	// Animate removing bricks
	genvar i;
	/*
	generate
		for (i = 0; i < 9; i += 1)
		begin: Brick_animation
			always_ff @ (posedge frame_clk or posedge Reset)
			begin
				if (Reset) begin
					brick_x_anim[10*i+9 : 10*i] = brick_x_vals[10*i+9 : 10*i];
					brick_y_anim[10*i+9 : 10*i] = brick_y_vals[10*i+9 : 10*i];
					brick_width_anim[10*i+9 : 10*i] = brick_width;
					brick_height_anim[10*i+9 : 10*i] = brick_height;
				end
				else if (~brick_exists[i]) begin
					// do nothing if the width is already zero
					if (brick_width_anim[10*i+9 : 10*i] > 10'd0) begin
						brick_x_anim[10*i+9 : 10*i] += 10'd1;
						brick_y_anim[10*i+9 : 10*i] += 10'd1;
						brick_width_anim[10*i+9 : 10*i] -= 10'd2;
						brick_height_anim[10*i+9 : 10*i] -= 10'd2;
					end
				end
			end
		end
	endgenerate
	*/
	always_comb
	begin: Ball_on_proc
		ball_on		= 1'b0;
		spriteOn	= 1'b0;
		
		if ((DistX*DistX + DistY*DistY) <= (Size*Size)) 
		begin
			ball_on = 1'b1;
		end
		else if ((DrawX >= spriteX) && (DrawX < spriteX + spriteSizeX) &&
					(DrawY >= spriteY) && (DrawY < spriteY + spriteSizeY))
		begin
			spriteOn = 1'b1;
		end
	end
	
	generate
		for (i = 0; i < 9; i += 1)
		begin: Brick_on_logic
			assign brick_on_array[i] = brick_exists[i] && ((brick_x_vals[10*i+9 : 10*i] <= DrawX && DrawX < (brick_x_vals[10*i+9 : 10*i] + brick_width)) && (brick_y_vals[10*i+9 : 10*i] <= DrawY && DrawY < (brick_y_vals[10*i+9 : 10*i] + brick_height)));
			
			assign edge_of_brick_array[i] = (
				( // cursor is on the top or bottom edge of the block
					((DrawY == brick_y_vals[10*i+9 : 10*i]) || (DrawY == (brick_y_vals[10*i+9 : 10*i] + brick_height - 1)))
					// DrawX is within the brick along the x-axis
					&& (brick_x_vals[10*i+9 : 10*i] <= DrawX && DrawX < (brick_x_vals[10*i+9 : 10*i] + brick_width))
				)
				|| ( // cursor is on the left or right edge of the block
					((DrawX == brick_x_vals[10*i+9 : 10*i]) || (DrawX == (brick_x_vals[10*i+9 : 10*i] + brick_width - 1)))
					// DrawY is within the brick along the y-axis
					&& (brick_y_vals[10*i+9 : 10*i] <= DrawY && DrawY < (brick_y_vals[10*i+9 : 10*i] + brick_height))
				)
			);
		end
	endgenerate
	
	assign brick_on = (brick_on_array != 10'd0);
	assign edge_of_brick_on = (edge_of_brick_array != 10'd0);
	assign paddle_on = ((brick_x_vals[99:90] <= DrawX && DrawX < (brick_x_vals[99:90] + brick_width)) && (brick_y_vals[99:90] <= DrawY && DrawY < (brick_y_vals[99:90] + paddle_height)));
	
    always_comb
    begin: RGB_Display
		if (did_win_game) begin: Game_Over_Win
			Red		= 8'h00;
			Green	= 8'hC9;
			Blue	= 8'h57;
			if (spriteOn && spritePixOn) begin: Game_Over_Win_Word
				Red		= 8'h00;
				Green	= 8'h00;
				Blue	= 8'h00;
			end
		end
		else if (did_lose_game) begin: Game_Over_Lose
			Red		= 8'h80;
			Green	= 8'h00;
			Blue	= 8'h00;
			if (spriteOn && spritePixOn) begin: Game_Over_Lose_Word
				Red		= 8'h00;
				Green	= 8'h00;
				Blue	= 8'h00;
			end
		end
		else if (paddle_on == 1'b1) begin: Draw_Paddle
			Red		= 8'hB0;
			Green	= 8'hE2;
			Blue	= 8'h22;
		end
		else if (brick_on == 1'b1) begin: Draw_Brick
			Red		= 8'h54;
			Green	= 8'h22;
			Blue	= 8'hE2;
			// invert the edges of the brick
			if (edge_of_brick_on == 1'b1) begin
				Red		= ~Red;
				Green	= ~Green;
				Blue	= ~Blue;
			end
		end
        else if (ball_on == 1'b1) begin: Draw_Ball
            Red		= 8'h00;
            Green	= 8'hFF;
            Blue	= 8'hFF;
        end
		else // background
        begin 
            Red		= 8'h00;
            Green	= 8'h00;
            Blue	= 8'h00; 
        end      
    end 
    
	
endmodule
