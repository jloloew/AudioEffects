
module final_project_soc (
	clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	reset_reset_n,
	ledg_wire_export,
	ledr_wire_export,
	sdram_clk_clk,
	unused_sdram_areset_conduit_export,
	unused_sdram_locked_conduit_export,
	unused_sdram_phasedone_conduit_export,
	audio_wire_ADCDAT,
	audio_wire_ADCLRCK,
	audio_wire_BCLK,
	audio_wire_DACDAT,
	audio_wire_DACLRCK,
	audio_config_wire_SDAT,
	audio_config_wire_SCLK);	

	input		clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[31:0]	sdram_wire_dq;
	output	[3:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		reset_reset_n;
	output	[7:0]	ledg_wire_export;
	output	[17:0]	ledr_wire_export;
	output		sdram_clk_clk;
	input		unused_sdram_areset_conduit_export;
	output		unused_sdram_locked_conduit_export;
	output		unused_sdram_phasedone_conduit_export;
	input		audio_wire_ADCDAT;
	input		audio_wire_ADCLRCK;
	input		audio_wire_BCLK;
	output		audio_wire_DACDAT;
	input		audio_wire_DACLRCK;
	inout		audio_config_wire_SDAT;
	output		audio_config_wire_SCLK;
endmodule
