// usb_system_mm_interconnect_1.v

// This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 14.1 190 at 2015.05.06.20:15:44

`timescale 1 ps / 1 ps
module usb_system_mm_interconnect_1 (
		input  wire        clocks_c1_clk,                                          //                                        clocks_c1.clk
		input  wire        clock_crossing_io_m0_reset_reset_bridge_in_reset_reset, // clock_crossing_io_m0_reset_reset_bridge_in_reset.reset
		input  wire [21:0] clock_crossing_io_m0_address,                           //                             clock_crossing_io_m0.address
		output wire        clock_crossing_io_m0_waitrequest,                       //                                                 .waitrequest
		input  wire [0:0]  clock_crossing_io_m0_burstcount,                        //                                                 .burstcount
		input  wire [3:0]  clock_crossing_io_m0_byteenable,                        //                                                 .byteenable
		input  wire        clock_crossing_io_m0_read,                              //                                                 .read
		output wire [31:0] clock_crossing_io_m0_readdata,                          //                                                 .readdata
		output wire        clock_crossing_io_m0_readdatavalid,                     //                                                 .readdatavalid
		input  wire        clock_crossing_io_m0_write,                             //                                                 .write
		input  wire [31:0] clock_crossing_io_m0_writedata,                         //                                                 .writedata
		input  wire        clock_crossing_io_m0_debugaccess,                       //                                                 .debugaccess
		output wire [1:0]  CY7C67200_IF_0_hpi_address,                             //                               CY7C67200_IF_0_hpi.address
		output wire        CY7C67200_IF_0_hpi_write,                               //                                                 .write
		output wire        CY7C67200_IF_0_hpi_read,                                //                                                 .read
		input  wire [31:0] CY7C67200_IF_0_hpi_readdata,                            //                                                 .readdata
		output wire [31:0] CY7C67200_IF_0_hpi_writedata,                           //                                                 .writedata
		output wire        CY7C67200_IF_0_hpi_chipselect                           //                                                 .chipselect
	);

	wire         clock_crossing_io_m0_translator_avalon_universal_master_0_waitrequest;   // CY7C67200_IF_0_hpi_translator:uav_waitrequest -> clock_crossing_io_m0_translator:uav_waitrequest
	wire  [31:0] clock_crossing_io_m0_translator_avalon_universal_master_0_readdata;      // CY7C67200_IF_0_hpi_translator:uav_readdata -> clock_crossing_io_m0_translator:uav_readdata
	wire         clock_crossing_io_m0_translator_avalon_universal_master_0_debugaccess;   // clock_crossing_io_m0_translator:uav_debugaccess -> CY7C67200_IF_0_hpi_translator:uav_debugaccess
	wire  [21:0] clock_crossing_io_m0_translator_avalon_universal_master_0_address;       // clock_crossing_io_m0_translator:uav_address -> CY7C67200_IF_0_hpi_translator:uav_address
	wire         clock_crossing_io_m0_translator_avalon_universal_master_0_read;          // clock_crossing_io_m0_translator:uav_read -> CY7C67200_IF_0_hpi_translator:uav_read
	wire   [3:0] clock_crossing_io_m0_translator_avalon_universal_master_0_byteenable;    // clock_crossing_io_m0_translator:uav_byteenable -> CY7C67200_IF_0_hpi_translator:uav_byteenable
	wire         clock_crossing_io_m0_translator_avalon_universal_master_0_readdatavalid; // CY7C67200_IF_0_hpi_translator:uav_readdatavalid -> clock_crossing_io_m0_translator:uav_readdatavalid
	wire         clock_crossing_io_m0_translator_avalon_universal_master_0_lock;          // clock_crossing_io_m0_translator:uav_lock -> CY7C67200_IF_0_hpi_translator:uav_lock
	wire         clock_crossing_io_m0_translator_avalon_universal_master_0_write;         // clock_crossing_io_m0_translator:uav_write -> CY7C67200_IF_0_hpi_translator:uav_write
	wire  [31:0] clock_crossing_io_m0_translator_avalon_universal_master_0_writedata;     // clock_crossing_io_m0_translator:uav_writedata -> CY7C67200_IF_0_hpi_translator:uav_writedata
	wire   [2:0] clock_crossing_io_m0_translator_avalon_universal_master_0_burstcount;    // clock_crossing_io_m0_translator:uav_burstcount -> CY7C67200_IF_0_hpi_translator:uav_burstcount

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (22),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (22),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (1),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (1),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.USE_READRESPONSE            (0),
		.USE_WRITERESPONSE           (0),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) clock_crossing_io_m0_translator (
		.clk                    (clocks_c1_clk),                                                           //                       clk.clk
		.reset                  (clock_crossing_io_m0_reset_reset_bridge_in_reset_reset),                  //                     reset.reset
		.uav_address            (clock_crossing_io_m0_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount         (clock_crossing_io_m0_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read               (clock_crossing_io_m0_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write              (clock_crossing_io_m0_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest        (clock_crossing_io_m0_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid      (clock_crossing_io_m0_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable         (clock_crossing_io_m0_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata           (clock_crossing_io_m0_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata          (clock_crossing_io_m0_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock               (clock_crossing_io_m0_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess        (clock_crossing_io_m0_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address             (clock_crossing_io_m0_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest         (clock_crossing_io_m0_waitrequest),                                        //                          .waitrequest
		.av_burstcount          (clock_crossing_io_m0_burstcount),                                         //                          .burstcount
		.av_byteenable          (clock_crossing_io_m0_byteenable),                                         //                          .byteenable
		.av_read                (clock_crossing_io_m0_read),                                               //                          .read
		.av_readdata            (clock_crossing_io_m0_readdata),                                           //                          .readdata
		.av_readdatavalid       (clock_crossing_io_m0_readdatavalid),                                      //                          .readdatavalid
		.av_write               (clock_crossing_io_m0_write),                                              //                          .write
		.av_writedata           (clock_crossing_io_m0_writedata),                                          //                          .writedata
		.av_debugaccess         (clock_crossing_io_m0_debugaccess),                                        //                          .debugaccess
		.av_beginbursttransfer  (1'b0),                                                                    //               (terminated)
		.av_begintransfer       (1'b0),                                                                    //               (terminated)
		.av_chipselect          (1'b0),                                                                    //               (terminated)
		.av_lock                (1'b0),                                                                    //               (terminated)
		.uav_clken              (),                                                                        //               (terminated)
		.av_clken               (1'b1),                                                                    //               (terminated)
		.uav_response           (2'b00),                                                                   //               (terminated)
		.av_response            (),                                                                        //               (terminated)
		.uav_writeresponsevalid (1'b0),                                                                    //               (terminated)
		.av_writeresponsevalid  ()                                                                         //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (2),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (22),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.USE_READRESPONSE               (0),
		.USE_WRITERESPONSE              (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (2),
		.AV_WRITE_WAIT_CYCLES           (2),
		.AV_SETUP_WAIT_CYCLES           (2),
		.AV_DATA_HOLD_CYCLES            (2)
	) cy7c67200_if_0_hpi_translator (
		.clk                    (clocks_c1_clk),                                                           //                      clk.clk
		.reset                  (clock_crossing_io_m0_reset_reset_bridge_in_reset_reset),                  //                    reset.reset
		.uav_address            (clock_crossing_io_m0_translator_avalon_universal_master_0_address),       // avalon_universal_slave_0.address
		.uav_burstcount         (clock_crossing_io_m0_translator_avalon_universal_master_0_burstcount),    //                         .burstcount
		.uav_read               (clock_crossing_io_m0_translator_avalon_universal_master_0_read),          //                         .read
		.uav_write              (clock_crossing_io_m0_translator_avalon_universal_master_0_write),         //                         .write
		.uav_waitrequest        (clock_crossing_io_m0_translator_avalon_universal_master_0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid      (clock_crossing_io_m0_translator_avalon_universal_master_0_readdatavalid), //                         .readdatavalid
		.uav_byteenable         (clock_crossing_io_m0_translator_avalon_universal_master_0_byteenable),    //                         .byteenable
		.uav_readdata           (clock_crossing_io_m0_translator_avalon_universal_master_0_readdata),      //                         .readdata
		.uav_writedata          (clock_crossing_io_m0_translator_avalon_universal_master_0_writedata),     //                         .writedata
		.uav_lock               (clock_crossing_io_m0_translator_avalon_universal_master_0_lock),          //                         .lock
		.uav_debugaccess        (clock_crossing_io_m0_translator_avalon_universal_master_0_debugaccess),   //                         .debugaccess
		.av_address             (CY7C67200_IF_0_hpi_address),                                              //      avalon_anti_slave_0.address
		.av_write               (CY7C67200_IF_0_hpi_write),                                                //                         .write
		.av_read                (CY7C67200_IF_0_hpi_read),                                                 //                         .read
		.av_readdata            (CY7C67200_IF_0_hpi_readdata),                                             //                         .readdata
		.av_writedata           (CY7C67200_IF_0_hpi_writedata),                                            //                         .writedata
		.av_chipselect          (CY7C67200_IF_0_hpi_chipselect),                                           //                         .chipselect
		.av_begintransfer       (),                                                                        //              (terminated)
		.av_beginbursttransfer  (),                                                                        //              (terminated)
		.av_burstcount          (),                                                                        //              (terminated)
		.av_byteenable          (),                                                                        //              (terminated)
		.av_readdatavalid       (1'b0),                                                                    //              (terminated)
		.av_waitrequest         (1'b0),                                                                    //              (terminated)
		.av_writebyteenable     (),                                                                        //              (terminated)
		.av_lock                (),                                                                        //              (terminated)
		.av_clken               (),                                                                        //              (terminated)
		.uav_clken              (1'b0),                                                                    //              (terminated)
		.av_debugaccess         (),                                                                        //              (terminated)
		.av_outputenable        (),                                                                        //              (terminated)
		.uav_response           (),                                                                        //              (terminated)
		.av_response            (2'b00),                                                                   //              (terminated)
		.uav_writeresponsevalid (),                                                                        //              (terminated)
		.av_writeresponsevalid  (1'b0)                                                                     //              (terminated)
	);

endmodule
