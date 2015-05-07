
# (C) 2001-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 14.1 190 win32 2015.05.06.20:15:52

# ----------------------------------------
# vcsmx - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="usb_system"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="C:/altera/14.1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `vcs -platform` != *"amd64"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/crosser/
mkdir -p ./libraries/rsp_mux_001/
mkdir -p ./libraries/rsp_mux/
mkdir -p ./libraries/rsp_demux_003/
mkdir -p ./libraries/rsp_demux_001/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux_003/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux_001/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/router_005/
mkdir -p ./libraries/router_002/
mkdir -p ./libraries/router_001/
mkdir -p ./libraries/router/
mkdir -p ./libraries/audio_avalon_audio_slave_agent_rsp_fifo/
mkdir -p ./libraries/audio_avalon_audio_slave_agent/
mkdir -p ./libraries/cpu_data_master_agent/
mkdir -p ./libraries/audio_avalon_audio_slave_translator/
mkdir -p ./libraries/cpu_data_master_translator/
mkdir -p ./libraries/cpu/
mkdir -p ./libraries/reset_from_locked/
mkdir -p ./libraries/audio_pll/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/irq_synchronizer/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/mm_interconnect_1/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/sysid_qsys_0/
mkdir -p ./libraries/sdram/
mkdir -p ./libraries/red_leds/
mkdir -p ./libraries/keycode/
mkdir -p ./libraries/jtag_uart/
mkdir -p ./libraries/clocks/
mkdir -p ./libraries/clock_crossing_io/
mkdir -p ./libraries/audio_pll_0/
mkdir -p ./libraries/audio_config/
mkdir -p ./libraries/audio/
mkdir -p ./libraries/all_switches/
mkdir -p ./libraries/CY7C67200_IF_0/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/cycloneive_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/usb_system_cpu_cpu_ociram_default_contents.dat ./
  cp -f $QSYS_SIMDIR/submodules/usb_system_cpu_cpu_ociram_default_contents.hex ./
  cp -f $QSYS_SIMDIR/submodules/usb_system_cpu_cpu_ociram_default_contents.mif ./
  cp -f $QSYS_SIMDIR/submodules/usb_system_cpu_cpu_rf_ram_a.dat ./
  cp -f $QSYS_SIMDIR/submodules/usb_system_cpu_cpu_rf_ram_a.hex ./
  cp -f $QSYS_SIMDIR/submodules/usb_system_cpu_cpu_rf_ram_a.mif ./
  cp -f $QSYS_SIMDIR/submodules/usb_system_cpu_cpu_rf_ram_b.dat ./
  cp -f $QSYS_SIMDIR/submodules/usb_system_cpu_cpu_rf_ram_b.hex ./
  cp -f $QSYS_SIMDIR/submodules/usb_system_cpu_cpu_rf_ram_b.mif ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
  vlogan +v2k -sverilog "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"  -work cycloneive_ver  
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"    -work crosser                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"              -work crosser                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"              -work crosser                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                   -work rsp_mux_001                            
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_rsp_mux_001.sv"   -work rsp_mux_001                            
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                   -work rsp_mux                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_rsp_mux.sv"       -work rsp_mux                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_rsp_demux_003.sv" -work rsp_demux_003                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_rsp_demux_001.sv" -work rsp_demux_001                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_rsp_demux.sv"     -work rsp_demux                              
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                   -work cmd_mux_003                            
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_cmd_mux_003.sv"   -work cmd_mux_003                            
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                   -work cmd_mux                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_cmd_mux.sv"       -work cmd_mux                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_cmd_demux_001.sv" -work cmd_demux_001                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_cmd_demux.sv"     -work cmd_demux                              
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_router_005.sv"    -work router_005                             
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_router_002.sv"    -work router_002                             
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_router_001.sv"    -work router_001                             
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_router.sv"        -work router                                 
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                       -work audio_avalon_audio_slave_agent_rsp_fifo
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                  -work audio_avalon_audio_slave_agent         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"           -work audio_avalon_audio_slave_agent         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                 -work cpu_data_master_agent                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"             -work audio_avalon_audio_slave_translator    
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"            -work cpu_data_master_translator             
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu.v"                          -work cpu                                    
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu_debug_slave_sysclk.v"       -work cpu                                    
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu_debug_slave_tck.v"          -work cpu                                    
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu_debug_slave_wrapper.v"      -work cpu                                    
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu_oci_test_bench.v"           -work cpu                                    
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu_test_bench.v"               -work cpu                                    
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_avalon_reset_from_locked_signal.v"   -work reset_from_locked                      
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_altpll.v"                            -work audio_pll                              
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                     -work rst_controller                         
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                   -work rst_controller                         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_irq_clock_crosser.sv"                   -work irq_synchronizer                       
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/usb_system_irq_mapper.sv"                      -work irq_mapper                             
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_1.v"                -work mm_interconnect_1                      
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0.v"                -work mm_interconnect_0                      
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_sysid_qsys_0.vo"                    -work sysid_qsys_0                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_sdram.v"                            -work sdram                                  
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_red_leds.v"                         -work red_leds                               
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_keycode.v"                          -work keycode                                
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_jtag_uart.v"                        -work jtag_uart                              
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_cpu.v"                              -work cpu                                    
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_clocks.vo"                          -work clocks                                 
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_mm_clock_crossing_bridge.v"      -work clock_crossing_io                      
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v"                       -work clock_crossing_io                      
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v"           -work clock_crossing_io                      
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"               -work clock_crossing_io                      
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_audio_pll_0.v"                      -work audio_pll_0                            
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_av_config_serial_bus_controller.v"   -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_slow_clock_generator.v"              -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init.v"               -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_dc2.v"           -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_d5m.v"           -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_lcm.v"           -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ltm.v"           -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_de1_soc.v"    -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_de2_115.v"    -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_audio.v"      -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_adv7180.v"    -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_av_config_auto_init_ob_adv7181.v"    -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_audio_config.v"                     -work audio_config                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_audio_bit_counter.v"                 -work audio                                  
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_audio_in_deserializer.v"             -work audio                                  
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_audio_out_serializer.v"              -work audio                                  
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_clock_edge.v"                        -work audio                                  
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_up_sync_fifo.v"                         -work audio                                  
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_audio.v"                            -work audio                                  
  vlogan +v2k           "$QSYS_SIMDIR/submodules/usb_system_all_switches.v"                     -work all_switches                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/CY7C67200_IF.v"                                -work CY7C67200_IF_0                         
  vlogan +v2k           "$QSYS_SIMDIR/usb_system.v"                                                                                          
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  vcs -lca -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
