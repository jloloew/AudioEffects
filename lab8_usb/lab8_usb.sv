//-------------------------------------------------------------------------
//      lab7_usb.sv                                                      --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Fall 2014 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 7                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module  lab8_usb 		( input      Clk,
                                     Reset,
									 input [17:0] SW,
							  output [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
							  output [8:0]  LEDG,
							  output [17:0] LEDR,
							  // VGA Interface 
							  output [7:0]  Red,
							                Green,
												 Blue,
							  output        VGA_clk,
							                sync,
												 blank,
												 vs,
												 hs,
							  // CY7C67200 Interface
							  inout [15:0]  OTG_DATA,						//	CY7C67200 Data bus 16 Bits
							  output [1:0]  OTG_ADDR,						//	CY7C67200 Address 2 Bits
							  output        OTG_CS_N,						//	CY7C67200 Chip Select
												 OTG_RD_N,						//	CY7C67200 Write
												 OTG_WR_N,						//	CY7C67200 Read
												 OTG_RST_N,						//	CY7C67200 Reset
							  input			 OTG_INT,						//	CY7C67200 Interrupt
							  // SDRAM Interface for Nios II Software
							  output [12:0] sdram_wire_addr,				// SDRAM Address 13 Bits
							  inout [31:0]  sdram_wire_dq,				// SDRAM Data 32 Bits
							  output [1:0]  sdram_wire_ba,				// SDRAM Bank Address 2 Bits
							  output [3:0]  sdram_wire_dqm,				// SDRAM Data Mast 4 Bits
							  output			 sdram_wire_ras_n,			// SDRAM Row Address Strobe
							  output			 sdram_wire_cas_n,			// SDRAM Column Address Strobe
							  output			 sdram_wire_cke,				// SDRAM Clock Enable
							  output			 sdram_wire_we_n,				// SDRAM Write Enable
							  output			 sdram_wire_cs_n,				// SDRAM Chip Select
							  output			 sdram_clk						// SDRAM Clock
											);
    
    logic Reset_h;
	logic [7:0] keycode;
	wire OTG_FSPEED, OTG_LSPEED;
	
    assign {Reset_h}=~ (Reset);  // The push buttons are active low
	assign OTG_FSPEED = 1'bz;
	assign OTG_LSPEED = 1'bz;
	    
	 usb_system usbsys_instance(
										 .clk_clk(Clk),         
										 .reset_reset_n(1'b1),   
										 .all_switches_wire_export(SW),
										 .led_wire_export(LEDG),
										 .red_leds_wire_export(LEDR),
										 .sdram_wire_addr(sdram_wire_addr), 
										 .sdram_wire_ba(sdram_wire_ba),   
										 .sdram_wire_cas_n(sdram_wire_cas_n),
										 .sdram_wire_cke(sdram_wire_cke),  
										 .sdram_wire_cs_n(sdram_wire_cs_n), 
										 .sdram_wire_dq(sdram_wire_dq),   
										 .sdram_wire_dqm(sdram_wire_dqm),  
										 .sdram_wire_ras_n(sdram_wire_ras_n),
										 .sdram_wire_we_n(sdram_wire_we_n), 
										 .sdram_out_clk_clk(sdram_clk),
										 .keycode_export(keycode),  
										 .usb_DATA(OTG_DATA),    
										 .usb_ADDR(OTG_ADDR),    
										 .usb_RD_N(OTG_RD_N),    
										 .usb_WR_N(OTG_WR_N),    
										 .usb_CS_N(OTG_CS_N),    
										 .usb_RST_N(OTG_RST_N),   
										 .usb_INT(OTG_INT) );
	
	logic [31:0] hex_input = 32'h8BADF00D;
	
	HexDriver hex_inst_0 (.In0(hex_input[3:0]),		.Out0(HEX0));
	HexDriver hex_inst_1 (.In0(hex_input[7:4]),		.Out0(HEX1));
	HexDriver hex_inst_2 (.In0(hex_input[11:8]),	.Out0(HEX2));
	HexDriver hex_inst_3 (.In0(hex_input[15:12]),	.Out0(HEX3));
	HexDriver hex_inst_4 (.In0(hex_input[19:16]),	.Out0(HEX4));
	HexDriver hex_inst_5 (.In0(hex_input[23:20]),	.Out0(HEX5));
	HexDriver hex_inst_6 (.In0(hex_input[27:24]),	.Out0(HEX6));
	HexDriver hex_inst_7 (.In0(hex_input[31:28]),	.Out0(HEX7));
	
	Bouncing_Ball bouncingBall (.*, .Reset (Reset_h));
    
endmodule
