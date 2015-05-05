//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ball (	input Reset, frame_clk,
				input [9:0] brick_width,
				input [9:0] brick_height,
				input [99:0] brick_x_vals,
				input [99:0] brick_y_vals,
				input logic [1:0]	velocity_x_in,	velocity_y_in,
				output logic [1:0]	velocity_x_out,	velocity_y_out,
				output [9:0]  BallX, BallY, BallS,
				output [9:0] brick_exists
				);
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	reg [9:0] brick_exists_n;
	
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis
	
	logic brick_bounce_x, brick_bounce_y;
	logic [9:0] brick_bounce_x_array, brick_bounce_y_array;
	
	assign brick_exists = ~brick_exists_n;
	
    assign Ball_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin
			Ball_Y_Motion = 10'd0; //Ball_Y_Step;
			Ball_X_Motion = 10'd0; //Ball_X_Step;
			Ball_Y_Pos = Ball_Y_Center;
			Ball_X_Pos = Ball_X_Center;
		end
		else
		begin
			// Handle bouncing
			// Bounce X
			if (velocity_x_in == 2'b00)
				Ball_X_Motion = Ball_X_Step;//10'd0;
			else if (velocity_x_in == 2'b01)
			begin
				// Bounce X
				if ((Ball_X_Pos + Ball_Size) >= Ball_X_Max)  // Ball is at the right edge, BOUNCE!
					Ball_X_Motion = (~(Ball_X_Step) + 1'b1);  // 2's complement.
				else
					Ball_X_Motion = Ball_X_Step;  // Ball is somewhere in the middle, don't bounce, just keep moving
			end
			else if (velocity_x_in == 2'b10)
			begin
				if ((Ball_X_Pos - Ball_Size) <= Ball_X_Min)  // Ball is at the left edge, BOUNCE!
					Ball_X_Motion = (Ball_X_Step);
				else
					Ball_X_Motion = (~(Ball_X_Step) + 1'b1); // 2's complement
			end
			else
				Ball_X_Motion = 10'b0;
			
			
			// Bounce Y
			if (velocity_y_in == 2'b00)
				Ball_Y_Motion = Ball_Y_Step;
			else if (velocity_y_in == 2'b01)
			begin
				// Bounce Y
				if ((Ball_Y_Pos + Ball_Size) >= Ball_Y_Max)  // Ball is at the bottom edge, BOUNCE!
					Ball_Y_Motion = (~(Ball_Y_Step) + 1'b1);  // 2's complement.
				else
					Ball_Y_Motion = Ball_Y_Step;  // Ball is somewhere in the middle, don't bounce, just keep moving
			end
			else if (velocity_y_in == 2'b10)
			begin
				if ((Ball_Y_Pos - Ball_Size) <= Ball_Y_Min)  // Ball is at the top edge, BOUNCE!
					Ball_Y_Motion = (Ball_Y_Step);
				else
					Ball_Y_Motion = (~(Ball_Y_Step) + 1'b1); // 2's complement
			end
			else
				Ball_Y_Motion = 10'b0;
			
			// brick bouncing
			if (brick_bounce_x == 1'b1)
				Ball_X_Motion = (~(Ball_X_Motion) + 1'b1) + (~(Ball_X_Motion) + 1'b1); // 2's complement
			if (brick_bounce_y == 1'b1)
				Ball_Y_Motion = (~(Ball_Y_Motion) + 1'b1) + (~(Ball_Y_Motion) + 1'b1); // 2's complement
			
			Ball_Y_Pos = (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
			Ball_X_Pos = (Ball_X_Pos + Ball_X_Motion);
		end
	end
	
	// hide bricks we've already collided with
	always_ff @ (posedge frame_clk or posedge Reset)
	begin
		if (Reset)
		begin
			brick_exists_n = 0;
		end
		else
		begin
			int j;
			for (j = 0; j < 10; j = j+1)
			begin : Hide_brick_logic
				if (brick_bounce_x_array[j] || brick_bounce_y_array[j])
					brick_exists_n[j] = 1'b1;
				else
					brick_exists_n[j] = brick_exists_n[j];
			end
		end
	end
	
	genvar i;
	// Brick bouncing
	generate
		for (i = 0; i < 10; i = i+1)
		begin : Brick_on_logic
			assign brick_bounce_x_array[i] =
			~brick_exists_n[i]
			// ball's y value is within the brick's y values
			&& (
				((Ball_Y_Pos + Ball_Size) > brick_y_vals[10*i+9 : 10*i]) // ball is below top edge of brick
				&& (Ball_Y_Pos <= (brick_y_vals[10*i+9 : 10*i] + brick_height)) // ball is at least partially within brick
			)
			&& (
				(
					// ball is straddling left edge
					(brick_x_vals[10*i+9 : 10*i] <= (Ball_X_Pos + Ball_Size)) && (brick_x_vals[10*i+9 : 10*i] > Ball_X_Pos)
				) || (
					// ball is straddling right edge
					((brick_x_vals[10*i+9 : 10*i] + brick_width) <= (Ball_X_Pos + Ball_Size)) && ((brick_x_vals[10*i+9 : 10*i] + brick_width) > Ball_X_Pos)
				)
			);
			
			assign brick_bounce_y_array[i] =
			~brick_exists_n[i]
			// ball's x value is within the brick's x values
			&& (
				((Ball_X_Pos + Ball_Size) > brick_x_vals[10*i+9 : 10*i]) // ball is before left edge of brick
				&& (Ball_X_Pos <= (brick_x_vals[10*i+9 : 10*i] + brick_width)) // ball is at least partially within brick
			)
			&& (
				(
					// ball is straddling top edge
					(brick_y_vals[10*i+9 : 10*i] <= (Ball_Y_Pos + Ball_Size)) && (brick_y_vals[10*i+9 : 10*i] > Ball_Y_Pos)
				) || (
					// ball is straddling bottom edge
					((brick_y_vals[10*i+9 : 10*i] + brick_height) <= (Ball_Y_Pos + Ball_Size)) && ((brick_y_vals[10*i+9 : 10*i] + brick_height) > Ball_Y_Pos)
				)
			);
		end
	endgenerate
	
	assign brick_bounce_x = (brick_bounce_x_array != 10'd0);
	assign brick_bounce_y = (brick_bounce_y_array != 10'd0);
	
	assign BallX = Ball_X_Pos;
	
	assign BallY = Ball_Y_Pos;
	
	assign BallS = Ball_Size;
	
	assign velocity_x_out = (Ball_X_Motion[9] != 1'b0) ? 2'b10 : (Ball_X_Motion != 10'b0) ? 2'b01 : 2'b00;
	assign velocity_y_out = (Ball_Y_Motion[9] != 1'b0) ? 2'b10 : (Ball_Y_Motion != 10'b0) ? 2'b01 : 2'b00;
	
endmodule
