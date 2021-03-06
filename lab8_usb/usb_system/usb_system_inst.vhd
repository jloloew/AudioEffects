	component usb_system is
		port (
			all_switches_wire_export : in    std_logic_vector(17 downto 0) := (others => 'X'); -- export
			clk_clk                  : in    std_logic                     := 'X';             -- clk
			keycode_export           : out   std_logic_vector(7 downto 0);                     -- export
			led_wire_export          : out   std_logic_vector(7 downto 0);                     -- export
			red_leds_wire_export     : out   std_logic_vector(17 downto 0);                    -- export
			reset_reset_n            : in    std_logic                     := 'X';             -- reset_n
			sdram_out_clk_clk        : out   std_logic;                                        -- clk
			sdram_wire_addr          : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba            : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n         : out   std_logic;                                        -- cas_n
			sdram_wire_cke           : out   std_logic;                                        -- cke
			sdram_wire_cs_n          : out   std_logic;                                        -- cs_n
			sdram_wire_dq            : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm           : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_wire_ras_n         : out   std_logic;                                        -- ras_n
			sdram_wire_we_n          : out   std_logic;                                        -- we_n
			usb_DATA                 : inout std_logic_vector(15 downto 0) := (others => 'X'); -- DATA
			usb_ADDR                 : out   std_logic_vector(1 downto 0);                     -- ADDR
			usb_RD_N                 : out   std_logic;                                        -- RD_N
			usb_WR_N                 : out   std_logic;                                        -- WR_N
			usb_CS_N                 : out   std_logic;                                        -- CS_N
			usb_RST_N                : out   std_logic;                                        -- RST_N
			usb_INT                  : in    std_logic                     := 'X';             -- INT
			usb_out_clk_clk          : out   std_logic;                                        -- clk
			audio_wire_ADCDAT        : in    std_logic                     := 'X';             -- ADCDAT
			audio_wire_ADCLRCK       : in    std_logic                     := 'X';             -- ADCLRCK
			audio_wire_BCLK          : in    std_logic                     := 'X';             -- BCLK
			audio_wire_DACDAT        : out   std_logic;                                        -- DACDAT
			audio_wire_DACLRCK       : in    std_logic                     := 'X';             -- DACLRCK
			audio_config_wire_SDAT   : inout std_logic                     := 'X';             -- SDAT
			audio_config_wire_SCLK   : out   std_logic                                         -- SCLK
		);
	end component usb_system;

	u0 : component usb_system
		port map (
			all_switches_wire_export => CONNECTED_TO_all_switches_wire_export, -- all_switches_wire.export
			clk_clk                  => CONNECTED_TO_clk_clk,                  --               clk.clk
			keycode_export           => CONNECTED_TO_keycode_export,           --           keycode.export
			led_wire_export          => CONNECTED_TO_led_wire_export,          --          led_wire.export
			red_leds_wire_export     => CONNECTED_TO_red_leds_wire_export,     --     red_leds_wire.export
			reset_reset_n            => CONNECTED_TO_reset_reset_n,            --             reset.reset_n
			sdram_out_clk_clk        => CONNECTED_TO_sdram_out_clk_clk,        --     sdram_out_clk.clk
			sdram_wire_addr          => CONNECTED_TO_sdram_wire_addr,          --        sdram_wire.addr
			sdram_wire_ba            => CONNECTED_TO_sdram_wire_ba,            --                  .ba
			sdram_wire_cas_n         => CONNECTED_TO_sdram_wire_cas_n,         --                  .cas_n
			sdram_wire_cke           => CONNECTED_TO_sdram_wire_cke,           --                  .cke
			sdram_wire_cs_n          => CONNECTED_TO_sdram_wire_cs_n,          --                  .cs_n
			sdram_wire_dq            => CONNECTED_TO_sdram_wire_dq,            --                  .dq
			sdram_wire_dqm           => CONNECTED_TO_sdram_wire_dqm,           --                  .dqm
			sdram_wire_ras_n         => CONNECTED_TO_sdram_wire_ras_n,         --                  .ras_n
			sdram_wire_we_n          => CONNECTED_TO_sdram_wire_we_n,          --                  .we_n
			usb_DATA                 => CONNECTED_TO_usb_DATA,                 --               usb.DATA
			usb_ADDR                 => CONNECTED_TO_usb_ADDR,                 --                  .ADDR
			usb_RD_N                 => CONNECTED_TO_usb_RD_N,                 --                  .RD_N
			usb_WR_N                 => CONNECTED_TO_usb_WR_N,                 --                  .WR_N
			usb_CS_N                 => CONNECTED_TO_usb_CS_N,                 --                  .CS_N
			usb_RST_N                => CONNECTED_TO_usb_RST_N,                --                  .RST_N
			usb_INT                  => CONNECTED_TO_usb_INT,                  --                  .INT
			usb_out_clk_clk          => CONNECTED_TO_usb_out_clk_clk,          --       usb_out_clk.clk
			audio_wire_ADCDAT        => CONNECTED_TO_audio_wire_ADCDAT,        --        audio_wire.ADCDAT
			audio_wire_ADCLRCK       => CONNECTED_TO_audio_wire_ADCLRCK,       --                  .ADCLRCK
			audio_wire_BCLK          => CONNECTED_TO_audio_wire_BCLK,          --                  .BCLK
			audio_wire_DACDAT        => CONNECTED_TO_audio_wire_DACDAT,        --                  .DACDAT
			audio_wire_DACLRCK       => CONNECTED_TO_audio_wire_DACLRCK,       --                  .DACLRCK
			audio_config_wire_SDAT   => CONNECTED_TO_audio_config_wire_SDAT,   -- audio_config_wire.SDAT
			audio_config_wire_SCLK   => CONNECTED_TO_audio_config_wire_SCLK    --                  .SCLK
		);

