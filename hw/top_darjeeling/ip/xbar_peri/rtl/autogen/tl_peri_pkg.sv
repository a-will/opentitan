// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// tl_peri package generated by `tlgen.py` tool

package tl_peri_pkg;

  localparam logic [31:0] ADDR_SPACE_UART0                   = 32'h 30010000;
  localparam logic [31:0] ADDR_SPACE_I2C0                    = 32'h 30080000;
  localparam logic [31:0] ADDR_SPACE_I2C1                    = 32'h 31030000;
  localparam logic [31:0] ADDR_SPACE_I2C2                    = 32'h 31040000;
  localparam logic [31:0] ADDR_SPACE_GPIO                    = 32'h 30000000;
  localparam logic [31:0] ADDR_SPACE_SPI_HOST0               = 32'h 30300000;
  localparam logic [31:0] ADDR_SPACE_SPI_DEVICE              = 32'h 30310000;
  localparam logic [31:0] ADDR_SPACE_RV_TIMER                = 32'h 30100000;
  localparam logic [31:0] ADDR_SPACE_PWRMGR_AON              = 32'h 30400000;
  localparam logic [31:0] ADDR_SPACE_RSTMGR_AON              = 32'h 30410000;
  localparam logic [31:0] ADDR_SPACE_CLKMGR_AON              = 32'h 30420000;
  localparam logic [31:0] ADDR_SPACE_PINMUX_AON              = 32'h 30460000;
  localparam logic [31:0] ADDR_SPACE_OTP_CTRL__CORE          = 32'h 30130000;
  localparam logic [31:0] ADDR_SPACE_OTP_CTRL__PRIM          = 32'h 30138000;
  localparam logic [31:0] ADDR_SPACE_LC_CTRL                 = 32'h 30140000;
  localparam logic [31:0] ADDR_SPACE_SENSOR_CTRL             = 32'h 30020000;
  localparam logic [31:0] ADDR_SPACE_ALERT_HANDLER           = 32'h 30150000;
  localparam logic [31:0] ADDR_SPACE_SRAM_CTRL_RET_AON__REGS = 32'h 30500000;
  localparam logic [31:0] ADDR_SPACE_SRAM_CTRL_RET_AON__RAM  = 32'h 30600000;
  localparam logic [31:0] ADDR_SPACE_AON_TIMER_AON           = 32'h 30470000;
  localparam logic [31:0] ADDR_SPACE_SYSRST_CTRL_AON         = 32'h 31060000;
  localparam logic [31:0] ADDR_SPACE_ADC_CTRL_AON            = 32'h 31070000;
  localparam logic [31:0] ADDR_SPACE_AST                     = 32'h 30480000;

  localparam logic [31:0] ADDR_MASK_UART0                   = 32'h 0000003f;
  localparam logic [31:0] ADDR_MASK_I2C0                    = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_I2C1                    = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_I2C2                    = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_GPIO                    = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_SPI_HOST0               = 32'h 0000003f;
  localparam logic [31:0] ADDR_MASK_SPI_DEVICE              = 32'h 00001fff;
  localparam logic [31:0] ADDR_MASK_RV_TIMER                = 32'h 000001ff;
  localparam logic [31:0] ADDR_MASK_PWRMGR_AON              = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_RSTMGR_AON              = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_CLKMGR_AON              = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_PINMUX_AON              = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_OTP_CTRL__CORE          = 32'h 00007fff;
  localparam logic [31:0] ADDR_MASK_OTP_CTRL__PRIM          = 32'h 0000001f;
  localparam logic [31:0] ADDR_MASK_LC_CTRL                 = 32'h 000000ff;
  localparam logic [31:0] ADDR_MASK_SENSOR_CTRL             = 32'h 0000003f;
  localparam logic [31:0] ADDR_MASK_ALERT_HANDLER           = 32'h 000007ff;
  localparam logic [31:0] ADDR_MASK_SRAM_CTRL_RET_AON__REGS = 32'h 0000001f;
  localparam logic [31:0] ADDR_MASK_SRAM_CTRL_RET_AON__RAM  = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_AON_TIMER_AON           = 32'h 0000003f;
  localparam logic [31:0] ADDR_MASK_SYSRST_CTRL_AON         = 32'h 000000ff;
  localparam logic [31:0] ADDR_MASK_ADC_CTRL_AON            = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_AST                     = 32'h 000003ff;

  localparam int N_HOST   = 1;
  localparam int N_DEVICE = 23;

  typedef enum int {
    TlUart0 = 0,
    TlI2C0 = 1,
    TlI2C1 = 2,
    TlI2C2 = 3,
    TlGpio = 4,
    TlSpiHost0 = 5,
    TlSpiDevice = 6,
    TlRvTimer = 7,
    TlPwrmgrAon = 8,
    TlRstmgrAon = 9,
    TlClkmgrAon = 10,
    TlPinmuxAon = 11,
    TlOtpCtrlCore = 12,
    TlOtpCtrlPrim = 13,
    TlLcCtrl = 14,
    TlSensorCtrl = 15,
    TlAlertHandler = 16,
    TlSramCtrlRetAonRegs = 17,
    TlSramCtrlRetAonRam = 18,
    TlAonTimerAon = 19,
    TlSysrstCtrlAon = 20,
    TlAdcCtrlAon = 21,
    TlAst = 22
  } tl_device_e;

  typedef enum int {
    TlMain = 0
  } tl_host_e;

endpackage
