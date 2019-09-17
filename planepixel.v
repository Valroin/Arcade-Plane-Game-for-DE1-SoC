module planepixel
    (input wire clk,
    input wire rst,
    input wire [10:0]  ox,
    input wire [10:0]  oy,
    input wire [10:0]  px,
    input wire [10:0]  py,
    output wire [2:0]   plane_color);

   wire 	             inobj;
   wire [4:0] 	       plane_y, plane_x;
   reg [31:0] 	       rom_data_grey, rom_data_white, rom_data_red, rom_data_black;
   wire [4:0] 	       rom_addr;
   wire               rom_bit_grey, rom_bit_white, rom_bit_red, rom_bit_black;
   
   assign inobj     = (px >= ox) && (px < ox + 32) &&
		       (py >=  oy) && (py < oy + 32);
   
   assign plane_x     = inobj ? px - ox : 0;
   assign plane_y     = inobj ? py - oy : 0;
   
   assign rom_addr   = plane_y;
   assign rom_bit_grey     = rom_data_grey[plane_x];
	assign rom_bit_white    = rom_data_white[plane_x];
	assign rom_bit_red      = rom_data_red[plane_x];
	assign rom_bit_black    = rom_data_black[plane_x];
   
   assign plane_color = (rom_bit_grey)  ? 3'd1 	:
								(rom_bit_white) ? 3'd2  :
								(rom_bit_red)   ? 3'd3  :
								(rom_bit_black) ? 3'd4  : 3'd0;

   always @*
     case (rom_addr)
       5'h00: rom_data_grey = 32'b00000000000000000000000000000000; 
       5'h01: rom_data_grey = 32'b00000000000000000000000000000000; 
       5'h02: rom_data_grey = 32'b00000000000000000000000000000000; 
       5'h03: rom_data_grey = 32'b00000000000000011000000000000000; 
       5'h04: rom_data_grey = 32'b00000000001111111111110000000000; 
       5'h05: rom_data_grey = 32'b00000000000000111100000000000000; 
       5'h06: rom_data_grey = 32'b00000000000001111110000000000000; 
       5'h07: rom_data_grey = 32'b00000000000001000010000000000000; 
       5'h08: rom_data_grey = 32'b00111111111111000011111111111100; 
       5'h09: rom_data_grey = 32'b01110001111111000011111110001110; 
       5'h0a: rom_data_grey = 32'b01110001111111000011111110001110; 
       5'h0b: rom_data_grey = 32'b01110001111111000011111110001110; 
       5'h0c: rom_data_grey = 32'b00011111111111111111111111111000; 
       5'h0d: rom_data_grey = 32'b00000000000001111110000000000000; 
       5'h0e: rom_data_grey = 32'b00000000000001111110000000000000; 
       5'h0f: rom_data_grey = 32'b00000000000001111110000000000000; 
       5'h10: rom_data_grey = 32'b00000000000001111110000000000000; 
       5'h11: rom_data_grey = 32'b00000000000001111110000000000000; 
       5'h12: rom_data_grey = 32'b00000000000001111110000000000000; 
       5'h13: rom_data_grey = 32'b00000000000001111110000000000000; 
       5'h14: rom_data_grey = 32'b00000000000001111110000000000000; 
       5'h15: rom_data_grey = 32'b00000000000001111110000000000000; 
       5'h16: rom_data_grey = 32'b00000000000000111100000000000000; 
       5'h17: rom_data_grey = 32'b00000000000000111100000000000000; 
       5'h18: rom_data_grey = 32'b00000000000000011000000000000000; 
       5'h19: rom_data_grey = 32'b00000000000111111111100000000000; 
       5'h1a: rom_data_grey = 32'b00000000001111111111110000000000; 
       5'h1b: rom_data_grey = 32'b00000000011111111111111000000000; 
       5'h1c: rom_data_grey = 32'b00000000001111111111110000000000; 
       5'h1d: rom_data_grey = 32'b00000000000000011000000000000000; 
       5'h1e: rom_data_grey = 32'b00000000000000000000000000000000; 
       5'h1f: rom_data_grey = 32'b00000000000000000000000000000000; 
     endcase

	always @*
     case (rom_addr)
       5'h00: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h01: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h02: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h03: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h04: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h05: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h06: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h07: rom_data_white = 32'b00000000000000111100000000000000; 
       5'h08: rom_data_white = 32'b00000000000000011000000000000000; 
       5'h09: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h0a: rom_data_white = 32'b00000000000000100100000000000000; 
       5'h0b: rom_data_white = 32'b00000000000000111100000000000000; 
       5'h0c: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h0d: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h0e: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h0f: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h10: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h11: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h12: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h13: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h14: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h15: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h16: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h17: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h18: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h19: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h1a: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h1b: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h1c: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h1d: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h1e: rom_data_white = 32'b00000000000000000000000000000000; 
       5'h1f: rom_data_white = 32'b00000000000000000000000000000000; 
     endcase
	  
	  always @*
     case (rom_addr)
       5'h00: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h01: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h02: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h03: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h04: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h05: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h06: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h07: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h08: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h09: rom_data_red = 32'b00001110000000000000000001110000; 
       5'h0a: rom_data_red = 32'b00001110000000000000000001110000; 
       5'h0b: rom_data_red = 32'b00001110000000000000000001110000; 
       5'h0c: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h0d: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h0e: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h0f: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h10: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h11: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h12: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h13: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h14: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h15: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h16: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h17: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h18: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h19: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h1a: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h1b: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h1c: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h1d: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h1e: rom_data_red = 32'b00000000000000000000000000000000; 
       5'h1f: rom_data_red = 32'b00000000000000000000000000000000; 
     endcase
	  
	  always @*
     case (rom_addr)
       5'h00: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h01: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h02: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h03: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h04: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h05: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h06: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h07: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h08: rom_data_black = 32'b00000000000000100100000000000000; 
       5'h09: rom_data_black = 32'b00000000000000111100000000000000; 
       5'h0a: rom_data_black = 32'b00000000000000011000000000000000; 
       5'h0b: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h0c: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h0d: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h0e: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h0f: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h10: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h11: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h12: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h13: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h14: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h15: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h16: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h17: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h18: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h19: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h1a: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h1b: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h1c: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h1d: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h1e: rom_data_black = 32'b00000000000000000000000000000000; 
       5'h1f: rom_data_black = 32'b00000000000000000000000000000000; 
     endcase
	  
endmodule 
