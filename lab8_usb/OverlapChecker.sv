// Check if rect1 is overlapping rect2
module OverlapChecker (	input [9:0] x1, y1, w1, h1, // ball
									x2, y2, w2, h2, // brick
						output		overlapX, // overlapping along a vertical line
									overlapY // overlapping along a horizontal line
						);
	
	logic x_match, y_match; // any overlap, anywhere
	logic x_straddle, xx_straddle, y_straddle, yy_straddle; // straddling the line
	logic [9:0] xx1, yy1, xx2, yy2; // actual coords instead of x1 + w1
	
	assign xx1 = x1 + w1;
	assign yy1 = y1 + h1;
	assign xx2 = x2 + w2;
	assign yy2 = y2 + h2;
	
	assign x_match = (xx1 > x2 && x1 < xx2);
	assign y_match = (yy1 > y2 && y1 < yy2);
	
	assign x_straddle	= (x1 <= x2  && xx1 > x2);
	assign xx_straddle	= (x1 <= xx2 && xx1 > xx2);
	assign y_straddle	= (y1 <= y2  && yy1 > y2);
	assign yy_straddle	= (y1 <= yy2 && yy1 > yy2);
	
	assign overlapX = (y_match && (x_straddle || xx_straddle));
	assign overlapY = (x_match && (y_straddle || yy_straddle));
	
endmodule
