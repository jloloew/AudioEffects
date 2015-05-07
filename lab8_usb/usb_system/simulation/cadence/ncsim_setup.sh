
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

# ACDS 14.1 190 win32 2015.05.06.19:04:01

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="usb_system"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/altera/14.1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

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
if [[ `ncsim -version` != *"ncsim(64)"* ]]; then
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
mkdir -p ./libraries/rsp_demux_001/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux_001/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux_001/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/router_003/
mkdir -p ./libraries/router_002/
mkdir -p ./libraries/router_001/
mkdir -p ./libraries/router/
mkdir -p ./libraries/jtag_uart_avalon_jtag_slave_agent_rsp_fifo/
mkdir -p ./libraries/jtag_uart_avalon_jtag_slave_agent/
mkdir -p ./libraries/cpu_data_master_agent/
mkdir -p ./libraries/jtag_uart_avalon_jtag_slave_translator/
mkdir -p ./libraries/cpu_data_master_translator/
mkdir -p ./libraries/cpu/
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
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
  ncvlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"  -work cycloneive_ver  
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"    -work crosser                                    -cdslib ./cds_libs/crosser.cds.lib                                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"              -work crosser                                    -cdslib ./cds_libs/crosser.cds.lib                                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"              -work crosser                                    -cdslib ./cds_libs/crosser.cds.lib                                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                   -work rsp_mux_001                                -cdslib ./cds_libs/rsp_mux_001.cds.lib                               
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_rsp_mux_001.sv"   -work rsp_mux_001                                -cdslib ./cds_libs/rsp_mux_001.cds.lib                               
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                   -work rsp_mux                                    -cdslib ./cds_libs/rsp_mux.cds.lib                                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_rsp_mux.sv"       -work rsp_mux                                    -cdslib ./cds_libs/rsp_mux.cds.lib                                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_rsp_demux_001.sv" -work rsp_demux_001                              -cdslib ./cds_libs/rsp_demux_001.cds.lib                             
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_rsp_demux.sv"     -work rsp_demux                                  -cdslib ./cds_libs/rsp_demux.cds.lib                                 
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                   -work cmd_mux_001                                -cdslib ./cds_libs/cmd_mux_001.cds.lib                               
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_cmd_mux_001.sv"   -work cmd_mux_001                                -cdslib ./cds_libs/cmd_mux_001.cds.lib                               
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                   -work cmd_mux                                    -cdslib ./cds_libs/cmd_mux.cds.lib                                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_cmd_mux.sv"       -work cmd_mux                                    -cdslib ./cds_libs/cmd_mux.cds.lib                                   
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_cmd_demux_001.sv" -work cmd_demux_001                              -cdslib ./cds_libs/cmd_demux_001.cds.lib                             
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_cmd_demux.sv"     -work cmd_demux                                  -cdslib ./cds_libs/cmd_demux.cds.lib                                 
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_router_003.sv"    -work router_003                                 -cdslib ./cds_libs/router_003.cds.lib                                
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_router_002.sv"    -work router_002                                 -cdslib ./cds_libs/router_002.cds.lib                                
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_router_001.sv"    -work router_001                                 -cdslib ./cds_libs/router_001.cds.lib                                
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0_router.sv"        -work router                                     -cdslib ./cds_libs/router.cds.lib                                    
  ncvlog     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                       -work jtag_uart_avalon_jtag_slave_agent_rsp_fifo -cdslib ./cds_libs/jtag_uart_avalon_jtag_slave_agent_rsp_fifo.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                  -work jtag_uart_avalon_jtag_slave_agent          -cdslib ./cds_libs/jtag_uart_avalon_jtag_slave_agent.cds.lib         
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"           -work jtag_uart_avalon_jtag_slave_agent          -cdslib ./cds_libs/jtag_uart_avalon_jtag_slave_agent.cds.lib         
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                 -work cpu_data_master_agent                      -cdslib ./cds_libs/cpu_data_master_agent.cds.lib                     
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"             -work jtag_uart_avalon_jtag_slave_translator     -cdslib ./cds_libs/jtag_uart_avalon_jtag_slave_translator.cds.lib    
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"            -work cpu_data_master_translator                 -cdslib ./cds_libs/cpu_data_master_translator.cds.lib                
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu.v"                          -work cpu                                        -cdslib ./cds_libs/cpu.cds.lib                                       
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu_debug_slave_sysclk.v"       -work cpu                                        -cdslib ./cds_libs/cpu.cds.lib                                       
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu_debug_slave_tck.v"          -work cpu                                        -cdslib ./cds_libs/cpu.cds.lib                                       
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu_debug_slave_wrapper.v"      -work cpu                                        -cdslib ./cds_libs/cpu.cds.lib                                       
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu_oci_test_bench.v"           -work cpu                                        -cdslib ./cds_libs/cpu.cds.lib                                       
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_cpu_cpu_test_bench.v"               -work cpu                                        -cdslib ./cds_libs/cpu.cds.lib                                       
  ncvlog     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                     -work rst_controller                             -cdslib ./cds_libs/rst_controller.cds.lib                            
  ncvlog     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                   -work rst_controller                             -cdslib ./cds_libs/rst_controller.cds.lib                            
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_irq_clock_crosser.sv"                   -work irq_synchronizer                           -cdslib ./cds_libs/irq_synchronizer.cds.lib                          
  ncvlog -sv "$QSYS_SIMDIR/submodules/usb_system_irq_mapper.sv"                      -work irq_mapper                                 -cdslib ./cds_libs/irq_mapper.cds.lib                                
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_1.v"                -work mm_interconnect_1                          -cdslib ./cds_libs/mm_interconnect_1.cds.lib                         
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_mm_interconnect_0.v"                -work mm_interconnect_0                          -cdslib ./cds_libs/mm_interconnect_0.cds.lib                         
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_sysid_qsys_0.vo"                    -work sysid_qsys_0                               -cdslib ./cds_libs/sysid_qsys_0.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_sdram.v"                            -work sdram                                      -cdslib ./cds_libs/sdram.cds.lib                                     
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_red_leds.v"                         -work red_leds                                   -cdslib ./cds_libs/red_leds.cds.lib                                  
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_keycode.v"                          -work keycode                                    -cdslib ./cds_libs/keycode.cds.lib                                   
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_jtag_uart.v"                        -work jtag_uart                                  -cdslib ./cds_libs/jtag_uart.cds.lib                                 
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_cpu.v"                              -work cpu                                        -cdslib ./cds_libs/cpu.cds.lib                                       
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_clocks.vo"                          -work clocks                                     -cdslib ./cds_libs/clocks.cds.lib                                    
  ncvlog     "$QSYS_SIMDIR/submodules/altera_avalon_mm_clock_crossing_bridge.v"      -work clock_crossing_io                          -cdslib ./cds_libs/clock_crossing_io.cds.lib                         
  ncvlog     "$QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v"                       -work clock_crossing_io                          -cdslib ./cds_libs/clock_crossing_io.cds.lib                         
  ncvlog     "$QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v"           -work clock_crossing_io                          -cdslib ./cds_libs/clock_crossing_io.cds.lib                         
  ncvlog     "$QSYS_SIMDIR/submodules/altera_std_synchronizer_nocut.v"               -work clock_crossing_io                          -cdslib ./cds_libs/clock_crossing_io.cds.lib                         
  ncvlog     "$QSYS_SIMDIR/submodules/usb_system_all_switches.v"                     -work all_switches                               -cdslib ./cds_libs/all_switches.cds.lib                              
  ncvlog     "$QSYS_SIMDIR/submodules/CY7C67200_IF.v"                                -work CY7C67200_IF_0                             -cdslib ./cds_libs/CY7C67200_IF_0.cds.lib                            
  ncvlog     "$QSYS_SIMDIR/usb_system.v"                                                                                                                                                                   
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  ncelab -access +w+r+c -namemap_mixgen $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
