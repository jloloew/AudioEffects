
module text_luser (	input			didWin, didLose,
					input [9:0]		DrawX, DrawY,
					output [9:0]	SizeX, SizeY,
					output			char_pix_is_on
					);
	
	logic [10:0]	addr;
	logic [7:0]		data;
	parameter logic [9:0]	charSizeX = 8;
	parameter logic [9:0]	charSizeY = 16;
	
	font_rom fontrom (.addr, .data);
	
	assign char_pix_is_on = data[8'd8 - (DrawX & 8'h07)];
	assign SizeX = 10'd7 * charSizeX;
	assign SizeY = charSizeY;
	
	always_comb
	begin: Choose_Letter
		addr = 'h00; // blank
		
		if (didLose) begin
			case (DrawX >> 3)
				'd0:
					addr = 'h4C; // L
				'd1:
					addr = 'h75; // u
				'd2:
					addr = 'h73; // s
				'd3:
					addr = 'h65; // e
				'd4:
					addr = 'h72; // r
				default:
					addr = 'h00; // blank
			endcase
		end
		else if (didWin) begin
			case (DrawX >> 3)
				'd0:
					addr = 'h57; // W
				'd1:
					addr = 'h49; // I
				'd2:
					addr = 'h4E; // N
				'd3:
					addr = 'h52; // R
				'd4:
					addr = 'h41; // A
				'd5:
					addr = 'h52; // R
				'd6:
					addr = 'h21; // !
				default:
					addr = 'h00; // blank
			endcase
		end
		
		addr *= 16;
		addr += DrawY;
	end
	
endmodule
