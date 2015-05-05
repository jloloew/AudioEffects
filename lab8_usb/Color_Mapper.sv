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


module  color_mapper (	input  [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
						input [9:0] brick_exists,
						input [9:0] brick_width,
						input [9:0] brick_height,
						input [99:0] brick_x_vals,
						input [99:0] brick_y_vals,
						output logic [7:0]  Red, Green, Blue );
    
    logic ball_on;
	logic brick_on;
	int DistX, DistY, Size;
	
	assign DistX = DrawX - BallX;
	assign DistY = DrawY - BallY;
	assign Size = Ball_size;
	
	always_comb
	begin : Ball_on_proc
		if ( ( DistX*DistX + DistY*DistY) <= (Size*Size) ) 
			ball_on = 1'b1;
		else 
			ball_on = 1'b0;
	end
	
	logic [9:0] brick_on_array;
	
	genvar i;
	generate
		for (i = 0; i < 10; i = i+1)
		begin : Brick_on_logic
			assign brick_on_array[i] = brick_exists[i] && ((brick_x_vals[10*i+9 : 10*i] <= DrawX && DrawX < (brick_x_vals[10*i+9 : 10*i] + brick_width)) && (brick_y_vals[10*i+9 : 10*i] <= DrawY && DrawY < (brick_y_vals[10*i+9 : 10*i] + brick_height)));
		end
	endgenerate
	
	assign brick_on = (brick_on_array != 10'd0);
	
    always_comb
    begin : RGB_Display
		if (brick_on == 1'b1) begin
			Red		= 8'd84;
            Green	= 8'd34;
            Blue	= 8'd226;
		end
        else
        if (ball_on == 1'b1)
        begin 
            Red		= 8'h00;
            Green	= 8'hff;
            Blue	= 8'hff;
        end
		else 
        begin 
            Red		= 8'h00;
            Green	= 8'h00;
            Blue	= 8'h00; 
        end      
    end 
    
	
endmodule
