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


module  color_mapper (	input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
						output [9:0] brick_width,
						output [9:0] brick_height,
						output [99:0] brick_x_vals,
						output [99:0] brick_y_vals,
						output logic [7:0]  Red, Green, Blue );
    
    logic ball_on;
	logic brick_on;
	integer i;
	int DistX, DistY, Size;
	
	assign DistX = DrawX - BallX;
	assign DistY = DrawY - BallY;
	assign Size = Ball_size;
	
	always_comb
	begin : Ball_on_proc
		if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
			ball_on = 1'b1;
		else 
			ball_on = 1'b0;
	end
	
	always_comb
	begin : Brick_on_proc
		brick_on = 1'b0;
		
		for (i = 0; i < 10; i = i+1) begin
			logic [9:0] brick_x = 10'(brick_x_vals >> i);
			logic [9:0] brick_y = 10'(brick_y_vals >> i);
			
			if (brick_x <= DrawX && DrawX < (brick_x + brick_width))
				if (brick_y <= DrawY && DrawY < (brick_y + brick_height))
					brick_on = 1'b1;
		end
	end
	
    always_comb
    begin : RGB_Display
        if ((ball_on == 1'b1)) 
        begin 
            Red = 8'h00;
            Green = 8'hff;
            Blue = 8'hff;
        end
		/*
		else if (brick1.containsPosition(DrawX, DrawY))
		begin
			Red = brick1.r;
			Green = brick1.g;
			Blue = brick1.b;
		end
		*/
        else 
        begin 
            Red = 8'h4f - DrawX[9:3];
            Green = 8'h00;
            Blue = 8'h44; 
        end      
    end 
    
	
endmodule
