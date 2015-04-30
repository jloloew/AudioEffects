module final_project (	input	CLOCK_50, Reset,
						input  [17:0]	SW,
						output [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
						output [8:0]	LEDG,
						output [17:0]	LEDR,
						// VGA Interface 
						output [7:0]	VGA_R,
										VGA_G,
										VGA_B,
						output			VGA_clk,
										VGA_SYNC_N,
										VGA_BLANK_N,
										VGA_VS,
										VGA_HS,
						// SDRAM Interface for Nios II Software
						output [12:0]	DRAM_ADDR,	// SDRAM Address 13 Bits
						inout  [31:0]	DRAM_DQ,		// SDRAM Data 32 Bits
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
						output			AUD_XCK,//AUD_MCLK,
						output			AUD_DACDAT,
						input			AUD_DACLRCK,
						// Audio Config
						inout			I2C_SCLK,
						output			I2C_SDAT
					);
	
	logic aud_init, aud_init_finish, aud_adc_full, aud_data_over;
	logic [15:0] aud_ldata, aud_rdata;
	logic [31:0] aud_adcdata;
	logic [31:0] hex_input;
	
	assign LEDR = SW;
	
	final_project_soc nios_ii (	.clk_clk (CLOCK_50), .reset_reset_n (Reset),
								.ledg_wire_export (/*LEDG*/), .ledr_wire_export (/*LEDR*/),
								// SDRAM
								.sdram_wire_addr (DRAM_ADDR), .sdram_wire_ba (DRAM_BA),
								.sdram_wire_cas_n (DRAM_CAS_N), .sdram_wire_cke (DRAM_CKE),
								.sdram_wire_cs_n (DRAM_CS_N), .sdram_wire_dq (DRAM_DQ),
								.sdram_wire_dqm (DRAM_DQM), .sdram_wire_ras_n (DRAM_RAS_N),
								.sdram_wire_we_n (DRAM_WE_N), .sdram_clk_clk (DRAM_CLK),
								
								.unused_sdram_areset_conduit_export (), .unused_sdram_locked_conduit_export (),
								.unused_sdram_phasedone_conduit_export (),
								// Audio
								.audio_wire_ADCDAT (/*AUD_ADCDAT*/), .audio_wire_ADCLRCK (/*AUD_ADCLRCK*/),
								.audio_wire_BCLK (/*AUD_BCLK*/), .audio_wire_DACDAT (/*AUD_DACDAT*/),
								.audio_wire_DACLRCK (/*AUD_DACLRCK*/),
								// Audio Config
								.audio_config_wire_SDAT (/*I2C_SDAT*/), .audio_config_wire_SCLK (/*I2C_SCLK*/)
								);
	
	extern module audio_interface (	input			clk, Reset,
									input			INIT,
									output			INIT_FINISH,
									input [15:0]	LDATA, RDATA,
									output			adc_full,
									output			data_over,
									output			AUD_MCLK,
									input			AUD_BCLK,
									input			AUD_ADCDAT,
									output			AUD_DACDAT,
									input			AUD_ADCLRCK, AUD_DACLRCK,
									output			I2C_SDAT, I2C_SCLK,
									output [31:0]	ADCDATA
									);
	
	// Audio
	assign aud_init = ~aud_init_finish;
	assign LEDG[0] = aud_init_finish;
	assign LEDG[1] = aud_init;
	
	logic [31:0] counter = 32'b0;
	always_ff @ (posedge CLOCK_50)
	begin
		counter++;
		if (counter <= 32'd5000) begin
			aud_ldata = 16'h7FFF;
			aud_rdata = 16'h7FFF;
		end else begin
			aud_ldata = 16'h8000;
			aud_rdata = 16'h8000;
			if (counter >= 32'd10000)
				counter = 0;
		end
		hex_input = counter;
	end
	
	audio_interface aud_if (	.clk (CLOCK_50), .Reset, .INIT (aud_init),
								.INIT_FINISH (aud_init_finish),
								.LDATA (aud_ldata), .RDATA (aud_rdata),
								.adc_full (aud_adc_full), .data_over (aud_data_over),
								.AUD_MCLK (AUD_XCK), .AUD_BCLK,
								.AUD_ADCDAT, .AUD_DACDAT,
								.AUD_ADCLRCK, .AUD_DACLRCK,
								.I2C_SDAT, .I2C_SCLK,
								.ADCDATA (aud_adcdata)
								);
	
	// VGA
	assign VGA_R		= 8'h00;
	assign VGA_G		= 8'h00;
	assign VGA_B		= 8'h00;
	assign VGA_clk		= 1'b0;
	assign VGA_SYNC_N	= 1'b0;
	assign VGA_BLANK_N	= 1'b0;
	assign VGA_VS		= 1'b0;
	assign VGA_HS		= 1'b0;
	
	// Hex Displays
//	assign hex_input = aud_adcdata;
//	assign hex_input = counter;
	
	HexDriver hex0 (.In0 (hex_input[3:0]),		.Out0 (HEX0));
	HexDriver hex1 (.In0 (hex_input[7:4]),		.Out0 (HEX1));
	HexDriver hex2 (.In0 (hex_input[11:8]),		.Out0 (HEX2));
	HexDriver hex3 (.In0 (hex_input[15:12]),	.Out0 (HEX3));
	HexDriver hex4 (.In0 (hex_input[19:16]),	.Out0 (HEX4));
	HexDriver hex5 (.In0 (hex_input[23:20]),	.Out0 (HEX5));
	HexDriver hex6 (.In0 (hex_input[27:24]),	.Out0 (HEX6));
	HexDriver hex7 (.In0 (hex_input[31:28]),	.Out0 (HEX7));
	
endmodule
