transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib usb_system
vmap usb_system usb_system
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/usb_system.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_reset_controller.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_reset_synchronizer.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_1.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_sysid_qsys_0.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_sdram.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_red_leds.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_keycode.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_jtag_uart.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_cpu.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_cpu_cpu.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_cpu_cpu_debug_slave_sysclk.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_cpu_cpu_debug_slave_tck.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_cpu_cpu_debug_slave_wrapper.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_cpu_cpu_oci_test_bench.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_cpu_cpu_test_bench.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_clocks.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_avalon_mm_clock_crossing_bridge.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_avalon_dc_fifo.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_dcfifo_synchronizer_bundle.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_std_synchronizer_nocut.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_audio_pll_0.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_avalon_reset_from_locked_signal.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_altpll.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_av_config_serial_bus_controller.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_slow_clock_generator.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_av_config_auto_init.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_av_config_auto_init_ob_de2_115.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_av_config_auto_init_ob_audio.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_av_config_auto_init_ob_adv7180.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_audio_config.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_audio_bit_counter.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_audio_in_deserializer.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_audio_out_serializer.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_clock_edge.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_up_sync_fifo.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_audio.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_all_switches.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/CY7C67200_IF.v}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/font_rom.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/BrickList.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/VGA_controller.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/Color_Mapper.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/ball.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_irq_clock_crosser.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_irq_mapper.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_merlin_master_translator.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_avalon_st_handshake_clock_crosser.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_avalon_st_clock_crosser.v}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_rsp_mux_001.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_rsp_demux_003.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_rsp_demux_001.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_cmd_mux_003.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_cmd_demux_001.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_router_005.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_router_002.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_router_001.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/usb_system_mm_interconnect_0_router.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work usb_system +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/usb_system/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/Bouncing_Ball.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/text_luser.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/lab8_usb.sv}

vlog -sv -work work +incdir+C:/Users/Justin/Documents/ece385/final_project/lab8_usb {C:/Users/Justin/Documents/ece385/final_project/lab8_usb/testbench_color_mapper.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L usb_system -voptargs="+acc"  testbench_color_mapper

add wave *
view structure
view signals
run 1000 ms
