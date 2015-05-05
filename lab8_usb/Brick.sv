/*
Class Brick;
	
	// location
	int x;
	int y;
	int width;
	int height;
	// color
	bit [7:0] r;
	bit [7:0] g;
	bit [7:0] b;
	
	function bit containsLocation(int xLoc, int yLoc);
		if ((x <= xLoc) & (xLoc < x + width))
			if ((y <= yLoc) & (yLoc < y + height))
				return 1;
			else
				return 0;
		else
			return 0;
	endfunction
	
endclass
*/