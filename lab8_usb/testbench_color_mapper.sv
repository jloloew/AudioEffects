module testbench_color_mapper();

timeunit 10ms;
timeprecision 1ms;

logic		frame_clk, Reset;
logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size;
logic [8:0] brick_exists;
logic [9:0] brick_width, brick_height, paddle_height;
logic [99:0] brick_x_vals, brick_y_vals;
logic		did_win_game, did_lose_game;
logic [7:0] Red, Green, Blue;

// expected results
logic [7:0] Exp_Red, Exp_Green, Exp_Blue;

integer errorCount = 0;

color_mapper color_mapper_0 (.*);

always begin: CLOCK_GENERATION
	#1 frame_clk = ~frame_clk;
end
initial begin: CLOCK_INITIALIZATION
	frame_clk = 0;
end

/////////// SETUP /////////////////////
always begin: BALL_MOVEMENT
	#2 BallX += 1;
	#2 BallY += 1;
end

///////////////////////////////// BEGIN TESTING //////////////////////////
initial begin: TEST_VECTORS
Reset = 1; // toggle reset
Ball_size = 4;
BallX = 320;
BallY = 280;
DrawX = 324;
DrawY = 284;
brick_exists = ~0;
brick_width = 100;
brick_height = 80;
paddle_height = 35;
brick_x_vals = { 10'd70, 10'd170, 10'd270, 10'd370, 10'd470, 10'd120, 10'd220,  10'd320, 10'd420 };
brick_y_vals = { 10'd400, {5{10'd60}}, {4{10'd140}} };
did_win_game = 0;
did_lose_game = 0;

#2 Reset = 0;
#6;
// check for ball
Exp_Red = 'h00;
Exp_Green = 'hFF;
Exp_Blue = 'hFF;
if (Exp_Red != Red)
	errorCount++;
if (Exp_Green != Green)
	errorCount++;
if (Exp_Blue != Blue)
	errorCount++;

// wait for ball to move, then check for background
#30;
Exp_Red = 'h00;
Exp_Green = 'h00;
Exp_Blue = 'h00;
if (Exp_Red != Red)
	errorCount++;
if (Exp_Green != Green)
	errorCount++;
if (Exp_Blue != Blue)
	errorCount++;



if (errorCount == 0)
	$display("Great success!");
else
	$display("%d errors, you miserable failure.", errorCount);

end

endmodule
