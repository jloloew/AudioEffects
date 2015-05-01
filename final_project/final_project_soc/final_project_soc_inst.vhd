	component final_project_soc is
		port (
			audio_config_wire_SDAT                : inout std_logic                     := 'X';             -- SDAT
			audio_config_wire_SCLK                : out   std_logic;                                        -- SCLK
			audio_wire_ADCDAT                     : in    std_logic                     := 'X';             -- ADCDAT
			audio_wire_ADCLRCK                    : in    std_logic                     := 'X';             -- ADCLRCK
			audio_wire_BCLK                       : in    std_logic                     := 'X';             -- BCLK
			audio_wire_DACDAT                     : out   std_logic;                                        -- DACDAT
			audio_wire_DACLRCK                    : in    std_logic                     := 'X';             -- DACLRCK
			clk_clk                               : in    std_logic                     := 'X';             -- clk
			ledg_wire_export                      : out   std_logic_vector(7 downto 0);                     -- export
			ledr_wire_export                      : out   std_logic_vector(17 downto 0);                    -- export
			reset_reset_n                         : in    std_logic                     := 'X';             -- reset_n
			sdram_clk_clk                         : out   std_logic;                                        -- clk
			sdram_wire_addr                       : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba                         : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n                      : out   std_logic;                                        -- cas_n
			sdram_wire_cke                        : out   std_logic;                                        -- cke
			sdram_wire_cs_n                       : out   std_logic;                                        -- cs_n
			sdram_wire_dq                         : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm                        : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_wire_ras_n                      : out   std_logic;                                        -- ras_n
			sdram_wire_we_n                       : out   std_logic;                                        -- we_n
			unused_sdram_areset_conduit_export    : in    std_logic                     := 'X';             -- export
			unused_sdram_locked_conduit_export    : out   std_logic;                                        -- export
			unused_sdram_phasedone_conduit_export : out   std_logic                                         -- export
		);
	end component final_project_soc;

	u0 : component final_project_soc
		port map (
			audio_config_wire_SDAT                => CONNECTED_TO_audio_config_wire_SDAT,                --              audio_config_wire.SDAT
			audio_config_wire_SCLK                => CONNECTED_TO_audio_config_wire_SCLK,                --                               .SCLK
			audio_wire_ADCDAT                     => CONNECTED_TO_audio_wire_ADCDAT,                     --                     audio_wire.ADCDAT
			audio_wire_ADCLRCK                    => CONNECTED_TO_audio_wire_ADCLRCK,                    --                               .ADCLRCK
			audio_wire_BCLK                       => CONNECTED_TO_audio_wire_BCLK,                       --                               .BCLK
			audio_wire_DACDAT                     => CONNECTED_TO_audio_wire_DACDAT,                     --                               .DACDAT
			audio_wire_DACLRCK                    => CONNECTED_TO_audio_wire_DACLRCK,                    --                               .DACLRCK
			clk_clk                               => CONNECTED_TO_clk_clk,                               --                            clk.clk
			ledg_wire_export                      => CONNECTED_TO_ledg_wire_export,                      --                      ledg_wire.export
			ledr_wire_export                      => CONNECTED_TO_ledr_wire_export,                      --                      ledr_wire.export
			reset_reset_n                         => CONNECTED_TO_reset_reset_n,                         --                          reset.reset_n
			sdram_clk_clk                         => CONNECTED_TO_sdram_clk_clk,                         --                      sdram_clk.clk
			sdram_wire_addr                       => CONNECTED_TO_sdram_wire_addr,                       --                     sdram_wire.addr
			sdram_wire_ba                         => CONNECTED_TO_sdram_wire_ba,                         --                               .ba
			sdram_wire_cas_n                      => CONNECTED_TO_sdram_wire_cas_n,                      --                               .cas_n
			sdram_wire_cke                        => CONNECTED_TO_sdram_wire_cke,                        --                               .cke
			sdram_wire_cs_n                       => CONNECTED_TO_sdram_wire_cs_n,                       --                               .cs_n
			sdram_wire_dq                         => CONNECTED_TO_sdram_wire_dq,                         --                               .dq
			sdram_wire_dqm                        => CONNECTED_TO_sdram_wire_dqm,                        --                               .dqm
			sdram_wire_ras_n                      => CONNECTED_TO_sdram_wire_ras_n,                      --                               .ras_n
			sdram_wire_we_n                       => CONNECTED_TO_sdram_wire_we_n,                       --                               .we_n
			unused_sdram_areset_conduit_export    => CONNECTED_TO_unused_sdram_areset_conduit_export,    --    unused_sdram_areset_conduit.export
			unused_sdram_locked_conduit_export    => CONNECTED_TO_unused_sdram_locked_conduit_export,    --    unused_sdram_locked_conduit.export
			unused_sdram_phasedone_conduit_export => CONNECTED_TO_unused_sdram_phasedone_conduit_export  -- unused_sdram_phasedone_conduit.export
		);

