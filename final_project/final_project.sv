
`timescale 1 ns / 1 ns
module final_project (	input	CLOCK_50, Reset,
						output [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
						output [8:0]	LEDG,
						output [17:0]	LEDR,
						input [17:0]	SW,
						// VGA Interface 
						output [7:0]	VGA_R,
										VGA_G,
										VGA_B,
						output			VGA_CLK,
										VGA_SYNC_N,
										VGA_BLANK_N,
										VGA_VS,
										VGA_HS,
						// SDRAM Interface for Nios II Software
						output [12:0]	DRAM_ADDR,	// SDRAM Address 13 Bits
						inout [31:0]	DRAM_DQ,		// SDRAM Data 32 Bits
						output [1:0]	DRAM_BA,		// SDRAM Bank Address 2 Bits
						output [3:0]	DRAM_DQM,		// SDRAM Data Mast 4 Bits
						output			DRAM_RAS_N,	// SDRAM Row Address Strobe
						output			DRAM_CAS_N,	// SDRAM Column Address Strobe
						output			DRAM_CKE,		// SDRAM Clock Enable
						output			DRAM_WE_N,	// SDRAM Write Enable
						output			DRAM_CS_N,	// SDRAM Chip Select
						output			DRAM_CLK,			// SDRAM Clock
						// Audio
						input			AUD_ADCDAT,
						input			AUD_ADCLRCK,
						input			AUD_BCLK,
						output			AUD_DACDAT,
						input			AUD_DACLRCK,
						// Audio Config
						inout			I2C_SCLK,
						output			I2C_SDAT
					);
	
	logic [31:0] hex_input;
	logic [9:0] DrawX, DrawY;
	
	// there isn't enough free board area to use this
//	ping_pong_game ping_pong ( .clk (CLOCK_50), .Reset, .SW, .LEDR );
	
	final_project_soc nios_ii (	.clk_clk (CLOCK_50), .reset_reset_n (Reset),
								.ledg_wire_export (LEDG), .ledr_wire_export (),
								// SDRAM
								.sdram_wire_addr (DRAM_ADDR), .sdram_wire_ba (DRAM_BA),
								.sdram_wire_cas_n (DRAM_CAS_N), .sdram_wire_cke (DRAM_CKE),
								.sdram_wire_cs_n (DRAM_CS_N), .sdram_wire_dq (DRAM_DQ),
								.sdram_wire_dqm (DRAM_DQM), .sdram_wire_ras_n (DRAM_RAS_N),
								.sdram_wire_we_n (DRAM_WE_N), .sdram_clk_clk (DRAM_CLK),
								
								.unused_sdram_areset_conduit_export (), .unused_sdram_locked_conduit_export (),
								.unused_sdram_phasedone_conduit_export (),
								// Audio
								.audio_wire_ADCDAT (AUD_ADCDAT), .audio_wire_ADCLRCK (AUD_ADCLRCK),
								.audio_wire_BCLK (AUD_BCLK), .audio_wire_DACDAT (AUD_DACDAT),
								.audio_wire_DACLRCK (AUD_DACLRCK),
								// Audio Config
								.audio_config_wire_SDAT (I2C_SDAT), .audio_config_wire_SCLK (I2C_SCLK)
								);	
	
	
	// VGA
	Display display (	.Clk (CLOCK_50), .Reset,
						.Red (VGA_R), .Green (VGA_G), .Blue (VGA_B),
						.VGA_clk (VGA_CLK), .sync (VGA_SYNC_N), .blank (VGA_BLANK_N),
						.vs (VGA_VS), .hs (VGA_HS)
					);
	
	// Hex Displays
	assign hex_input = 32'h8BADF00D;
	
	HexDriver hex0 (.In0 (hex_input[3:0]),		.Out0 (HEX0));
	HexDriver hex1 (.In0 (hex_input[7:4]),		.Out0 (HEX1));
	HexDriver hex2 (.In0 (hex_input[11:8]),		.Out0 (HEX2));
	HexDriver hex3 (.In0 (hex_input[15:12]),	.Out0 (HEX3));
	HexDriver hex4 (.In0 (hex_input[19:16]),	.Out0 (HEX4));
	HexDriver hex5 (.In0 (hex_input[23:20]),	.Out0 (HEX5));
	HexDriver hex6 (.In0 (hex_input[27:24]),	.Out0 (HEX6));
	HexDriver hex7 (.In0 (hex_input[31:28]),	.Out0 (HEX7));
	
endmodule
