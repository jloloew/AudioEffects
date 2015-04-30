	final_project_soc u0 (
		.clk_clk                               (<connected-to-clk_clk>),                               //                            clk.clk
		.sdram_wire_addr                       (<connected-to-sdram_wire_addr>),                       //                     sdram_wire.addr
		.sdram_wire_ba                         (<connected-to-sdram_wire_ba>),                         //                               .ba
		.sdram_wire_cas_n                      (<connected-to-sdram_wire_cas_n>),                      //                               .cas_n
		.sdram_wire_cke                        (<connected-to-sdram_wire_cke>),                        //                               .cke
		.sdram_wire_cs_n                       (<connected-to-sdram_wire_cs_n>),                       //                               .cs_n
		.sdram_wire_dq                         (<connected-to-sdram_wire_dq>),                         //                               .dq
		.sdram_wire_dqm                        (<connected-to-sdram_wire_dqm>),                        //                               .dqm
		.sdram_wire_ras_n                      (<connected-to-sdram_wire_ras_n>),                      //                               .ras_n
		.sdram_wire_we_n                       (<connected-to-sdram_wire_we_n>),                       //                               .we_n
		.reset_reset_n                         (<connected-to-reset_reset_n>),                         //                          reset.reset_n
		.ledg_wire_export                      (<connected-to-ledg_wire_export>),                      //                      ledg_wire.export
		.ledr_wire_export                      (<connected-to-ledr_wire_export>),                      //                      ledr_wire.export
		.sdram_clk_clk                         (<connected-to-sdram_clk_clk>),                         //                      sdram_clk.clk
		.unused_sdram_areset_conduit_export    (<connected-to-unused_sdram_areset_conduit_export>),    //    unused_sdram_areset_conduit.export
		.unused_sdram_locked_conduit_export    (<connected-to-unused_sdram_locked_conduit_export>),    //    unused_sdram_locked_conduit.export
		.unused_sdram_phasedone_conduit_export (<connected-to-unused_sdram_phasedone_conduit_export>), // unused_sdram_phasedone_conduit.export
		.audio_wire_ADCDAT                     (<connected-to-audio_wire_ADCDAT>),                     //                     audio_wire.ADCDAT
		.audio_wire_ADCLRCK                    (<connected-to-audio_wire_ADCLRCK>),                    //                               .ADCLRCK
		.audio_wire_BCLK                       (<connected-to-audio_wire_BCLK>),                       //                               .BCLK
		.audio_wire_DACDAT                     (<connected-to-audio_wire_DACDAT>),                     //                               .DACDAT
		.audio_wire_DACLRCK                    (<connected-to-audio_wire_DACLRCK>),                    //                               .DACLRCK
		.audio_config_wire_SDAT                (<connected-to-audio_config_wire_SDAT>),                //              audio_config_wire.SDAT
		.audio_config_wire_SCLK                (<connected-to-audio_config_wire_SCLK>)                 //                               .SCLK
	);

