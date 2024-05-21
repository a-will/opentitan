// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// ------------------- W A R N I N G: A U T O - G E N E R A T E D   C O D E !! -------------------//
// PLEASE DO NOT HAND-EDIT THIS FILE. IT HAS BEEN AUTO-GENERATED WITH THE FOLLOWING COMMAND:
//
// util/topgen.py -t hw/top_darjeeling/data/top_darjeeling.hjson \
//                -o hw/top_darjeeling/ \
//                --rnd_cnst_seed \
//                1017106219537032642877583828875051302543807092889754935647094601236425074047


module chip_darjeeling_vitis #(
  // Path to a VMEM file containing the contents of the boot ROM, which will be
  // baked into the FPGA bitstream.
  parameter BootRomInitFile = "test_rom_fpga_vitis.32.vmem",
  // Path to a VMEM file containing the contents of the emulated OTP, which will be
  // baked into the FPGA bitstream.
  parameter OtpCtrlMemInitFile = "otp_img_fpga_vitis.vmem"
) (
  // Dedicated Pads
  // Removed port: inout POR_N, // Manual Pad
  // Removed port: inout JTAG_TCK, // Manual Pad
  // Removed port: inout JTAG_TMS, // Manual Pad
  // Removed port: inout JTAG_TDI, // Manual Pad
  // Removed port: inout JTAG_TDO, // Manual Pad
  // Removed port: inout JTAG_TRST_N, // Manual Pad
  // Removed port: inout SPI_HOST_D0, // Dedicated Pad for spi_host0_sd
  // Removed port: inout SPI_HOST_D1, // Dedicated Pad for spi_host0_sd
  // Removed port: inout SPI_HOST_D2, // Dedicated Pad for spi_host0_sd
  // Removed port: inout SPI_HOST_D3, // Dedicated Pad for spi_host0_sd
  // Removed port: inout SPI_HOST_CLK, // Dedicated Pad for spi_host0_sck
  // Removed port: inout SPI_HOST_CS_L, // Dedicated Pad for spi_host0_csb
  // Removed port: inout SPI_DEV_D0, // Dedicated Pad for spi_device_sd
  // Removed port: inout SPI_DEV_D1, // Dedicated Pad for spi_device_sd
  // Removed port: inout SPI_DEV_D2, // Dedicated Pad for spi_device_sd
  // Removed port: inout SPI_DEV_D3, // Dedicated Pad for spi_device_sd
  // Removed port: inout SPI_DEV_CLK, // Dedicated Pad for spi_device_sck
  // Removed port: inout SPI_DEV_CS_L, // Dedicated Pad for spi_device_csb
  // Removed port: inout SPI_DEV_TPM_CS_L, // Dedicated Pad for spi_device_tpm_csb
  // Removed port: inout UART_RX, // Dedicated Pad for uart0_rx
  // Removed port: inout UART_TX, // Dedicated Pad for uart0_tx
  // Removed port: inout I2C_SCL, // Dedicated Pad for i2c0_scl
  // Removed port: inout I2C_SDA, // Dedicated Pad for i2c0_sda
  // Removed port: inout GPIO0, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO1, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO2, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO3, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO4, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO5, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO6, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO7, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO8, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO9, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO10, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO11, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO12, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO13, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO14, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO15, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO16, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO17, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO18, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO19, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO20, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO21, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO22, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO23, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO24, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO25, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO26, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO27, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO28, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO29, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO30, // Dedicated Pad for gpio_gpio
  // Removed port: inout GPIO31, // Dedicated Pad for gpio_gpio
  // Removed port: inout SOC_GPI0, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPI1, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPI2, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPI3, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPI4, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPI5, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPI6, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPI7, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPI8, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPI9, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPI10, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPI11, // Dedicated Pad for soc_proxy_soc_gpi
  // Removed port: inout SOC_GPO0, // Dedicated Pad for soc_proxy_soc_gpo
  // Removed port: inout SOC_GPO1, // Dedicated Pad for soc_proxy_soc_gpo
  // Removed port: inout SOC_GPO2, // Dedicated Pad for soc_proxy_soc_gpo
  // Removed port: inout SOC_GPO3, // Dedicated Pad for soc_proxy_soc_gpo
  // Removed port: inout SOC_GPO4, // Dedicated Pad for soc_proxy_soc_gpo
  // Removed port: inout SOC_GPO5, // Dedicated Pad for soc_proxy_soc_gpo
  // Removed port: inout SOC_GPO6, // Dedicated Pad for soc_proxy_soc_gpo
  // Removed port: inout SOC_GPO7, // Dedicated Pad for soc_proxy_soc_gpo
  // Removed port: inout SOC_GPO8, // Dedicated Pad for soc_proxy_soc_gpo
  // Removed port: inout SOC_GPO9, // Dedicated Pad for soc_proxy_soc_gpo
  // Removed port: inout SOC_GPO10, // Dedicated Pad for soc_proxy_soc_gpo
  // Removed port: inout SOC_GPO11, // Dedicated Pad for soc_proxy_soc_gpo
  input         S_AXI_CONTROL_ACLK, // Manual Pad
  input         S_AXI_CONTROL_ARESETN, // Manual Pad
  input  [31:0] S_AXI_CONTROL_ARADDR, // Manual Pad
  output        S_AXI_CONTROL_ARREADY, // Manual Pad
  input         S_AXI_CONTROL_ARVALID, // Manual Pad
  input  [31:0] S_AXI_CONTROL_AWADDR, // Manual Pad
  output        S_AXI_CONTROL_AWREADY, // Manual Pad
  input         S_AXI_CONTROL_AWVALID, // Manual Pad
  input         S_AXI_CONTROL_BREADY, // Manual Pad
  output [1:0]  S_AXI_CONTROL_BRESP, // Manual Pad
  output        S_AXI_CONTROL_BVALID, // Manual Pad
  output [31:0] S_AXI_CONTROL_RDATA, // Manual Pad
  input         S_AXI_CONTROL_RREADY, // Manual Pad
  output [1:0]  S_AXI_CONTROL_RRESP, // Manual Pad
  output        S_AXI_CONTROL_RVALID, // Manual Pad
  input  [31:0] S_AXI_CONTROL_WDATA, // Manual Pad
  input         S_AXI_CONTROL_WLAST, // Manual Pad
  output        S_AXI_CONTROL_WREADY, // Manual Pad
  input  [3:0]  S_AXI_CONTROL_WSTRB, // Manual Pad
  input         S_AXI_CONTROL_WVALID, // Manual Pad
  output        INTERRUPT_O, // Manual Pad
  output [35:0] M_AXI_SHMEM_ARADDR, // Manual Pad
  output [1:0]  M_AXI_SHMEM_ARBURST, // Manual Pad
  output [3:0]  M_AXI_SHMEM_ARCACHE, // Manual Pad
  output [7:0]  M_AXI_SHMEM_ARLEN, // Manual Pad
  output        M_AXI_SHMEM_ARLOCK, // Manual Pad
  output [2:0]  M_AXI_SHMEM_ARPROT, // Manual Pad
  output [3:0]  M_AXI_SHMEM_ARQOS, // Manual Pad
  input         M_AXI_SHMEM_ARREADY, // Manual Pad
  output [3:0]  M_AXI_SHMEM_ARREGION, // Manual Pad
  output [2:0]  M_AXI_SHMEM_ARSIZE, // Manual Pad
  output        M_AXI_SHMEM_ARVALID, // Manual Pad
  output [35:0] M_AXI_SHMEM_AWADDR, // Manual Pad
  output [1:0]  M_AXI_SHMEM_AWBURST, // Manual Pad
  output [3:0]  M_AXI_SHMEM_AWCACHE, // Manual Pad
  output [7:0]  M_AXI_SHMEM_AWLEN, // Manual Pad
  output        M_AXI_SHMEM_AWLOCK, // Manual Pad
  output [2:0]  M_AXI_SHMEM_AWPROT, // Manual Pad
  output [3:0]  M_AXI_SHMEM_AWQOS, // Manual Pad
  input         M_AXI_SHMEM_AWREADY, // Manual Pad
  output [3:0]  M_AXI_SHMEM_AWREGION, // Manual Pad
  output [2:0]  M_AXI_SHMEM_AWSIZE, // Manual Pad
  output        M_AXI_SHMEM_AWVALID, // Manual Pad
  output        M_AXI_SHMEM_BREADY, // Manual Pad
  input  [1:0]  M_AXI_SHMEM_BRESP, // Manual Pad
  input         M_AXI_SHMEM_BVALID, // Manual Pad
  input  [31:0] M_AXI_SHMEM_RDATA, // Manual Pad
  input         M_AXI_SHMEM_RLAST, // Manual Pad
  output        M_AXI_SHMEM_RREADY, // Manual Pad
  input  [1:0]  M_AXI_SHMEM_RRESP, // Manual Pad
  input         M_AXI_SHMEM_RVALID, // Manual Pad
  output [31:0] M_AXI_SHMEM_WDATA, // Manual Pad
  output        M_AXI_SHMEM_WLAST, // Manual Pad
  input         M_AXI_SHMEM_WREADY, // Manual Pad
  output [3:0]  M_AXI_SHMEM_WSTRB, // Manual Pad
  output        M_AXI_SHMEM_WVALID // Manual Pad

  // Muxed Pads
  // Removed port: inout MIO0 // MIO Pad 0
  // Removed port: inout MIO1 // MIO Pad 1
  // Removed port: inout MIO2 // MIO Pad 2
  // Removed port: inout MIO3 // MIO Pad 3
  // Removed port: inout MIO4 // MIO Pad 4
  // Removed port: inout MIO5 // MIO Pad 5
  // Removed port: inout MIO6 // MIO Pad 6
  // Removed port: inout MIO7 // MIO Pad 7
  // Removed port: inout MIO8 // MIO Pad 8
  // Removed port: inout MIO9 // MIO Pad 9
  // Removed port: inout MIO10 // MIO Pad 10
  // Removed port: inout MIO11 // MIO Pad 11
);

  import top_darjeeling_pkg::*;
  import prim_pad_wrapper_pkg::*;

  ////////////////////////////
  // Special Signal Indices //
  ////////////////////////////

  localparam int Tap0PadIdx = 0;
  localparam int Tap1PadIdx = 1;
  localparam int Dft0PadIdx = 2;
  localparam int Dft1PadIdx = 3;
  localparam int TckPadIdx = 4;
  localparam int TmsPadIdx = 5;
  localparam int TrstNPadIdx = 6;
  localparam int TdiPadIdx = 7;
  localparam int TdoPadIdx = 8;

  // DFT and Debug signal positions in the pinout.
  localparam pinmux_pkg::target_cfg_t PinmuxTargetCfg = '{
    tck_idx:           TckPadIdx,
    tms_idx:           TmsPadIdx,
    trst_idx:          TrstNPadIdx,
    tdi_idx:           TdiPadIdx,
    tdo_idx:           TdoPadIdx,
    tap_strap0_idx:    Tap0PadIdx,
    tap_strap1_idx:    Tap1PadIdx,
    dft_strap0_idx:    Dft0PadIdx,
    dft_strap1_idx:    Dft1PadIdx,
    // TODO: check whether there is a better way to pass these USB-specific params
    // The use of these indexes is gated behind a parameter, but to synthesize they
    // need to exist even if the code-path is never used (pinmux.sv:UsbWkupModuleEn).
    // Hence, set to zero.
    usb_dp_idx:        0,
    usb_dn_idx:        0,
    usb_sense_idx:     0,
    // Pad types for attribute WARL behavior
    dio_pad_type: {
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO soc_proxy_soc_gpo
      BidirStd, // DIO uart0_tx
      BidirStd, // DIO spi_host0_csb
      BidirStd, // DIO spi_host0_sck
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO soc_proxy_soc_gpi
      InputStd, // DIO uart0_rx
      InputStd, // DIO spi_device_tpm_csb
      InputStd, // DIO spi_device_csb
      InputStd, // DIO spi_device_sck
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO gpio_gpio
      BidirStd, // DIO i2c0_sda
      BidirStd, // DIO i2c0_scl
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_host0_sd
      BidirStd, // DIO spi_host0_sd
      BidirStd, // DIO spi_host0_sd
      BidirStd  // DIO spi_host0_sd
    },
    mio_pad_type: {
      BidirStd, // MIO Pad 11
      BidirStd, // MIO Pad 10
      BidirStd, // MIO Pad 9
      BidirStd, // MIO Pad 8
      BidirStd, // MIO Pad 7
      BidirStd, // MIO Pad 6
      BidirStd, // MIO Pad 5
      BidirStd, // MIO Pad 4
      BidirStd, // MIO Pad 3
      BidirStd, // MIO Pad 2
      BidirStd, // MIO Pad 1
      BidirStd  // MIO Pad 0
    }
  };

  ////////////////////////
  // Signal definitions //
  ////////////////////////

  // Net definitions for removed ports
  wire POR_N;
  wire JTAG_TCK;
  wire JTAG_TMS;
  wire JTAG_TDI;
  wire JTAG_TDO;
  wire JTAG_TRST_N;
  wire SPI_HOST_D0;
  wire SPI_HOST_D1;
  wire SPI_HOST_D2;
  wire SPI_HOST_D3;
  wire SPI_HOST_CLK;
  wire SPI_HOST_CS_L;
  wire SPI_DEV_D0;
  wire SPI_DEV_D1;
  wire SPI_DEV_D2;
  wire SPI_DEV_D3;
  wire SPI_DEV_CLK;
  wire SPI_DEV_CS_L;
  wire SPI_DEV_TPM_CS_L;
  wire UART_RX;
  wire UART_TX;
  wire I2C_SCL;
  wire I2C_SDA;
  wire GPIO0;
  wire GPIO1;
  wire GPIO2;
  wire GPIO3;
  wire GPIO4;
  wire GPIO5;
  wire GPIO6;
  wire GPIO7;
  wire GPIO8;
  wire GPIO9;
  wire GPIO10;
  wire GPIO11;
  wire GPIO12;
  wire GPIO13;
  wire GPIO14;
  wire GPIO15;
  wire GPIO16;
  wire GPIO17;
  wire GPIO18;
  wire GPIO19;
  wire GPIO20;
  wire GPIO21;
  wire GPIO22;
  wire GPIO23;
  wire GPIO24;
  wire GPIO25;
  wire GPIO26;
  wire GPIO27;
  wire GPIO28;
  wire GPIO29;
  wire GPIO30;
  wire GPIO31;
  wire SOC_GPI0;
  wire SOC_GPI1;
  wire SOC_GPI2;
  wire SOC_GPI3;
  wire SOC_GPI4;
  wire SOC_GPI5;
  wire SOC_GPI6;
  wire SOC_GPI7;
  wire SOC_GPI8;
  wire SOC_GPI9;
  wire SOC_GPI10;
  wire SOC_GPI11;
  wire SOC_GPO0;
  wire SOC_GPO1;
  wire SOC_GPO2;
  wire SOC_GPO3;
  wire SOC_GPO4;
  wire SOC_GPO5;
  wire SOC_GPO6;
  wire SOC_GPO7;
  wire SOC_GPO8;
  wire SOC_GPO9;
  wire SOC_GPO10;
  wire SOC_GPO11;
  wire MIO0;
  wire MIO1;
  wire MIO2;
  wire MIO3;
  wire MIO4;
  wire MIO5;
  wire MIO6;
  wire MIO7;
  wire MIO8;
  wire MIO9;
  wire MIO10;
  wire MIO11;

  pad_attr_t [pinmux_reg_pkg::NMioPads-1:0] mio_attr;
  pad_attr_t [pinmux_reg_pkg::NDioPads-1:0] dio_attr;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_out;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_oe;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_in;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_in_raw;
  logic [135-1:0] dio_in_raw;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_out;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_oe;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_in;

  logic unused_mio_in_raw;
  logic unused_dio_in_raw;
  assign unused_mio_in_raw = ^mio_in_raw;
  assign unused_dio_in_raw = ^dio_in_raw;

  // Manual pads
  logic manual_in_por_n, manual_out_por_n, manual_oe_por_n;
  logic manual_in_jtag_tck, manual_out_jtag_tck, manual_oe_jtag_tck;
  logic manual_in_jtag_tms, manual_out_jtag_tms, manual_oe_jtag_tms;
  logic manual_in_jtag_tdi, manual_out_jtag_tdi, manual_oe_jtag_tdi;
  logic manual_in_jtag_tdo, manual_out_jtag_tdo, manual_oe_jtag_tdo;
  logic manual_in_jtag_trst_n, manual_out_jtag_trst_n, manual_oe_jtag_trst_n;
  logic manual_in_s_axi_control_aclk, manual_out_s_axi_control_aclk, manual_oe_s_axi_control_aclk;
  logic manual_in_s_axi_control_aresetn, manual_out_s_axi_control_aresetn, manual_oe_s_axi_control_aresetn;
  logic manual_in_s_axi_control_araddr, manual_out_s_axi_control_araddr, manual_oe_s_axi_control_araddr;
  logic manual_in_s_axi_control_arready, manual_out_s_axi_control_arready, manual_oe_s_axi_control_arready;
  logic manual_in_s_axi_control_arvalid, manual_out_s_axi_control_arvalid, manual_oe_s_axi_control_arvalid;
  logic manual_in_s_axi_control_awaddr, manual_out_s_axi_control_awaddr, manual_oe_s_axi_control_awaddr;
  logic manual_in_s_axi_control_awready, manual_out_s_axi_control_awready, manual_oe_s_axi_control_awready;
  logic manual_in_s_axi_control_awvalid, manual_out_s_axi_control_awvalid, manual_oe_s_axi_control_awvalid;
  logic manual_in_s_axi_control_bready, manual_out_s_axi_control_bready, manual_oe_s_axi_control_bready;
  logic manual_in_s_axi_control_bresp, manual_out_s_axi_control_bresp, manual_oe_s_axi_control_bresp;
  logic manual_in_s_axi_control_bvalid, manual_out_s_axi_control_bvalid, manual_oe_s_axi_control_bvalid;
  logic manual_in_s_axi_control_rdata, manual_out_s_axi_control_rdata, manual_oe_s_axi_control_rdata;
  logic manual_in_s_axi_control_rready, manual_out_s_axi_control_rready, manual_oe_s_axi_control_rready;
  logic manual_in_s_axi_control_rresp, manual_out_s_axi_control_rresp, manual_oe_s_axi_control_rresp;
  logic manual_in_s_axi_control_rvalid, manual_out_s_axi_control_rvalid, manual_oe_s_axi_control_rvalid;
  logic manual_in_s_axi_control_wdata, manual_out_s_axi_control_wdata, manual_oe_s_axi_control_wdata;
  logic manual_in_s_axi_control_wlast, manual_out_s_axi_control_wlast, manual_oe_s_axi_control_wlast;
  logic manual_in_s_axi_control_wready, manual_out_s_axi_control_wready, manual_oe_s_axi_control_wready;
  logic manual_in_s_axi_control_wstrb, manual_out_s_axi_control_wstrb, manual_oe_s_axi_control_wstrb;
  logic manual_in_s_axi_control_wvalid, manual_out_s_axi_control_wvalid, manual_oe_s_axi_control_wvalid;
  logic manual_in_interrupt_o, manual_out_interrupt_o, manual_oe_interrupt_o;
  logic manual_in_m_axi_shmem_araddr, manual_out_m_axi_shmem_araddr, manual_oe_m_axi_shmem_araddr;
  logic manual_in_m_axi_shmem_arburst, manual_out_m_axi_shmem_arburst, manual_oe_m_axi_shmem_arburst;
  logic manual_in_m_axi_shmem_arcache, manual_out_m_axi_shmem_arcache, manual_oe_m_axi_shmem_arcache;
  logic manual_in_m_axi_shmem_arlen, manual_out_m_axi_shmem_arlen, manual_oe_m_axi_shmem_arlen;
  logic manual_in_m_axi_shmem_arlock, manual_out_m_axi_shmem_arlock, manual_oe_m_axi_shmem_arlock;
  logic manual_in_m_axi_shmem_arprot, manual_out_m_axi_shmem_arprot, manual_oe_m_axi_shmem_arprot;
  logic manual_in_m_axi_shmem_arqos, manual_out_m_axi_shmem_arqos, manual_oe_m_axi_shmem_arqos;
  logic manual_in_m_axi_shmem_arready, manual_out_m_axi_shmem_arready, manual_oe_m_axi_shmem_arready;
  logic manual_in_m_axi_shmem_arregion, manual_out_m_axi_shmem_arregion, manual_oe_m_axi_shmem_arregion;
  logic manual_in_m_axi_shmem_arsize, manual_out_m_axi_shmem_arsize, manual_oe_m_axi_shmem_arsize;
  logic manual_in_m_axi_shmem_arvalid, manual_out_m_axi_shmem_arvalid, manual_oe_m_axi_shmem_arvalid;
  logic manual_in_m_axi_shmem_awaddr, manual_out_m_axi_shmem_awaddr, manual_oe_m_axi_shmem_awaddr;
  logic manual_in_m_axi_shmem_awburst, manual_out_m_axi_shmem_awburst, manual_oe_m_axi_shmem_awburst;
  logic manual_in_m_axi_shmem_awcache, manual_out_m_axi_shmem_awcache, manual_oe_m_axi_shmem_awcache;
  logic manual_in_m_axi_shmem_awlen, manual_out_m_axi_shmem_awlen, manual_oe_m_axi_shmem_awlen;
  logic manual_in_m_axi_shmem_awlock, manual_out_m_axi_shmem_awlock, manual_oe_m_axi_shmem_awlock;
  logic manual_in_m_axi_shmem_awprot, manual_out_m_axi_shmem_awprot, manual_oe_m_axi_shmem_awprot;
  logic manual_in_m_axi_shmem_awqos, manual_out_m_axi_shmem_awqos, manual_oe_m_axi_shmem_awqos;
  logic manual_in_m_axi_shmem_awready, manual_out_m_axi_shmem_awready, manual_oe_m_axi_shmem_awready;
  logic manual_in_m_axi_shmem_awregion, manual_out_m_axi_shmem_awregion, manual_oe_m_axi_shmem_awregion;
  logic manual_in_m_axi_shmem_awsize, manual_out_m_axi_shmem_awsize, manual_oe_m_axi_shmem_awsize;
  logic manual_in_m_axi_shmem_awvalid, manual_out_m_axi_shmem_awvalid, manual_oe_m_axi_shmem_awvalid;
  logic manual_in_m_axi_shmem_bready, manual_out_m_axi_shmem_bready, manual_oe_m_axi_shmem_bready;
  logic manual_in_m_axi_shmem_bresp, manual_out_m_axi_shmem_bresp, manual_oe_m_axi_shmem_bresp;
  logic manual_in_m_axi_shmem_bvalid, manual_out_m_axi_shmem_bvalid, manual_oe_m_axi_shmem_bvalid;
  logic manual_in_m_axi_shmem_rdata, manual_out_m_axi_shmem_rdata, manual_oe_m_axi_shmem_rdata;
  logic manual_in_m_axi_shmem_rlast, manual_out_m_axi_shmem_rlast, manual_oe_m_axi_shmem_rlast;
  logic manual_in_m_axi_shmem_rready, manual_out_m_axi_shmem_rready, manual_oe_m_axi_shmem_rready;
  logic manual_in_m_axi_shmem_rresp, manual_out_m_axi_shmem_rresp, manual_oe_m_axi_shmem_rresp;
  logic manual_in_m_axi_shmem_rvalid, manual_out_m_axi_shmem_rvalid, manual_oe_m_axi_shmem_rvalid;
  logic manual_in_m_axi_shmem_wdata, manual_out_m_axi_shmem_wdata, manual_oe_m_axi_shmem_wdata;
  logic manual_in_m_axi_shmem_wlast, manual_out_m_axi_shmem_wlast, manual_oe_m_axi_shmem_wlast;
  logic manual_in_m_axi_shmem_wready, manual_out_m_axi_shmem_wready, manual_oe_m_axi_shmem_wready;
  logic manual_in_m_axi_shmem_wstrb, manual_out_m_axi_shmem_wstrb, manual_oe_m_axi_shmem_wstrb;
  logic manual_in_m_axi_shmem_wvalid, manual_out_m_axi_shmem_wvalid, manual_oe_m_axi_shmem_wvalid;

  pad_attr_t manual_attr_por_n;
  pad_attr_t manual_attr_jtag_tck;
  pad_attr_t manual_attr_jtag_tms;
  pad_attr_t manual_attr_jtag_tdi;
  pad_attr_t manual_attr_jtag_tdo;
  pad_attr_t manual_attr_jtag_trst_n;
  pad_attr_t manual_attr_s_axi_control_aclk;
  pad_attr_t manual_attr_s_axi_control_aresetn;
  pad_attr_t manual_attr_s_axi_control_araddr;
  pad_attr_t manual_attr_s_axi_control_arready;
  pad_attr_t manual_attr_s_axi_control_arvalid;
  pad_attr_t manual_attr_s_axi_control_awaddr;
  pad_attr_t manual_attr_s_axi_control_awready;
  pad_attr_t manual_attr_s_axi_control_awvalid;
  pad_attr_t manual_attr_s_axi_control_bready;
  pad_attr_t manual_attr_s_axi_control_bresp;
  pad_attr_t manual_attr_s_axi_control_bvalid;
  pad_attr_t manual_attr_s_axi_control_rdata;
  pad_attr_t manual_attr_s_axi_control_rready;
  pad_attr_t manual_attr_s_axi_control_rresp;
  pad_attr_t manual_attr_s_axi_control_rvalid;
  pad_attr_t manual_attr_s_axi_control_wdata;
  pad_attr_t manual_attr_s_axi_control_wlast;
  pad_attr_t manual_attr_s_axi_control_wready;
  pad_attr_t manual_attr_s_axi_control_wstrb;
  pad_attr_t manual_attr_s_axi_control_wvalid;
  pad_attr_t manual_attr_interrupt_o;
  pad_attr_t manual_attr_m_axi_shmem_araddr;
  pad_attr_t manual_attr_m_axi_shmem_arburst;
  pad_attr_t manual_attr_m_axi_shmem_arcache;
  pad_attr_t manual_attr_m_axi_shmem_arlen;
  pad_attr_t manual_attr_m_axi_shmem_arlock;
  pad_attr_t manual_attr_m_axi_shmem_arprot;
  pad_attr_t manual_attr_m_axi_shmem_arqos;
  pad_attr_t manual_attr_m_axi_shmem_arready;
  pad_attr_t manual_attr_m_axi_shmem_arregion;
  pad_attr_t manual_attr_m_axi_shmem_arsize;
  pad_attr_t manual_attr_m_axi_shmem_arvalid;
  pad_attr_t manual_attr_m_axi_shmem_awaddr;
  pad_attr_t manual_attr_m_axi_shmem_awburst;
  pad_attr_t manual_attr_m_axi_shmem_awcache;
  pad_attr_t manual_attr_m_axi_shmem_awlen;
  pad_attr_t manual_attr_m_axi_shmem_awlock;
  pad_attr_t manual_attr_m_axi_shmem_awprot;
  pad_attr_t manual_attr_m_axi_shmem_awqos;
  pad_attr_t manual_attr_m_axi_shmem_awready;
  pad_attr_t manual_attr_m_axi_shmem_awregion;
  pad_attr_t manual_attr_m_axi_shmem_awsize;
  pad_attr_t manual_attr_m_axi_shmem_awvalid;
  pad_attr_t manual_attr_m_axi_shmem_bready;
  pad_attr_t manual_attr_m_axi_shmem_bresp;
  pad_attr_t manual_attr_m_axi_shmem_bvalid;
  pad_attr_t manual_attr_m_axi_shmem_rdata;
  pad_attr_t manual_attr_m_axi_shmem_rlast;
  pad_attr_t manual_attr_m_axi_shmem_rready;
  pad_attr_t manual_attr_m_axi_shmem_rresp;
  pad_attr_t manual_attr_m_axi_shmem_rvalid;
  pad_attr_t manual_attr_m_axi_shmem_wdata;
  pad_attr_t manual_attr_m_axi_shmem_wlast;
  pad_attr_t manual_attr_m_axi_shmem_wready;
  pad_attr_t manual_attr_m_axi_shmem_wstrb;
  pad_attr_t manual_attr_m_axi_shmem_wvalid;

  /////////////////////////
  // Stubbed pad tie-off //
  /////////////////////////

  // Only signals going to non-custom pads need to be tied off.
  logic [91:0] unused_sig;

  //////////////////////
  // Padring Instance //
  //////////////////////

  ast_pkg::ast_clks_t ast_base_clks;


  padring #(
    // Padring specific counts may differ from pinmux config due
    // to custom, stubbed or added pads.
    .NDioPads(135),
    .NMioPads(12),
    .DioPadType ({
      InputStd, // M_AXI_SHMEM_WVALID
      InputStd, // M_AXI_SHMEM_WSTRB
      InputStd, // M_AXI_SHMEM_WREADY
      InputStd, // M_AXI_SHMEM_WLAST
      InputStd, // M_AXI_SHMEM_WDATA
      InputStd, // M_AXI_SHMEM_RVALID
      InputStd, // M_AXI_SHMEM_RRESP
      InputStd, // M_AXI_SHMEM_RREADY
      InputStd, // M_AXI_SHMEM_RLAST
      InputStd, // M_AXI_SHMEM_RDATA
      InputStd, // M_AXI_SHMEM_BVALID
      InputStd, // M_AXI_SHMEM_BRESP
      InputStd, // M_AXI_SHMEM_BREADY
      InputStd, // M_AXI_SHMEM_AWVALID
      InputStd, // M_AXI_SHMEM_AWSIZE
      InputStd, // M_AXI_SHMEM_AWREGION
      InputStd, // M_AXI_SHMEM_AWREADY
      InputStd, // M_AXI_SHMEM_AWQOS
      InputStd, // M_AXI_SHMEM_AWPROT
      InputStd, // M_AXI_SHMEM_AWLOCK
      InputStd, // M_AXI_SHMEM_AWLEN
      InputStd, // M_AXI_SHMEM_AWCACHE
      InputStd, // M_AXI_SHMEM_AWBURST
      InputStd, // M_AXI_SHMEM_AWADDR
      InputStd, // M_AXI_SHMEM_ARVALID
      InputStd, // M_AXI_SHMEM_ARSIZE
      InputStd, // M_AXI_SHMEM_ARREGION
      InputStd, // M_AXI_SHMEM_ARREADY
      InputStd, // M_AXI_SHMEM_ARQOS
      InputStd, // M_AXI_SHMEM_ARPROT
      InputStd, // M_AXI_SHMEM_ARLOCK
      InputStd, // M_AXI_SHMEM_ARLEN
      InputStd, // M_AXI_SHMEM_ARCACHE
      InputStd, // M_AXI_SHMEM_ARBURST
      InputStd, // M_AXI_SHMEM_ARADDR
      InputStd, // INTERRUPT_O
      InputStd, // S_AXI_CONTROL_WVALID
      InputStd, // S_AXI_CONTROL_WSTRB
      InputStd, // S_AXI_CONTROL_WREADY
      InputStd, // S_AXI_CONTROL_WLAST
      InputStd, // S_AXI_CONTROL_WDATA
      InputStd, // S_AXI_CONTROL_RVALID
      InputStd, // S_AXI_CONTROL_RRESP
      InputStd, // S_AXI_CONTROL_RREADY
      InputStd, // S_AXI_CONTROL_RDATA
      InputStd, // S_AXI_CONTROL_BVALID
      InputStd, // S_AXI_CONTROL_BRESP
      InputStd, // S_AXI_CONTROL_BREADY
      InputStd, // S_AXI_CONTROL_AWVALID
      InputStd, // S_AXI_CONTROL_AWREADY
      InputStd, // S_AXI_CONTROL_AWADDR
      InputStd, // S_AXI_CONTROL_ARVALID
      InputStd, // S_AXI_CONTROL_ARREADY
      InputStd, // S_AXI_CONTROL_ARADDR
      InputStd, // S_AXI_CONTROL_ARESETN
      InputStd, // S_AXI_CONTROL_ACLK
      BidirStd, // SOC_GPO11
      BidirStd, // SOC_GPO10
      BidirStd, // SOC_GPO9
      BidirStd, // SOC_GPO8
      BidirStd, // SOC_GPO7
      BidirStd, // SOC_GPO6
      BidirStd, // SOC_GPO5
      BidirStd, // SOC_GPO4
      BidirStd, // SOC_GPO3
      BidirStd, // SOC_GPO2
      BidirStd, // SOC_GPO1
      BidirStd, // SOC_GPO0
      InputStd, // SOC_GPI11
      InputStd, // SOC_GPI10
      InputStd, // SOC_GPI9
      InputStd, // SOC_GPI8
      InputStd, // SOC_GPI7
      InputStd, // SOC_GPI6
      InputStd, // SOC_GPI5
      InputStd, // SOC_GPI4
      InputStd, // SOC_GPI3
      InputStd, // SOC_GPI2
      InputStd, // SOC_GPI1
      InputStd, // SOC_GPI0
      BidirStd, // GPIO31
      BidirStd, // GPIO30
      BidirStd, // GPIO29
      BidirStd, // GPIO28
      BidirStd, // GPIO27
      BidirStd, // GPIO26
      BidirStd, // GPIO25
      BidirStd, // GPIO24
      BidirStd, // GPIO23
      BidirStd, // GPIO22
      BidirStd, // GPIO21
      BidirStd, // GPIO20
      BidirStd, // GPIO19
      BidirStd, // GPIO18
      BidirStd, // GPIO17
      BidirStd, // GPIO16
      BidirStd, // GPIO15
      BidirStd, // GPIO14
      BidirStd, // GPIO13
      BidirStd, // GPIO12
      BidirStd, // GPIO11
      BidirStd, // GPIO10
      BidirStd, // GPIO9
      BidirStd, // GPIO8
      BidirStd, // GPIO7
      BidirStd, // GPIO6
      BidirStd, // GPIO5
      BidirStd, // GPIO4
      BidirStd, // GPIO3
      BidirStd, // GPIO2
      BidirStd, // GPIO1
      BidirStd, // GPIO0
      BidirStd, // I2C_SDA
      BidirStd, // I2C_SCL
      BidirStd, // UART_TX
      InputStd, // UART_RX
      InputStd, // SPI_DEV_TPM_CS_L
      InputStd, // SPI_DEV_CS_L
      InputStd, // SPI_DEV_CLK
      BidirStd, // SPI_DEV_D3
      BidirStd, // SPI_DEV_D2
      BidirStd, // SPI_DEV_D1
      BidirStd, // SPI_DEV_D0
      BidirStd, // SPI_HOST_CS_L
      BidirStd, // SPI_HOST_CLK
      BidirStd, // SPI_HOST_D3
      BidirStd, // SPI_HOST_D2
      BidirStd, // SPI_HOST_D1
      BidirStd, // SPI_HOST_D0
      InputStd, // JTAG_TRST_N
      BidirStd, // JTAG_TDO
      InputStd, // JTAG_TDI
      InputStd, // JTAG_TMS
      InputStd, // JTAG_TCK
      InputStd  // POR_N
    }),
    .MioPadType ({
      BidirStd, // MIO11
      BidirStd, // MIO10
      BidirStd, // MIO9
      BidirStd, // MIO8
      BidirStd, // MIO7
      BidirStd, // MIO6
      BidirStd, // MIO5
      BidirStd, // MIO4
      BidirStd, // MIO3
      BidirStd, // MIO2
      BidirStd, // MIO1
      BidirStd  // MIO0
    })
  ) u_padring (
  // This is only used for scan and DFT purposes
    .clk_scan_i   ( 1'b0                  ),
    .scanmode_i   ( prim_mubi_pkg::MuBi4False ),
    .dio_in_raw_o ( dio_in_raw ),
    // Chip IOs
    .dio_pad_io ({
      M_AXI_SHMEM_WVALID,
      M_AXI_SHMEM_WSTRB,
      M_AXI_SHMEM_WREADY,
      M_AXI_SHMEM_WLAST,
      M_AXI_SHMEM_WDATA,
      M_AXI_SHMEM_RVALID,
      M_AXI_SHMEM_RRESP,
      M_AXI_SHMEM_RREADY,
      M_AXI_SHMEM_RLAST,
      M_AXI_SHMEM_RDATA,
      M_AXI_SHMEM_BVALID,
      M_AXI_SHMEM_BRESP,
      M_AXI_SHMEM_BREADY,
      M_AXI_SHMEM_AWVALID,
      M_AXI_SHMEM_AWSIZE,
      M_AXI_SHMEM_AWREGION,
      M_AXI_SHMEM_AWREADY,
      M_AXI_SHMEM_AWQOS,
      M_AXI_SHMEM_AWPROT,
      M_AXI_SHMEM_AWLOCK,
      M_AXI_SHMEM_AWLEN,
      M_AXI_SHMEM_AWCACHE,
      M_AXI_SHMEM_AWBURST,
      M_AXI_SHMEM_AWADDR,
      M_AXI_SHMEM_ARVALID,
      M_AXI_SHMEM_ARSIZE,
      M_AXI_SHMEM_ARREGION,
      M_AXI_SHMEM_ARREADY,
      M_AXI_SHMEM_ARQOS,
      M_AXI_SHMEM_ARPROT,
      M_AXI_SHMEM_ARLOCK,
      M_AXI_SHMEM_ARLEN,
      M_AXI_SHMEM_ARCACHE,
      M_AXI_SHMEM_ARBURST,
      M_AXI_SHMEM_ARADDR,
      INTERRUPT_O,
      S_AXI_CONTROL_WVALID,
      S_AXI_CONTROL_WSTRB,
      S_AXI_CONTROL_WREADY,
      S_AXI_CONTROL_WLAST,
      S_AXI_CONTROL_WDATA,
      S_AXI_CONTROL_RVALID,
      S_AXI_CONTROL_RRESP,
      S_AXI_CONTROL_RREADY,
      S_AXI_CONTROL_RDATA,
      S_AXI_CONTROL_BVALID,
      S_AXI_CONTROL_BRESP,
      S_AXI_CONTROL_BREADY,
      S_AXI_CONTROL_AWVALID,
      S_AXI_CONTROL_AWREADY,
      S_AXI_CONTROL_AWADDR,
      S_AXI_CONTROL_ARVALID,
      S_AXI_CONTROL_ARREADY,
      S_AXI_CONTROL_ARADDR,
      S_AXI_CONTROL_ARESETN,
      S_AXI_CONTROL_ACLK,
      SOC_GPO11,
      SOC_GPO10,
      SOC_GPO9,
      SOC_GPO8,
      SOC_GPO7,
      SOC_GPO6,
      SOC_GPO5,
      SOC_GPO4,
      SOC_GPO3,
      SOC_GPO2,
      SOC_GPO1,
      SOC_GPO0,
      SOC_GPI11,
      SOC_GPI10,
      SOC_GPI9,
      SOC_GPI8,
      SOC_GPI7,
      SOC_GPI6,
      SOC_GPI5,
      SOC_GPI4,
      SOC_GPI3,
      SOC_GPI2,
      SOC_GPI1,
      SOC_GPI0,
      GPIO31,
      GPIO30,
      GPIO29,
      GPIO28,
      GPIO27,
      GPIO26,
      GPIO25,
      GPIO24,
      GPIO23,
      GPIO22,
      GPIO21,
      GPIO20,
      GPIO19,
      GPIO18,
      GPIO17,
      GPIO16,
      GPIO15,
      GPIO14,
      GPIO13,
      GPIO12,
      GPIO11,
      GPIO10,
      GPIO9,
      GPIO8,
      GPIO7,
      GPIO6,
      GPIO5,
      GPIO4,
      GPIO3,
      GPIO2,
      GPIO1,
      GPIO0,
      I2C_SDA,
      I2C_SCL,
      UART_TX,
      UART_RX,
      SPI_DEV_TPM_CS_L,
      SPI_DEV_CS_L,
      SPI_DEV_CLK,
      SPI_DEV_D3,
      SPI_DEV_D2,
      SPI_DEV_D1,
      SPI_DEV_D0,
      SPI_HOST_CS_L,
      SPI_HOST_CLK,
      SPI_HOST_D3,
      SPI_HOST_D2,
      SPI_HOST_D1,
      SPI_HOST_D0,
      JTAG_TRST_N,
      JTAG_TDO,
      JTAG_TDI,
      JTAG_TMS,
      JTAG_TCK,
      POR_N
    }),

    .mio_pad_io ({
      MIO11,
      MIO10,
      MIO9,
      MIO8,
      MIO7,
      MIO6,
      MIO5,
      MIO4,
      MIO3,
      MIO2,
      MIO1,
      MIO0
    }),

    // Core-facing
    .dio_in_o ({
        manual_in_m_axi_shmem_wvalid,
        manual_in_m_axi_shmem_wstrb,
        manual_in_m_axi_shmem_wready,
        manual_in_m_axi_shmem_wlast,
        manual_in_m_axi_shmem_wdata,
        manual_in_m_axi_shmem_rvalid,
        manual_in_m_axi_shmem_rresp,
        manual_in_m_axi_shmem_rready,
        manual_in_m_axi_shmem_rlast,
        manual_in_m_axi_shmem_rdata,
        manual_in_m_axi_shmem_bvalid,
        manual_in_m_axi_shmem_bresp,
        manual_in_m_axi_shmem_bready,
        manual_in_m_axi_shmem_awvalid,
        manual_in_m_axi_shmem_awsize,
        manual_in_m_axi_shmem_awregion,
        manual_in_m_axi_shmem_awready,
        manual_in_m_axi_shmem_awqos,
        manual_in_m_axi_shmem_awprot,
        manual_in_m_axi_shmem_awlock,
        manual_in_m_axi_shmem_awlen,
        manual_in_m_axi_shmem_awcache,
        manual_in_m_axi_shmem_awburst,
        manual_in_m_axi_shmem_awaddr,
        manual_in_m_axi_shmem_arvalid,
        manual_in_m_axi_shmem_arsize,
        manual_in_m_axi_shmem_arregion,
        manual_in_m_axi_shmem_arready,
        manual_in_m_axi_shmem_arqos,
        manual_in_m_axi_shmem_arprot,
        manual_in_m_axi_shmem_arlock,
        manual_in_m_axi_shmem_arlen,
        manual_in_m_axi_shmem_arcache,
        manual_in_m_axi_shmem_arburst,
        manual_in_m_axi_shmem_araddr,
        manual_in_interrupt_o,
        manual_in_s_axi_control_wvalid,
        manual_in_s_axi_control_wstrb,
        manual_in_s_axi_control_wready,
        manual_in_s_axi_control_wlast,
        manual_in_s_axi_control_wdata,
        manual_in_s_axi_control_rvalid,
        manual_in_s_axi_control_rresp,
        manual_in_s_axi_control_rready,
        manual_in_s_axi_control_rdata,
        manual_in_s_axi_control_bvalid,
        manual_in_s_axi_control_bresp,
        manual_in_s_axi_control_bready,
        manual_in_s_axi_control_awvalid,
        manual_in_s_axi_control_awready,
        manual_in_s_axi_control_awaddr,
        manual_in_s_axi_control_arvalid,
        manual_in_s_axi_control_arready,
        manual_in_s_axi_control_araddr,
        manual_in_s_axi_control_aresetn,
        manual_in_s_axi_control_aclk,
        dio_in[DioSocProxySocGpo11],
        dio_in[DioSocProxySocGpo10],
        dio_in[DioSocProxySocGpo9],
        dio_in[DioSocProxySocGpo8],
        dio_in[DioSocProxySocGpo7],
        dio_in[DioSocProxySocGpo6],
        dio_in[DioSocProxySocGpo5],
        dio_in[DioSocProxySocGpo4],
        dio_in[DioSocProxySocGpo3],
        dio_in[DioSocProxySocGpo2],
        dio_in[DioSocProxySocGpo1],
        dio_in[DioSocProxySocGpo0],
        dio_in[DioSocProxySocGpi11],
        dio_in[DioSocProxySocGpi10],
        dio_in[DioSocProxySocGpi9],
        dio_in[DioSocProxySocGpi8],
        dio_in[DioSocProxySocGpi7],
        dio_in[DioSocProxySocGpi6],
        dio_in[DioSocProxySocGpi5],
        dio_in[DioSocProxySocGpi4],
        dio_in[DioSocProxySocGpi3],
        dio_in[DioSocProxySocGpi2],
        dio_in[DioSocProxySocGpi1],
        dio_in[DioSocProxySocGpi0],
        dio_in[DioGpioGpio31],
        dio_in[DioGpioGpio30],
        dio_in[DioGpioGpio29],
        dio_in[DioGpioGpio28],
        dio_in[DioGpioGpio27],
        dio_in[DioGpioGpio26],
        dio_in[DioGpioGpio25],
        dio_in[DioGpioGpio24],
        dio_in[DioGpioGpio23],
        dio_in[DioGpioGpio22],
        dio_in[DioGpioGpio21],
        dio_in[DioGpioGpio20],
        dio_in[DioGpioGpio19],
        dio_in[DioGpioGpio18],
        dio_in[DioGpioGpio17],
        dio_in[DioGpioGpio16],
        dio_in[DioGpioGpio15],
        dio_in[DioGpioGpio14],
        dio_in[DioGpioGpio13],
        dio_in[DioGpioGpio12],
        dio_in[DioGpioGpio11],
        dio_in[DioGpioGpio10],
        dio_in[DioGpioGpio9],
        dio_in[DioGpioGpio8],
        dio_in[DioGpioGpio7],
        dio_in[DioGpioGpio6],
        dio_in[DioGpioGpio5],
        dio_in[DioGpioGpio4],
        dio_in[DioGpioGpio3],
        dio_in[DioGpioGpio2],
        dio_in[DioGpioGpio1],
        dio_in[DioGpioGpio0],
        dio_in[DioI2c0Sda],
        dio_in[DioI2c0Scl],
        dio_in[DioUart0Tx],
        dio_in[DioUart0Rx],
        dio_in[DioSpiDeviceTpmCsb],
        dio_in[DioSpiDeviceCsb],
        dio_in[DioSpiDeviceSck],
        dio_in[DioSpiDeviceSd3],
        dio_in[DioSpiDeviceSd2],
        dio_in[DioSpiDeviceSd1],
        dio_in[DioSpiDeviceSd0],
        dio_in[DioSpiHost0Csb],
        dio_in[DioSpiHost0Sck],
        dio_in[DioSpiHost0Sd3],
        dio_in[DioSpiHost0Sd2],
        dio_in[DioSpiHost0Sd1],
        dio_in[DioSpiHost0Sd0],
        manual_in_jtag_trst_n,
        manual_in_jtag_tdo,
        manual_in_jtag_tdi,
        manual_in_jtag_tms,
        manual_in_jtag_tck,
        manual_in_por_n
      }),
    .dio_out_i ({
        manual_out_m_axi_shmem_wvalid,
        manual_out_m_axi_shmem_wstrb,
        manual_out_m_axi_shmem_wready,
        manual_out_m_axi_shmem_wlast,
        manual_out_m_axi_shmem_wdata,
        manual_out_m_axi_shmem_rvalid,
        manual_out_m_axi_shmem_rresp,
        manual_out_m_axi_shmem_rready,
        manual_out_m_axi_shmem_rlast,
        manual_out_m_axi_shmem_rdata,
        manual_out_m_axi_shmem_bvalid,
        manual_out_m_axi_shmem_bresp,
        manual_out_m_axi_shmem_bready,
        manual_out_m_axi_shmem_awvalid,
        manual_out_m_axi_shmem_awsize,
        manual_out_m_axi_shmem_awregion,
        manual_out_m_axi_shmem_awready,
        manual_out_m_axi_shmem_awqos,
        manual_out_m_axi_shmem_awprot,
        manual_out_m_axi_shmem_awlock,
        manual_out_m_axi_shmem_awlen,
        manual_out_m_axi_shmem_awcache,
        manual_out_m_axi_shmem_awburst,
        manual_out_m_axi_shmem_awaddr,
        manual_out_m_axi_shmem_arvalid,
        manual_out_m_axi_shmem_arsize,
        manual_out_m_axi_shmem_arregion,
        manual_out_m_axi_shmem_arready,
        manual_out_m_axi_shmem_arqos,
        manual_out_m_axi_shmem_arprot,
        manual_out_m_axi_shmem_arlock,
        manual_out_m_axi_shmem_arlen,
        manual_out_m_axi_shmem_arcache,
        manual_out_m_axi_shmem_arburst,
        manual_out_m_axi_shmem_araddr,
        manual_out_interrupt_o,
        manual_out_s_axi_control_wvalid,
        manual_out_s_axi_control_wstrb,
        manual_out_s_axi_control_wready,
        manual_out_s_axi_control_wlast,
        manual_out_s_axi_control_wdata,
        manual_out_s_axi_control_rvalid,
        manual_out_s_axi_control_rresp,
        manual_out_s_axi_control_rready,
        manual_out_s_axi_control_rdata,
        manual_out_s_axi_control_bvalid,
        manual_out_s_axi_control_bresp,
        manual_out_s_axi_control_bready,
        manual_out_s_axi_control_awvalid,
        manual_out_s_axi_control_awready,
        manual_out_s_axi_control_awaddr,
        manual_out_s_axi_control_arvalid,
        manual_out_s_axi_control_arready,
        manual_out_s_axi_control_araddr,
        manual_out_s_axi_control_aresetn,
        manual_out_s_axi_control_aclk,
        dio_out[DioSocProxySocGpo11],
        dio_out[DioSocProxySocGpo10],
        dio_out[DioSocProxySocGpo9],
        dio_out[DioSocProxySocGpo8],
        dio_out[DioSocProxySocGpo7],
        dio_out[DioSocProxySocGpo6],
        dio_out[DioSocProxySocGpo5],
        dio_out[DioSocProxySocGpo4],
        dio_out[DioSocProxySocGpo3],
        dio_out[DioSocProxySocGpo2],
        dio_out[DioSocProxySocGpo1],
        dio_out[DioSocProxySocGpo0],
        dio_out[DioSocProxySocGpi11],
        dio_out[DioSocProxySocGpi10],
        dio_out[DioSocProxySocGpi9],
        dio_out[DioSocProxySocGpi8],
        dio_out[DioSocProxySocGpi7],
        dio_out[DioSocProxySocGpi6],
        dio_out[DioSocProxySocGpi5],
        dio_out[DioSocProxySocGpi4],
        dio_out[DioSocProxySocGpi3],
        dio_out[DioSocProxySocGpi2],
        dio_out[DioSocProxySocGpi1],
        dio_out[DioSocProxySocGpi0],
        dio_out[DioGpioGpio31],
        dio_out[DioGpioGpio30],
        dio_out[DioGpioGpio29],
        dio_out[DioGpioGpio28],
        dio_out[DioGpioGpio27],
        dio_out[DioGpioGpio26],
        dio_out[DioGpioGpio25],
        dio_out[DioGpioGpio24],
        dio_out[DioGpioGpio23],
        dio_out[DioGpioGpio22],
        dio_out[DioGpioGpio21],
        dio_out[DioGpioGpio20],
        dio_out[DioGpioGpio19],
        dio_out[DioGpioGpio18],
        dio_out[DioGpioGpio17],
        dio_out[DioGpioGpio16],
        dio_out[DioGpioGpio15],
        dio_out[DioGpioGpio14],
        dio_out[DioGpioGpio13],
        dio_out[DioGpioGpio12],
        dio_out[DioGpioGpio11],
        dio_out[DioGpioGpio10],
        dio_out[DioGpioGpio9],
        dio_out[DioGpioGpio8],
        dio_out[DioGpioGpio7],
        dio_out[DioGpioGpio6],
        dio_out[DioGpioGpio5],
        dio_out[DioGpioGpio4],
        dio_out[DioGpioGpio3],
        dio_out[DioGpioGpio2],
        dio_out[DioGpioGpio1],
        dio_out[DioGpioGpio0],
        dio_out[DioI2c0Sda],
        dio_out[DioI2c0Scl],
        dio_out[DioUart0Tx],
        dio_out[DioUart0Rx],
        dio_out[DioSpiDeviceTpmCsb],
        dio_out[DioSpiDeviceCsb],
        dio_out[DioSpiDeviceSck],
        dio_out[DioSpiDeviceSd3],
        dio_out[DioSpiDeviceSd2],
        dio_out[DioSpiDeviceSd1],
        dio_out[DioSpiDeviceSd0],
        dio_out[DioSpiHost0Csb],
        dio_out[DioSpiHost0Sck],
        dio_out[DioSpiHost0Sd3],
        dio_out[DioSpiHost0Sd2],
        dio_out[DioSpiHost0Sd1],
        dio_out[DioSpiHost0Sd0],
        manual_out_jtag_trst_n,
        manual_out_jtag_tdo,
        manual_out_jtag_tdi,
        manual_out_jtag_tms,
        manual_out_jtag_tck,
        manual_out_por_n
      }),
    .dio_oe_i ({
        manual_oe_m_axi_shmem_wvalid,
        manual_oe_m_axi_shmem_wstrb,
        manual_oe_m_axi_shmem_wready,
        manual_oe_m_axi_shmem_wlast,
        manual_oe_m_axi_shmem_wdata,
        manual_oe_m_axi_shmem_rvalid,
        manual_oe_m_axi_shmem_rresp,
        manual_oe_m_axi_shmem_rready,
        manual_oe_m_axi_shmem_rlast,
        manual_oe_m_axi_shmem_rdata,
        manual_oe_m_axi_shmem_bvalid,
        manual_oe_m_axi_shmem_bresp,
        manual_oe_m_axi_shmem_bready,
        manual_oe_m_axi_shmem_awvalid,
        manual_oe_m_axi_shmem_awsize,
        manual_oe_m_axi_shmem_awregion,
        manual_oe_m_axi_shmem_awready,
        manual_oe_m_axi_shmem_awqos,
        manual_oe_m_axi_shmem_awprot,
        manual_oe_m_axi_shmem_awlock,
        manual_oe_m_axi_shmem_awlen,
        manual_oe_m_axi_shmem_awcache,
        manual_oe_m_axi_shmem_awburst,
        manual_oe_m_axi_shmem_awaddr,
        manual_oe_m_axi_shmem_arvalid,
        manual_oe_m_axi_shmem_arsize,
        manual_oe_m_axi_shmem_arregion,
        manual_oe_m_axi_shmem_arready,
        manual_oe_m_axi_shmem_arqos,
        manual_oe_m_axi_shmem_arprot,
        manual_oe_m_axi_shmem_arlock,
        manual_oe_m_axi_shmem_arlen,
        manual_oe_m_axi_shmem_arcache,
        manual_oe_m_axi_shmem_arburst,
        manual_oe_m_axi_shmem_araddr,
        manual_oe_interrupt_o,
        manual_oe_s_axi_control_wvalid,
        manual_oe_s_axi_control_wstrb,
        manual_oe_s_axi_control_wready,
        manual_oe_s_axi_control_wlast,
        manual_oe_s_axi_control_wdata,
        manual_oe_s_axi_control_rvalid,
        manual_oe_s_axi_control_rresp,
        manual_oe_s_axi_control_rready,
        manual_oe_s_axi_control_rdata,
        manual_oe_s_axi_control_bvalid,
        manual_oe_s_axi_control_bresp,
        manual_oe_s_axi_control_bready,
        manual_oe_s_axi_control_awvalid,
        manual_oe_s_axi_control_awready,
        manual_oe_s_axi_control_awaddr,
        manual_oe_s_axi_control_arvalid,
        manual_oe_s_axi_control_arready,
        manual_oe_s_axi_control_araddr,
        manual_oe_s_axi_control_aresetn,
        manual_oe_s_axi_control_aclk,
        dio_oe[DioSocProxySocGpo11],
        dio_oe[DioSocProxySocGpo10],
        dio_oe[DioSocProxySocGpo9],
        dio_oe[DioSocProxySocGpo8],
        dio_oe[DioSocProxySocGpo7],
        dio_oe[DioSocProxySocGpo6],
        dio_oe[DioSocProxySocGpo5],
        dio_oe[DioSocProxySocGpo4],
        dio_oe[DioSocProxySocGpo3],
        dio_oe[DioSocProxySocGpo2],
        dio_oe[DioSocProxySocGpo1],
        dio_oe[DioSocProxySocGpo0],
        dio_oe[DioSocProxySocGpi11],
        dio_oe[DioSocProxySocGpi10],
        dio_oe[DioSocProxySocGpi9],
        dio_oe[DioSocProxySocGpi8],
        dio_oe[DioSocProxySocGpi7],
        dio_oe[DioSocProxySocGpi6],
        dio_oe[DioSocProxySocGpi5],
        dio_oe[DioSocProxySocGpi4],
        dio_oe[DioSocProxySocGpi3],
        dio_oe[DioSocProxySocGpi2],
        dio_oe[DioSocProxySocGpi1],
        dio_oe[DioSocProxySocGpi0],
        dio_oe[DioGpioGpio31],
        dio_oe[DioGpioGpio30],
        dio_oe[DioGpioGpio29],
        dio_oe[DioGpioGpio28],
        dio_oe[DioGpioGpio27],
        dio_oe[DioGpioGpio26],
        dio_oe[DioGpioGpio25],
        dio_oe[DioGpioGpio24],
        dio_oe[DioGpioGpio23],
        dio_oe[DioGpioGpio22],
        dio_oe[DioGpioGpio21],
        dio_oe[DioGpioGpio20],
        dio_oe[DioGpioGpio19],
        dio_oe[DioGpioGpio18],
        dio_oe[DioGpioGpio17],
        dio_oe[DioGpioGpio16],
        dio_oe[DioGpioGpio15],
        dio_oe[DioGpioGpio14],
        dio_oe[DioGpioGpio13],
        dio_oe[DioGpioGpio12],
        dio_oe[DioGpioGpio11],
        dio_oe[DioGpioGpio10],
        dio_oe[DioGpioGpio9],
        dio_oe[DioGpioGpio8],
        dio_oe[DioGpioGpio7],
        dio_oe[DioGpioGpio6],
        dio_oe[DioGpioGpio5],
        dio_oe[DioGpioGpio4],
        dio_oe[DioGpioGpio3],
        dio_oe[DioGpioGpio2],
        dio_oe[DioGpioGpio1],
        dio_oe[DioGpioGpio0],
        dio_oe[DioI2c0Sda],
        dio_oe[DioI2c0Scl],
        dio_oe[DioUart0Tx],
        dio_oe[DioUart0Rx],
        dio_oe[DioSpiDeviceTpmCsb],
        dio_oe[DioSpiDeviceCsb],
        dio_oe[DioSpiDeviceSck],
        dio_oe[DioSpiDeviceSd3],
        dio_oe[DioSpiDeviceSd2],
        dio_oe[DioSpiDeviceSd1],
        dio_oe[DioSpiDeviceSd0],
        dio_oe[DioSpiHost0Csb],
        dio_oe[DioSpiHost0Sck],
        dio_oe[DioSpiHost0Sd3],
        dio_oe[DioSpiHost0Sd2],
        dio_oe[DioSpiHost0Sd1],
        dio_oe[DioSpiHost0Sd0],
        manual_oe_jtag_trst_n,
        manual_oe_jtag_tdo,
        manual_oe_jtag_tdi,
        manual_oe_jtag_tms,
        manual_oe_jtag_tck,
        manual_oe_por_n
      }),
    .dio_attr_i ({
        manual_attr_m_axi_shmem_wvalid,
        manual_attr_m_axi_shmem_wstrb,
        manual_attr_m_axi_shmem_wready,
        manual_attr_m_axi_shmem_wlast,
        manual_attr_m_axi_shmem_wdata,
        manual_attr_m_axi_shmem_rvalid,
        manual_attr_m_axi_shmem_rresp,
        manual_attr_m_axi_shmem_rready,
        manual_attr_m_axi_shmem_rlast,
        manual_attr_m_axi_shmem_rdata,
        manual_attr_m_axi_shmem_bvalid,
        manual_attr_m_axi_shmem_bresp,
        manual_attr_m_axi_shmem_bready,
        manual_attr_m_axi_shmem_awvalid,
        manual_attr_m_axi_shmem_awsize,
        manual_attr_m_axi_shmem_awregion,
        manual_attr_m_axi_shmem_awready,
        manual_attr_m_axi_shmem_awqos,
        manual_attr_m_axi_shmem_awprot,
        manual_attr_m_axi_shmem_awlock,
        manual_attr_m_axi_shmem_awlen,
        manual_attr_m_axi_shmem_awcache,
        manual_attr_m_axi_shmem_awburst,
        manual_attr_m_axi_shmem_awaddr,
        manual_attr_m_axi_shmem_arvalid,
        manual_attr_m_axi_shmem_arsize,
        manual_attr_m_axi_shmem_arregion,
        manual_attr_m_axi_shmem_arready,
        manual_attr_m_axi_shmem_arqos,
        manual_attr_m_axi_shmem_arprot,
        manual_attr_m_axi_shmem_arlock,
        manual_attr_m_axi_shmem_arlen,
        manual_attr_m_axi_shmem_arcache,
        manual_attr_m_axi_shmem_arburst,
        manual_attr_m_axi_shmem_araddr,
        manual_attr_interrupt_o,
        manual_attr_s_axi_control_wvalid,
        manual_attr_s_axi_control_wstrb,
        manual_attr_s_axi_control_wready,
        manual_attr_s_axi_control_wlast,
        manual_attr_s_axi_control_wdata,
        manual_attr_s_axi_control_rvalid,
        manual_attr_s_axi_control_rresp,
        manual_attr_s_axi_control_rready,
        manual_attr_s_axi_control_rdata,
        manual_attr_s_axi_control_bvalid,
        manual_attr_s_axi_control_bresp,
        manual_attr_s_axi_control_bready,
        manual_attr_s_axi_control_awvalid,
        manual_attr_s_axi_control_awready,
        manual_attr_s_axi_control_awaddr,
        manual_attr_s_axi_control_arvalid,
        manual_attr_s_axi_control_arready,
        manual_attr_s_axi_control_araddr,
        manual_attr_s_axi_control_aresetn,
        manual_attr_s_axi_control_aclk,
        dio_attr[DioSocProxySocGpo11],
        dio_attr[DioSocProxySocGpo10],
        dio_attr[DioSocProxySocGpo9],
        dio_attr[DioSocProxySocGpo8],
        dio_attr[DioSocProxySocGpo7],
        dio_attr[DioSocProxySocGpo6],
        dio_attr[DioSocProxySocGpo5],
        dio_attr[DioSocProxySocGpo4],
        dio_attr[DioSocProxySocGpo3],
        dio_attr[DioSocProxySocGpo2],
        dio_attr[DioSocProxySocGpo1],
        dio_attr[DioSocProxySocGpo0],
        dio_attr[DioSocProxySocGpi11],
        dio_attr[DioSocProxySocGpi10],
        dio_attr[DioSocProxySocGpi9],
        dio_attr[DioSocProxySocGpi8],
        dio_attr[DioSocProxySocGpi7],
        dio_attr[DioSocProxySocGpi6],
        dio_attr[DioSocProxySocGpi5],
        dio_attr[DioSocProxySocGpi4],
        dio_attr[DioSocProxySocGpi3],
        dio_attr[DioSocProxySocGpi2],
        dio_attr[DioSocProxySocGpi1],
        dio_attr[DioSocProxySocGpi0],
        dio_attr[DioGpioGpio31],
        dio_attr[DioGpioGpio30],
        dio_attr[DioGpioGpio29],
        dio_attr[DioGpioGpio28],
        dio_attr[DioGpioGpio27],
        dio_attr[DioGpioGpio26],
        dio_attr[DioGpioGpio25],
        dio_attr[DioGpioGpio24],
        dio_attr[DioGpioGpio23],
        dio_attr[DioGpioGpio22],
        dio_attr[DioGpioGpio21],
        dio_attr[DioGpioGpio20],
        dio_attr[DioGpioGpio19],
        dio_attr[DioGpioGpio18],
        dio_attr[DioGpioGpio17],
        dio_attr[DioGpioGpio16],
        dio_attr[DioGpioGpio15],
        dio_attr[DioGpioGpio14],
        dio_attr[DioGpioGpio13],
        dio_attr[DioGpioGpio12],
        dio_attr[DioGpioGpio11],
        dio_attr[DioGpioGpio10],
        dio_attr[DioGpioGpio9],
        dio_attr[DioGpioGpio8],
        dio_attr[DioGpioGpio7],
        dio_attr[DioGpioGpio6],
        dio_attr[DioGpioGpio5],
        dio_attr[DioGpioGpio4],
        dio_attr[DioGpioGpio3],
        dio_attr[DioGpioGpio2],
        dio_attr[DioGpioGpio1],
        dio_attr[DioGpioGpio0],
        dio_attr[DioI2c0Sda],
        dio_attr[DioI2c0Scl],
        dio_attr[DioUart0Tx],
        dio_attr[DioUart0Rx],
        dio_attr[DioSpiDeviceTpmCsb],
        dio_attr[DioSpiDeviceCsb],
        dio_attr[DioSpiDeviceSck],
        dio_attr[DioSpiDeviceSd3],
        dio_attr[DioSpiDeviceSd2],
        dio_attr[DioSpiDeviceSd1],
        dio_attr[DioSpiDeviceSd0],
        dio_attr[DioSpiHost0Csb],
        dio_attr[DioSpiHost0Sck],
        dio_attr[DioSpiHost0Sd3],
        dio_attr[DioSpiHost0Sd2],
        dio_attr[DioSpiHost0Sd1],
        dio_attr[DioSpiHost0Sd0],
        manual_attr_jtag_trst_n,
        manual_attr_jtag_tdo,
        manual_attr_jtag_tdi,
        manual_attr_jtag_tms,
        manual_attr_jtag_tck,
        manual_attr_por_n
      }),

    .mio_in_o (mio_in[11:0]),
    .mio_out_i (mio_out[11:0]),
    .mio_oe_i (mio_oe[11:0]),
    .mio_attr_i (mio_attr[11:0]),
    .mio_in_raw_o (mio_in_raw[11:0])
  );





  //////////////////////////////////
  // AST - Common for all targets //
  //////////////////////////////////

  // pwrmgr interface
  pwrmgr_pkg::pwr_ast_req_t base_ast_pwr;
  pwrmgr_pkg::pwr_ast_rsp_t ast_base_pwr;
  pwrmgr_pkg::pwr_boot_status_t pwrmgr_boot_status;

  // assorted ast status
  ast_pkg::ast_pwst_t ast_pwst;

  // TLUL interface
  tlul_pkg::tl_h2d_t base_ast_bus;
  tlul_pkg::tl_d2h_t ast_base_bus;

  // synchronization clocks / rests
  clkmgr_pkg::clkmgr_out_t clkmgr_aon_clocks;
  rstmgr_pkg::rstmgr_out_t rstmgr_aon_resets;

  // external clock
  logic ext_clk;

  // monitored clock
  logic sck_monitor;

  // observe interface
  logic [7:0] otp_obs;
  ast_pkg::ast_obs_ctrl_t obs_ctrl;

  // otp power sequence
  otp_ctrl_pkg::otp_ast_req_t otp_ctrl_otp_ast_pwr_seq;
  otp_ctrl_pkg::otp_ast_rsp_t otp_ctrl_otp_ast_pwr_seq_h;


  // entropy source interface
  // The entropy source pacakge definition should eventually be moved to es
  entropy_src_pkg::entropy_src_hw_if_req_t entropy_src_hw_if_req;
  entropy_src_pkg::entropy_src_hw_if_rsp_t entropy_src_hw_if_rsp;

  // entropy distribution network
  edn_pkg::edn_req_t ast_edn_edn_req;
  edn_pkg::edn_rsp_t ast_edn_edn_rsp;

  // alerts interface
  ast_pkg::ast_alert_rsp_t ast_alert_rsp;
  ast_pkg::ast_alert_req_t ast_alert_req;


  // clock bypass req/ack
  prim_mubi_pkg::mubi4_t io_clk_byp_req;
  prim_mubi_pkg::mubi4_t io_clk_byp_ack;
  prim_mubi_pkg::mubi4_t all_clk_byp_req;
  prim_mubi_pkg::mubi4_t all_clk_byp_ack;
  prim_mubi_pkg::mubi4_t hi_speed_sel;
  prim_mubi_pkg::mubi4_t div_step_down_req;

  // DFT connections
  logic scan_en;
  lc_ctrl_pkg::lc_tx_t lc_dft_en;
  pinmux_pkg::dft_strap_test_req_t dft_strap_test;

  // Jitter enable
  prim_mubi_pkg::mubi4_t jen;

  // reset domain connections
  import rstmgr_pkg::PowerDomains;
  import rstmgr_pkg::DomainAonSel;
  import rstmgr_pkg::Domain0Sel;

  // Memory configuration connections
  ast_pkg::spm_rm_t ast_ram_1p_cfg;
  ast_pkg::spm_rm_t ast_rf_cfg;
  ast_pkg::spm_rm_t ast_rom_cfg;
  ast_pkg::dpm_rm_t ast_ram_2p_fcfg;
  ast_pkg::dpm_rm_t ast_ram_2p_lcfg;

  // conversion from ast structure to memory centric structures
  prim_ram_1p_pkg::ram_1p_cfg_t ram_1p_cfg;
  assign ram_1p_cfg = '{
    ram_cfg: '{
                cfg_en: ast_ram_1p_cfg.marg_en,
                cfg:    ast_ram_1p_cfg.marg
              },
    rf_cfg:  '{
                cfg_en: ast_rf_cfg.marg_en,
                cfg:    ast_rf_cfg.marg
              }
  };

  logic unused_usb_ram_2p_cfg;
  assign unused_usb_ram_2p_cfg = ^{ast_ram_2p_fcfg.marg_en_a,
                                   ast_ram_2p_fcfg.marg_a,
                                   ast_ram_2p_fcfg.marg_en_b,
                                   ast_ram_2p_fcfg.marg_b};

  // this maps as follows:
  // assign spi_ram_2p_cfg = {10'h000, ram_2p_cfg_i.a_ram_lcfg, ram_2p_cfg_i.b_ram_lcfg};
  prim_ram_2p_pkg::ram_2p_cfg_t spi_ram_2p_cfg;
  assign spi_ram_2p_cfg = '{
    a_ram_lcfg: '{
                   cfg_en: ast_ram_2p_lcfg.marg_en_a,
                   cfg:    ast_ram_2p_lcfg.marg_a
                 },
    b_ram_lcfg: '{
                   cfg_en: ast_ram_2p_lcfg.marg_en_b,
                   cfg:    ast_ram_2p_lcfg.marg_b
                 },
    default: '0
  };

  prim_rom_pkg::rom_cfg_t rom_cfg;
  assign rom_cfg = '{
    cfg_en: ast_rom_cfg.marg_en,
    cfg: ast_rom_cfg.marg
  };


  //////////////////////////////////
  // AST - Custom for targets     //
  //////////////////////////////////


  assign ast_base_pwr.main_pok = ast_pwst.main_pok;

  logic [rstmgr_pkg::PowerDomains-1:0] por_n;
  assign por_n = {ast_pwst.main_pok, ast_pwst.aon_pok};

  // TODO: Hook this up when FPGA pads are updated
  assign ext_clk = '0;
  assign pad2ast = '0;

  logic clk_main, clk_usb_48mhz, clk_aon, rst_n, srst_n;
  clkgen_xil7series # (
    .AddClkBuf(0)
  ) clkgen (
    .clk_i(manual_in_io_clk),
    .rst_ni(manual_in_por_n),
    .srst_ni(srst_n),
    .clk_main_o(clk_main),
    .clk_48MHz_o(clk_usb_48mhz),
    .clk_aon_o(clk_aon),
    .rst_no(rst_n)
  );

  logic [31:0] fpga_info;
  usr_access_xil7series u_info (
    .info_o(fpga_info)
  );

  ast_pkg::clks_osc_byp_t clks_osc_byp;
  assign clks_osc_byp = '{
    usb: clk_usb_48mhz,
    sys: clk_main,
    io:  clk_main,
    aon: clk_aon
  };


  prim_mubi_pkg::mubi4_t ast_init_done;

  ast #(
    .EntropyStreams(ast_pkg::EntropyStreams),
    .AdcChannels(ast_pkg::AdcChannels),
    .AdcDataWidth(ast_pkg::AdcDataWidth),
    .UsbCalibWidth(ast_pkg::UsbCalibWidth),
    .Ast2PadOutWidth(ast_pkg::Ast2PadOutWidth),
    .Pad2AstInWidth(ast_pkg::Pad2AstInWidth)
  ) u_ast (
    // external POR
    .por_ni                ( rst_n ),

    // USB IO Pull-up Calibration Setting
    .usb_io_pu_cal_o       ( ),

    // clocks' oschillator bypass for FPGA
    .clk_osc_byp_i         ( clks_osc_byp ),

    // adc
    .adc_a0_ai             ( '0 ),
    .adc_a1_ai             ( '0 ),

    // Direct short to PAD
    .ast2pad_t0_ao         (  ),
    .ast2pad_t1_ao         (  ),

    // clocks and resets supplied for detection
    .sns_clks_i            ( clkmgr_aon_clocks    ),
    .sns_rsts_i            ( rstmgr_aon_resets    ),
    .sns_spi_ext_clk_i     ( sck_monitor          ),
    // tlul
    .tl_i                  ( base_ast_bus ),
    .tl_o                  ( ast_base_bus ),
    // init done indication
    .ast_init_done_o       ( ast_init_done ),
    // buffered clocks & resets
    .clk_ast_tlul_i (clkmgr_aon_clocks.clk_io_div4_infra),
    .clk_ast_adc_i (clkmgr_aon_clocks.clk_aon_peri),
    .clk_ast_alert_i (clkmgr_aon_clocks.clk_io_div4_secure),
    .clk_ast_es_i (clkmgr_aon_clocks.clk_main_secure),
    .clk_ast_rng_i (clkmgr_aon_clocks.clk_main_secure),
    .clk_ast_usb_i (clkmgr_aon_clocks.clk_usb_peri),
    .rst_ast_tlul_ni (rstmgr_aon_resets.rst_lc_io_div4_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_adc_ni (rstmgr_aon_resets.rst_lc_aon_n[rstmgr_pkg::DomainAonSel]),
    .rst_ast_alert_ni (rstmgr_aon_resets.rst_lc_io_div4_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_es_ni (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_rng_ni (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_usb_ni (rstmgr_aon_resets.rst_por_usb_n[rstmgr_pkg::Domain0Sel]),
    .clk_ast_ext_i         ( ext_clk ),

    // pok test for FPGA
    .vcc_supp_i            ( 1'b1 ),
    .vcaon_supp_i          ( 1'b1 ),
    .vcmain_supp_i         ( 1'b1 ),
    .vioa_supp_i           ( 1'b1 ),
    .viob_supp_i           ( 1'b1 ),
    // pok
    .ast_pwst_o            ( ast_pwst ),
    .ast_pwst_h_o          ( ),
    // main regulator
    .main_env_iso_en_i     ( base_ast_pwr.pwr_clamp_env ),
    .main_pd_ni            ( base_ast_pwr.main_pd_n ),
    // pdm control (flash)/otp
    .flash_power_down_h_o  ( ),
    .flash_power_ready_h_o ( ),
    .otp_power_seq_i       ( otp_ctrl_otp_ast_pwr_seq ),
    .otp_power_seq_h_o     ( otp_ctrl_otp_ast_pwr_seq_h ),
    // system source clock
    .clk_src_sys_en_i      ( base_ast_pwr.core_clk_en ),
    // need to add function in clkmgr
    .clk_src_sys_jen_i     ( jen ),
    .clk_src_sys_o         ( ast_base_clks.clk_sys  ),
    .clk_src_sys_val_o     ( ast_base_pwr.core_clk_val ),
    // aon source clock
    .clk_src_aon_o         ( ast_base_clks.clk_aon ),
    .clk_src_aon_val_o     ( ast_base_pwr.slow_clk_val ),
    // io source clock
    .clk_src_io_en_i       ( base_ast_pwr.io_clk_en ),
    .clk_src_io_o          ( ast_base_clks.clk_io ),
    .clk_src_io_val_o      ( ast_base_pwr.io_clk_val ),
    .clk_src_io_48m_o      ( div_step_down_req ),
    // usb source clock
    .usb_ref_pulse_i       ( '0 ),
    .usb_ref_val_i         ( '0 ),
    .clk_src_usb_en_i      ( base_ast_pwr.usb_clk_en ),
    .clk_src_usb_o         ( ast_base_clks.clk_usb ),
    .clk_src_usb_val_o     ( ast_base_pwr.usb_clk_val ),
    // entropy_src
    .es_req_i              ( entropy_src_hw_if_req ),
    .es_rsp_o              ( entropy_src_hw_if_rsp ),
    // adc
    .adc_pd_i              ( '0 ),
    .adc_chnsel_i          ( '0 ),
    .adc_d_o               (    ),
    .adc_d_val_o           (    ),
    // entropy
    .entropy_rsp_i         ( ast_edn_edn_rsp ),
    .entropy_req_o         ( ast_edn_edn_req ),
    // alerts
    .alert_rsp_i           ( ast_alert_rsp  ),
    .alert_req_o           ( ast_alert_req  ),
    // dft
    .dft_strap_test_i      ( dft_strap_test   ),
    .lc_dft_en_i           ( lc_dft_en        ),
    .fla_obs_i             ( '0 ),
    .usb_obs_i             ( '0 ),
    .otp_obs_i             ( otp_obs ),
    .otm_obs_i             ( '0 ),
    .obs_ctrl_o            ( obs_ctrl ),
    // pinmux related
    .padmux2ast_i          ( '0         ),
    .ast2padmux_o          (            ),
    .ext_freq_is_96m_i     ( hi_speed_sel ),
    .all_clk_byp_req_i     ( all_clk_byp_req  ),
    .all_clk_byp_ack_o     ( all_clk_byp_ack  ),
    .io_clk_byp_req_i      ( io_clk_byp_req   ),
    .io_clk_byp_ack_o      ( io_clk_byp_ack   ),
    .flash_bist_en_o       ( ),
    // Memory configuration connections
    .dpram_rmf_o           ( ast_ram_2p_fcfg ),
    .dpram_rml_o           ( ast_ram_2p_lcfg ),
    .spram_rm_o            ( ast_ram_1p_cfg  ),
    .sprgf_rm_o            ( ast_rf_cfg      ),
    .sprom_rm_o            ( ast_rom_cfg     ),
    // scan
    .dft_scan_md_o         ( scanmode ),
    .scan_shift_en_o       ( scan_en ),
    .scan_reset_no         ( scan_rst_n )
  );


  //////////////////
  // TAP Instance //
  //////////////////

  tlul_pkg::tl_h2d_t dmi_h2d;
  tlul_pkg::tl_d2h_t dmi_d2h;
  jtag_pkg::jtag_req_t jtag_req;
  jtag_pkg::jtag_rsp_t jtag_rsp;

  assign jtag_req.tck    = manual_in_jtag_tck;
  assign jtag_req.tms    = manual_in_jtag_tms;
  assign jtag_req.trst_n = manual_in_jtag_trst_n;
  assign jtag_req.tdi    = manual_in_jtag_tdi;

  assign manual_out_jtag_tck     = '0;
  assign manual_out_jtag_tms     = '0;
  assign manual_out_jtag_trst_n  = '0;
  assign manual_out_jtag_tdi     = '0;
  assign manual_oe_jtag_tck      = '0;
  assign manual_oe_jtag_tms      = '0;
  assign manual_oe_jtag_trst_n   = '0;
  assign manual_oe_jtag_tdi      = '0;
  assign manual_attr_jtag_tck    = '0;
  assign manual_attr_jtag_tms    = '0;
  assign manual_attr_jtag_trst_n = '0;
  assign manual_attr_jtag_tdi    = '0;

  assign manual_out_jtag_tdo     = jtag_rsp.tdo;
  assign manual_oe_jtag_tdo      = jtag_rsp.tdo_oe;
  assign manual_attr_jtag_tdo    = '0;

  logic unused_manual_jtag_sigs;
  assign unused_manual_jtag_sigs = ^{
    manual_in_jtag_tdo
  };

  tlul_jtag_dtm #(
    .IdcodeValue(jtag_id_pkg::LC_DM_COMBINED_JTAG_IDCODE),
    // Notes:
    // - one RV_DM instance uses 9bits
    // - our crossbar tooling expects individual IPs to be spaced apart by 12bits at the moment
    // - the DMI address shifted through jtag is a word address and hence 2bits smaller than this
    // - setting this to 18bits effectively gives us 2^6 = 64 addressable 12bit ranges
    .NumDmiByteAbits(18)
  ) u_tlul_jtag_dtm (
    .clk_i      (clkmgr_aon_clocks.clk_main_infra),
    .rst_ni     (rstmgr_aon_resets.rst_sys_n[rstmgr_pkg::Domain0Sel]),
    .jtag_i     (jtag_req),
    .jtag_o     (jtag_rsp),
    .scan_rst_ni(scan_rst_n),
    .scanmode_i (scanmode),
    .tl_h2d_o   (dmi_h2d),
    .tl_d2h_i   (dmi_d2h)
  );

  ////////////////
  // CTN M-to-1 //
  ////////////////

  tlul_pkg::tl_h2d_t ctn_tl_h2d[2];
  tlul_pkg::tl_d2h_t ctn_tl_d2h[2];

  tlul_pkg::tl_h2d_t ctn_sm1_to_s1n_tl_h2d;
  tlul_pkg::tl_d2h_t ctn_sm1_to_s1n_tl_d2h;

  tlul_socket_m1 #(
    .M         (2),
    .HReqPass  ({2{1'b1}}),
    .HRspPass  ({2{1'b1}}),
    .HReqDepth ({2{4'd0}}),
    .HRspDepth ({2{4'd0}}),
    .DReqPass  (1'b1),
    .DRspPass  (1'b1),
    .DReqDepth (4'd0),
    .DRspDepth (4'd0)
  ) u_ctn_sm1 (
    .clk_i  (clkmgr_aon_clocks.clk_main_infra),
    .rst_ni (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .tl_h_i (ctn_tl_h2d),
    .tl_h_o (ctn_tl_d2h),
    .tl_d_o (ctn_sm1_to_s1n_tl_h2d),
    .tl_d_i (ctn_sm1_to_s1n_tl_d2h)
  );

  ////////////////////////////////////////////
  // CTN Address decoding and SRAM Instance //
  ////////////////////////////////////////////

  localparam int CtnSramDw = top_pkg::TL_DW + tlul_pkg::DataIntgWidth;

  tlul_pkg::tl_h2d_t ctn_s1n_tl_h2d[1];
  tlul_pkg::tl_d2h_t ctn_s1n_tl_d2h[1];

  // Steering signal for address decoding.
  logic [0:0] ctn_dev_sel_s1n;

  logic sram_req, sram_we, sram_rvalid;
  logic [top_pkg::CtnSramAw-1:0] sram_addr;
  logic [CtnSramDw-1:0] sram_wdata, sram_wmask, sram_rdata;

  // Steering of requests.
  // Addresses leaving the RoT through the CTN port are mapped to an internal 1G address space of
  // 0x4000_0000 - 0x8000_0000. However, the CTN RAM only covers a 1MB region inside that space,
  // and hence additional decoding and steering logic is needed here.
  // TODO: this should in the future be replaced by an automatically generated crossbar.
  always_comb begin
    // Default steering to generate error response if address is not within the range
    ctn_dev_sel_s1n = 1'b1;
    // Steering to CTN SRAM.
    if ((ctn_sm1_to_s1n_tl_h2d.a_address & ~(TOP_DARJEELING_RAM_CTN_SIZE_BYTES-1)) ==
        TOP_DARJEELING_RAM_CTN_BASE_ADDR) begin
      ctn_dev_sel_s1n = 1'd0;
    end
  end

  tlul_socket_1n #(
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqDepth (8'h0),
    .DRspDepth (8'h0),
    .N         (1)
  ) u_ctn_s1n (
    .clk_i        (clkmgr_aon_clocks.clk_main_infra),
    .rst_ni       (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .tl_h_i       (ctn_sm1_to_s1n_tl_h2d),
    .tl_h_o       (ctn_sm1_to_s1n_tl_d2h),
    .tl_d_o       (ctn_s1n_tl_h2d),
    .tl_d_i       (ctn_s1n_tl_d2h),
    .dev_select_i (ctn_dev_sel_s1n)
  );

  tlul_adapter_sram #(
    .SramAw(top_pkg::CtnSramAw),
    .SramDw(CtnSramDw - tlul_pkg::DataIntgWidth),
    .Outstanding(2),
    .ByteAccess(1),
    .CmdIntgCheck(1),
    .EnableRspIntgGen(1),
    .EnableDataIntgGen(0),
    .EnableDataIntgPt(1),
    .SecFifoPtr      (0)
  ) u_tlul_adapter_sram_ctn (
    .clk_i       (clkmgr_aon_clocks.clk_main_infra),
    .rst_ni      (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .tl_i        (ctn_s1n_tl_h2d[0]),
    .tl_o        (ctn_s1n_tl_d2h[0]),
    // Ifetch is explicitly allowed
    .en_ifetch_i (prim_mubi_pkg::MuBi4True),
    .req_o       (sram_req),
    .req_type_o  (),
    // SRAM can always accept a request.
    .gnt_i       (1'b1),
    .we_o        (sram_we),
    .addr_o      (sram_addr),
    .wdata_o     (sram_wdata),
    .wmask_o     (sram_wmask),
    .intg_error_o(),
    .rdata_i     (sram_rdata),
    .rvalid_i    (sram_rvalid),
    .rerror_i    ('0)
  );

  prim_ram_1p_adv #(
    .Depth(top_pkg::CtnSramDepth),
    .Width(CtnSramDw),
    .DataBitsPerMask(CtnSramDw),
    .EnableECC(0),
    .EnableParity(0),
    .EnableInputPipeline(1),
    .EnableOutputPipeline(1)
  ) u_prim_ram_1p_adv_ctn (
    .clk_i    (clkmgr_aon_clocks.clk_main_infra),
    .rst_ni   (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .req_i    (sram_req),
    .write_i  (sram_we),
    .addr_i   (sram_addr),
    .wdata_i  (sram_wdata),
    .wmask_i  (sram_wmask),
    .rdata_o  (sram_rdata),
    .rvalid_o (sram_rvalid),
    // No error detection is enabled inside SRAM.
    // Bus ECC is checked at the consumer side.
    .rerror_o (),
    .cfg_i    (ram_1p_cfg)
  );




endmodule : chip_darjeeling_vitis
