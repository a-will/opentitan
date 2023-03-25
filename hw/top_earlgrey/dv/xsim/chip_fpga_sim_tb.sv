// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

`timescale 1 ns / 1 ps

module chip_fpga_sim_tb #(
  // Path to a VMEM file containing the contents of the boot ROM, which will be
  // baked into the FPGA bitstream.
  parameter BootRomInitFile = "test_rom_fpga_cw310.32.vmem",
  // Path to a VMEM file containing the contents of the emulated OTP, which will be
  // baked into the FPGA bitstream.
  parameter OtpCtrlMemInitFile = "otp_img_fpga_cw310.vmem"
);
//  import "DPI-C" function chandle fpga_sim_init(input string args[]);
//
//  import "DPI-C" function void fpga_sim_finish(input chandle ctx);

  chandle sim_ctx;
  logic clk100 = 1'b0;
  logic por_n;

  wire POR_N = por_n;
  wire IO_CLK = clk100;
  wire spi_host_clk;
  wire spi_host_cs_l;
  wire [3:0] spi_host_d;
  wire spi_dev_clk = 1'b0;
  wire spi_dev_cs_l = 1'b1;
  wire [3:0] spi_dev_d;
  wire IOC0 = 1'b0;
  wire IOC1 = 1'b0;
  wire IOC2 = 1'b0;
  wire IOC5 = 1'b0;
  wire IOC8 = 1'b0;
  wire IOR0 = 1'b1;
  wire IOR1 = 1'b1;
  wire IOR2 = 1'b1;
  wire IOR3 = 1'b1;
  wire IOR4 = 1'b1;
  wire IOR8 = 1'b1;
  wire IOR9 = 1'b1;
  wire POR_BUTTON_N = 1'b1;
  wire JTAG_SRST_N = 1'b1;
  wire IO_USB_DP_RX = 1'b0;
  wire IO_USB_DN_RX = 1'b0;

  always #(5) clk100 = ~clk100;

  initial begin
//    string args[$];
//    string arg;
    por_n = 1'b1;
//    if ($value$plusargs("rominit=%s", arg)) begin
//      $display("rominit found");
//      args.push_back("--rominit");
//      args.push_back(arg);
//    end
//    if ($value$plusargs("flashinit=%s", arg)) begin
//      $display("flashinit found");
//      args.push_back("--flashinit");
//      args.push_back(arg);
//    end
//    if ($value$plusargs("otpinit=%s", arg)) begin
//      args.push_back("--otpinit");
//      args.push_back(arg);
//    end
//    sim_ctx = fpga_sim_init(args);

    #(20000);
    por_n = 1'b0;
    #(10000);
    por_n = 1'b1;
  end

//  final begin
//    fpga_sim_finish(sim_ctx);
//  end

  chip_earlgrey_cw310 #(
    .BootRomInitFile(BootRomInitFile),
    .OtpCtrlMemInitFile(OtpCtrlMemInitFile)
  ) u_dut (
    .POR_N(POR_N),
    .SPI_HOST_D0(spi_host_d[0]),
    .SPI_HOST_D1(spi_host_d[1]),
    .SPI_HOST_D2(spi_host_d[2]),
    .SPI_HOST_D3(spi_host_d[3]),
    .SPI_HOST_CLK(spi_host_clk),
    .SPI_HOST_CS_L(spi_host_cs_l),
    .SPI_DEV_D0(spi_dev_d[0]),
    .SPI_DEV_D1(spi_dev_d[1]),
    .SPI_DEV_D2(spi_dev_d[2]),
    .SPI_DEV_D3(spi_dev_d[3]),
    .SPI_DEV_CLK(spi_dev_clk),
    .SPI_DEV_CS_L(spi_dev_cs_l),
    .IOR8,
    .IOR9,
    .IO_CLK(IO_CLK),
    .POR_BUTTON_N,
    .JTAG_SRST_N,
    .IO_USB_CONNECT(),
    .IO_USB_DP_TX(),
    .IO_USB_DN_TX(),
    .IO_USB_D_RX(),
    .IO_USB_DP_RX,
    .IO_USB_DN_RX,
    .IO_USB_OE_N(),
    .IO_USB_SPEED(),
    .IO_USB_SUSPEND(),
    .IO_CLKOUT(),
    .IO_TRIGGER(),

    // Muxed Pads
    .IOA0(),
    .IOA1(),
    .IOA2(),
    .IOA3(),
    .IOA4(),
    .IOA5(),
    .IOA6(),
    .IOA7(),
    .IOA8(),
    .IOB0(),
    .IOB1(),
    .IOB2(),
    .IOB3(),
    .IOB4(),
    .IOB5(),
    .IOB6(),
    .IOB7(),
    .IOB8(),
    .IOB9(),
    .IOB10(),
    .IOB11(),
    .IOB12(),
    .IOC0,
    .IOC1,
    .IOC2,
    .IOC3(),
    .IOC4(),
    .IOC5,
    .IOC6(),
    .IOC7(),
    .IOC8,
    .IOC9(),
    .IOC10(),
    .IOC11(),
    .IOC12(),
    .IOR0,
    .IOR1,
    .IOR2,
    .IOR3,
    .IOR4,
    .IOR5(),
    .IOR6(),
    .IOR7(),
    .IOR10(),
    .IOR11(),
    .IOR12(),
    .IOR13()
);

//  `define RV_CORE_IBEX      u_dut.top_earlgrey.u_rv_core_ibex
//  `define SIM_SRAM_IF       u_sim_sram.u_sim_sram_if
//
//  // Detect SW test termination.
//  sim_sram u_sim_sram (
//    .clk_i    (`RV_CORE_IBEX.clk_i),
//    .rst_ni   (`RV_CORE_IBEX.rst_ni),
//    .tl_in_i  (tlul_pkg::tl_h2d_t'(`RV_CORE_IBEX.u_tlul_req_buf.out_o)),
//    .tl_in_o  (),
//    .tl_out_o (),
//    .tl_out_i ()
//
//  );
//
//  // Connect the sim SRAM directly inside rv_core_ibex.
//  assign `RV_CORE_IBEX.tl_win_d2h = u_sim_sram.tl_in_o;
//
//  // Instantiate the SW test status interface & connect signals from sim_sram_if instance
//  // instantiated inside sim_sram. Bind would have worked nicely here, but Verilator segfaults
//  // when trace is enabled (#3951).
//  sw_test_status_if u_sw_test_status_if (
//    .clk_i    (`SIM_SRAM_IF.clk_i),
//    .rst_ni   (`SIM_SRAM_IF.rst_ni),
//    .fetch_en (1'b0),
//    .wr_valid (`SIM_SRAM_IF.wr_valid),
//    .addr     (`SIM_SRAM_IF.tl_h2d.a_address),
//    .data     (`SIM_SRAM_IF.tl_h2d.a_data[15:0])
//  );
//
//  // Set the start address of the simulation SRAM.
//  // Use offset 0 within the sim SRAM for SW test status indication.
//  initial begin
//    `SIM_SRAM_IF.start_addr = `VERILATOR_TEST_STATUS_ADDR;
//    u_sw_test_status_if.sw_test_status_addr = `SIM_SRAM_IF.start_addr;
//  end
//
//  always @(posedge clk_i) begin
//    if (u_sw_test_status_if.sw_test_done) begin
//      $display("Verilator sim termination requested");
//      $display("Your simulation wrote to 0x%h", u_sw_test_status_if.sw_test_status_addr);
//      dv_test_status_pkg::dv_test_status(u_sw_test_status_if.sw_test_passed);
//      $finish;
//    end
//  end
//
//  `undef RV_CORE_IBEX
//  `undef SIM_SRAM_IF


endmodule // chip_fpga_sim_tb
