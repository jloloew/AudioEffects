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


module  ball (	input				Reset, frame_clk,
				input logic [1:0]	velocity_x_in,	velocity_y_in,
				output logic [1:0]	velocity_x_out,	velocity_y_out,
				output [9:0]		BallX, BallY, BallS
			);
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	 
    parameter [9:0] Ball_X_Center	= 320;	// Center position on the X axis
    parameter [9:0] Ball_Y_Center	= 240;	// Center position on the Y axis
    parameter [9:0] Ball_X_Min		= 0;	// Leftmost point on the X axis
    parameter [9:0] Ball_X_Max		= 639;	// Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min		= 0;	// Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max		= 479;	// Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step		= 1;	// Step size on the X axis
    parameter [9:0] Ball_Y_Step		= 1;	// Step size on the Y axis

    assign Ball_Size = 4;	// assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk)
    begin : Move_Ball
        if (Reset)  // Asynchronous Reset
        begin
			Ball_Y_Motion <= 10'd0;	// Ball_Y_Step;
			Ball_X_Motion <= 10'd0;	// Ball_X_Step;
			Ball_Y_Pos <= Ball_Y_Center;
			Ball_X_Pos <= Ball_X_Center;
		end
		else
		begin
			// Handle bouncing
			// Bounce X
			if (velocity_x_in == 2'b00)
				Ball_X_Motion <= Ball_X_Step;//10'd0;
			else if (velocity_x_in == 2'b01)
			begin
				// Bounce X
				if (Ball_X_Pos + Ball_Size >= Ball_X_Max)	// Ball is at the right edge, BOUNCE!
					Ball_X_Motion <= (~(Ball_X_Step) + 1'b1);	// 2's complement
				else
					Ball_X_Motion <= Ball_X_Step;	// Ball is somewhere in the middle, don't bounce, just keep moving
			end
			else if (velocity_x_in == 2'b10)
			begin
				if (Ball_X_Pos - Ball_Size <= Ball_X_Min)	// Ball is at the left edge, BOUNCE!
					Ball_X_Motion <= (Ball_X_Step);
				else
					Ball_X_Motion <= (~(Ball_X_Step) + 1'b1);	// 2's complement
			end
			else
				Ball_X_Motion <= 10'b0;
			
			
			// Bounce Y
			if (velocity_y_in == 2'b00)
				Ball_Y_Motion <= Ball_Y_Step;	// 10'd0;
			else if (velocity_y_in == 2'b01)
			begin
				// Bounce Y
				if (Ball_Y_Pos + Ball_Size >= Ball_Y_Max)	// Ball is at the bottom edge, BOUNCE!
					Ball_Y_Motion <= (~(Ball_Y_Step) + 1'b1);	// 2's complement
				else
					Ball_Y_Motion <= Ball_Y_Step;	// Ball is somewhere in the middle, don't bounce, just keep moving
			end
			else if (velocity_y_in == 2'b10)
			begin
				if (Ball_Y_Pos - Ball_Size <= Ball_Y_Min)	// Ball is at the top edge, BOUNCE!
					Ball_Y_Motion <= (Ball_Y_Step);
				else
					Ball_Y_Motion <= (~(Ball_Y_Step) + 1'b1);	// 2's complement
			end
			else
				Ball_Y_Motion <= 10'b0;
			
			Ball_Y_Pos <= Ball_Y_Pos + Ball_Y_Motion;	// Update ball position
			Ball_X_Pos <= Ball_X_Pos + Ball_X_Motion;
		end
	end
	
	assign BallX = Ball_X_Pos;
	
	assign BallY = Ball_Y_Pos;
	
	assign BallS = Ball_Size;
	
	assign velocity_x_out = (Ball_X_Motion[9] != 1'b0) ? 2'b10 : (Ball_X_Motion != 10'b0) ? 2'b01 : 2'b00;
	assign velocity_y_out = (Ball_Y_Motion[9] != 1'b0) ? 2'b10 : (Ball_Y_Motion != 10'b0) ? 2'b01 : 2'b00;
	
endmodule
