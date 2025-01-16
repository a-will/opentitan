// Copyright lowRISC contributors (OpenTitan project).
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// ------------------- W A R N I N G: A U T O - G E N E R A T E D   C O D E !! -------------------//
// PLEASE DO NOT HAND-EDIT THIS FILE. IT HAS BEEN AUTO-GENERATED WITH THE FOLLOWING COMMAND:
// util/topgen.py -t hw/top_darjeeling/data/top_darjeeling.hjson
// -o hw/top_darjeeling

#ifndef OPENTITAN_HW_TOP_DARJEELING_SW_AUTOGEN_TOP_DARJEELING_SOC_MBX_H_
#define OPENTITAN_HW_TOP_DARJEELING_SW_AUTOGEN_TOP_DARJEELING_SOC_MBX_H_

/**
 * @file
 * @brief Top-specific Definitions
 *
 * This file contains preprocessor and type definitions for use within the
 * device C/C++ codebase.
 *
 * These definitions are for information that depends on the top-specific chip
 * configuration, which includes:
 * - Device Memory Information (for Peripherals and Memory)
 * - Pinmux Pin/Select Names
 * - Power Manager Wakeups
 */

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Peripheral base address for soc device on mbx0 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_MBX0_SOC_BASE_ADDR 0x1465000u

/**
 * Peripheral size for soc device on mbx0 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_MBX0_SOC_BASE_ADDR and
 * `TOP_DARJEELING_MBX0_SOC_BASE_ADDR + TOP_DARJEELING_MBX0_SOC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_MBX0_SOC_SIZE_BYTES 0x20u

/**
 * Peripheral base address for soc device on mbx1 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_MBX1_SOC_BASE_ADDR 0x1465100u

/**
 * Peripheral size for soc device on mbx1 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_MBX1_SOC_BASE_ADDR and
 * `TOP_DARJEELING_MBX1_SOC_BASE_ADDR + TOP_DARJEELING_MBX1_SOC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_MBX1_SOC_SIZE_BYTES 0x20u

/**
 * Peripheral base address for soc device on mbx2 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_MBX2_SOC_BASE_ADDR 0x1465200u

/**
 * Peripheral size for soc device on mbx2 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_MBX2_SOC_BASE_ADDR and
 * `TOP_DARJEELING_MBX2_SOC_BASE_ADDR + TOP_DARJEELING_MBX2_SOC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_MBX2_SOC_SIZE_BYTES 0x20u

/**
 * Peripheral base address for soc device on mbx3 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_MBX3_SOC_BASE_ADDR 0x1465300u

/**
 * Peripheral size for soc device on mbx3 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_MBX3_SOC_BASE_ADDR and
 * `TOP_DARJEELING_MBX3_SOC_BASE_ADDR + TOP_DARJEELING_MBX3_SOC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_MBX3_SOC_SIZE_BYTES 0x20u

/**
 * Peripheral base address for soc device on mbx4 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_MBX4_SOC_BASE_ADDR 0x1465400u

/**
 * Peripheral size for soc device on mbx4 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_MBX4_SOC_BASE_ADDR and
 * `TOP_DARJEELING_MBX4_SOC_BASE_ADDR + TOP_DARJEELING_MBX4_SOC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_MBX4_SOC_SIZE_BYTES 0x20u

/**
 * Peripheral base address for soc device on mbx5 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_MBX5_SOC_BASE_ADDR 0x1465500u

/**
 * Peripheral size for soc device on mbx5 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_MBX5_SOC_BASE_ADDR and
 * `TOP_DARJEELING_MBX5_SOC_BASE_ADDR + TOP_DARJEELING_MBX5_SOC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_MBX5_SOC_SIZE_BYTES 0x20u

/**
 * Peripheral base address for soc device on mbx6 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_MBX6_SOC_BASE_ADDR 0x1465600u

/**
 * Peripheral size for soc device on mbx6 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_MBX6_SOC_BASE_ADDR and
 * `TOP_DARJEELING_MBX6_SOC_BASE_ADDR + TOP_DARJEELING_MBX6_SOC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_MBX6_SOC_SIZE_BYTES 0x20u

/**
 * Peripheral base address for soc device on mbx_pcie0 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_MBX_PCIE0_SOC_BASE_ADDR 0x1460100u

/**
 * Peripheral size for soc device on mbx_pcie0 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_MBX_PCIE0_SOC_BASE_ADDR and
 * `TOP_DARJEELING_MBX_PCIE0_SOC_BASE_ADDR + TOP_DARJEELING_MBX_PCIE0_SOC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_MBX_PCIE0_SOC_SIZE_BYTES 0x20u

/**
 * Peripheral base address for soc device on mbx_pcie1 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_MBX_PCIE1_SOC_BASE_ADDR 0x1460200u

/**
 * Peripheral size for soc device on mbx_pcie1 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_MBX_PCIE1_SOC_BASE_ADDR and
 * `TOP_DARJEELING_MBX_PCIE1_SOC_BASE_ADDR + TOP_DARJEELING_MBX_PCIE1_SOC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_MBX_PCIE1_SOC_SIZE_BYTES 0x20u



#define PINMUX_MIO_PERIPH_INSEL_IDX_OFFSET 2

// PERIPH_INSEL ranges from 0 to NUM_MIO_PADS + 2 -1}
//  0 and 1 are tied to value 0 and 1
#define NUM_MIO_PADS 12
#define NUM_DIO_PADS 73

#define PINMUX_PERIPH_OUTSEL_IDX_OFFSET 3

/**
 * Pinmux Peripheral Input.
 */
typedef enum top_darjeeling_pinmux_peripheral_in {
  kTopDarjeelingPinmuxPeripheralInSocProxySocGpi12 = 0, /**< Peripheral Input 0 */
  kTopDarjeelingPinmuxPeripheralInSocProxySocGpi13 = 1, /**< Peripheral Input 1 */
  kTopDarjeelingPinmuxPeripheralInSocProxySocGpi14 = 2, /**< Peripheral Input 2 */
  kTopDarjeelingPinmuxPeripheralInSocProxySocGpi15 = 3, /**< Peripheral Input 3 */
  kTopDarjeelingPinmuxPeripheralInLast = 3, /**< \internal Last valid peripheral input */
} top_darjeeling_pinmux_peripheral_in_t;

/**
 * Pinmux MIO Input Selector.
 */
typedef enum top_darjeeling_pinmux_insel {
  kTopDarjeelingPinmuxInselConstantZero = 0, /**< Tie constantly to zero */
  kTopDarjeelingPinmuxInselConstantOne = 1, /**< Tie constantly to one */
  kTopDarjeelingPinmuxInselMio0 = 2, /**< MIO Pad 0 */
  kTopDarjeelingPinmuxInselMio1 = 3, /**< MIO Pad 1 */
  kTopDarjeelingPinmuxInselMio2 = 4, /**< MIO Pad 2 */
  kTopDarjeelingPinmuxInselMio3 = 5, /**< MIO Pad 3 */
  kTopDarjeelingPinmuxInselMio4 = 6, /**< MIO Pad 4 */
  kTopDarjeelingPinmuxInselMio5 = 7, /**< MIO Pad 5 */
  kTopDarjeelingPinmuxInselMio6 = 8, /**< MIO Pad 6 */
  kTopDarjeelingPinmuxInselMio7 = 9, /**< MIO Pad 7 */
  kTopDarjeelingPinmuxInselMio8 = 10, /**< MIO Pad 8 */
  kTopDarjeelingPinmuxInselMio9 = 11, /**< MIO Pad 9 */
  kTopDarjeelingPinmuxInselMio10 = 12, /**< MIO Pad 10 */
  kTopDarjeelingPinmuxInselMio11 = 13, /**< MIO Pad 11 */
  kTopDarjeelingPinmuxInselLast = 13, /**< \internal Last valid insel value */
} top_darjeeling_pinmux_insel_t;

/**
 * Pinmux MIO Output.
 */
typedef enum top_darjeeling_pinmux_mio_out {
  kTopDarjeelingPinmuxMioOutMio0 = 0, /**< MIO Pad 0 */
  kTopDarjeelingPinmuxMioOutMio1 = 1, /**< MIO Pad 1 */
  kTopDarjeelingPinmuxMioOutMio2 = 2, /**< MIO Pad 2 */
  kTopDarjeelingPinmuxMioOutMio3 = 3, /**< MIO Pad 3 */
  kTopDarjeelingPinmuxMioOutMio4 = 4, /**< MIO Pad 4 */
  kTopDarjeelingPinmuxMioOutMio5 = 5, /**< MIO Pad 5 */
  kTopDarjeelingPinmuxMioOutMio6 = 6, /**< MIO Pad 6 */
  kTopDarjeelingPinmuxMioOutMio7 = 7, /**< MIO Pad 7 */
  kTopDarjeelingPinmuxMioOutMio8 = 8, /**< MIO Pad 8 */
  kTopDarjeelingPinmuxMioOutMio9 = 9, /**< MIO Pad 9 */
  kTopDarjeelingPinmuxMioOutMio10 = 10, /**< MIO Pad 10 */
  kTopDarjeelingPinmuxMioOutMio11 = 11, /**< MIO Pad 11 */
  kTopDarjeelingPinmuxMioOutLast = 11, /**< \internal Last valid mio output */
} top_darjeeling_pinmux_mio_out_t;

/**
 * Pinmux Peripheral Output Selector.
 */
typedef enum top_darjeeling_pinmux_outsel {
  kTopDarjeelingPinmuxOutselConstantZero = 0, /**< Tie constantly to zero */
  kTopDarjeelingPinmuxOutselConstantOne = 1, /**< Tie constantly to one */
  kTopDarjeelingPinmuxOutselConstantHighZ = 2, /**< Tie constantly to high-Z */
  kTopDarjeelingPinmuxOutselSocProxySocGpo12 = 3, /**< Peripheral Output 0 */
  kTopDarjeelingPinmuxOutselSocProxySocGpo13 = 4, /**< Peripheral Output 1 */
  kTopDarjeelingPinmuxOutselSocProxySocGpo14 = 5, /**< Peripheral Output 2 */
  kTopDarjeelingPinmuxOutselSocProxySocGpo15 = 6, /**< Peripheral Output 3 */
  kTopDarjeelingPinmuxOutselOtpCtrlTest0 = 7, /**< Peripheral Output 4 */
  kTopDarjeelingPinmuxOutselLast = 7, /**< \internal Last valid outsel value */
} top_darjeeling_pinmux_outsel_t;

/**
 * Dedicated Pad Selects
 */
typedef enum top_darjeeling_direct_pads {
  kTopDarjeelingDirectPadsSpiHost0Sd0 = 0, /**<  */
  kTopDarjeelingDirectPadsSpiHost0Sd1 = 1, /**<  */
  kTopDarjeelingDirectPadsSpiHost0Sd2 = 2, /**<  */
  kTopDarjeelingDirectPadsSpiHost0Sd3 = 3, /**<  */
  kTopDarjeelingDirectPadsSpiDeviceSd0 = 4, /**<  */
  kTopDarjeelingDirectPadsSpiDeviceSd1 = 5, /**<  */
  kTopDarjeelingDirectPadsSpiDeviceSd2 = 6, /**<  */
  kTopDarjeelingDirectPadsSpiDeviceSd3 = 7, /**<  */
  kTopDarjeelingDirectPadsI2c0Scl = 8, /**<  */
  kTopDarjeelingDirectPadsI2c0Sda = 9, /**<  */
  kTopDarjeelingDirectPadsGpioGpio0 = 10, /**<  */
  kTopDarjeelingDirectPadsGpioGpio1 = 11, /**<  */
  kTopDarjeelingDirectPadsGpioGpio2 = 12, /**<  */
  kTopDarjeelingDirectPadsGpioGpio3 = 13, /**<  */
  kTopDarjeelingDirectPadsGpioGpio4 = 14, /**<  */
  kTopDarjeelingDirectPadsGpioGpio5 = 15, /**<  */
  kTopDarjeelingDirectPadsGpioGpio6 = 16, /**<  */
  kTopDarjeelingDirectPadsGpioGpio7 = 17, /**<  */
  kTopDarjeelingDirectPadsGpioGpio8 = 18, /**<  */
  kTopDarjeelingDirectPadsGpioGpio9 = 19, /**<  */
  kTopDarjeelingDirectPadsGpioGpio10 = 20, /**<  */
  kTopDarjeelingDirectPadsGpioGpio11 = 21, /**<  */
  kTopDarjeelingDirectPadsGpioGpio12 = 22, /**<  */
  kTopDarjeelingDirectPadsGpioGpio13 = 23, /**<  */
  kTopDarjeelingDirectPadsGpioGpio14 = 24, /**<  */
  kTopDarjeelingDirectPadsGpioGpio15 = 25, /**<  */
  kTopDarjeelingDirectPadsGpioGpio16 = 26, /**<  */
  kTopDarjeelingDirectPadsGpioGpio17 = 27, /**<  */
  kTopDarjeelingDirectPadsGpioGpio18 = 28, /**<  */
  kTopDarjeelingDirectPadsGpioGpio19 = 29, /**<  */
  kTopDarjeelingDirectPadsGpioGpio20 = 30, /**<  */
  kTopDarjeelingDirectPadsGpioGpio21 = 31, /**<  */
  kTopDarjeelingDirectPadsGpioGpio22 = 32, /**<  */
  kTopDarjeelingDirectPadsGpioGpio23 = 33, /**<  */
  kTopDarjeelingDirectPadsGpioGpio24 = 34, /**<  */
  kTopDarjeelingDirectPadsGpioGpio25 = 35, /**<  */
  kTopDarjeelingDirectPadsGpioGpio26 = 36, /**<  */
  kTopDarjeelingDirectPadsGpioGpio27 = 37, /**<  */
  kTopDarjeelingDirectPadsGpioGpio28 = 38, /**<  */
  kTopDarjeelingDirectPadsGpioGpio29 = 39, /**<  */
  kTopDarjeelingDirectPadsGpioGpio30 = 40, /**<  */
  kTopDarjeelingDirectPadsGpioGpio31 = 41, /**<  */
  kTopDarjeelingDirectPadsSpiDeviceSck = 42, /**<  */
  kTopDarjeelingDirectPadsSpiDeviceCsb = 43, /**<  */
  kTopDarjeelingDirectPadsSpiDeviceTpmCsb = 44, /**<  */
  kTopDarjeelingDirectPadsUart0Rx = 45, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi0 = 46, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi1 = 47, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi2 = 48, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi3 = 49, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi4 = 50, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi5 = 51, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi6 = 52, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi7 = 53, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi8 = 54, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi9 = 55, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi10 = 56, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpi11 = 57, /**<  */
  kTopDarjeelingDirectPadsSpiHost0Sck = 58, /**<  */
  kTopDarjeelingDirectPadsSpiHost0Csb = 59, /**<  */
  kTopDarjeelingDirectPadsUart0Tx = 60, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo0 = 61, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo1 = 62, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo2 = 63, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo3 = 64, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo4 = 65, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo5 = 66, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo6 = 67, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo7 = 68, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo8 = 69, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo9 = 70, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo10 = 71, /**<  */
  kTopDarjeelingDirectPadsSocProxySocGpo11 = 72, /**<  */
  kTopDarjeelingDirectPadsLast = 72, /**< \internal Last valid direct pad */
} top_darjeeling_direct_pads_t;

/**
 * Muxed Pad Selects
 */
typedef enum top_darjeeling_muxed_pads {
  kTopDarjeelingMuxedPadsMio0 = 0, /**<  */
  kTopDarjeelingMuxedPadsMio1 = 1, /**<  */
  kTopDarjeelingMuxedPadsMio2 = 2, /**<  */
  kTopDarjeelingMuxedPadsMio3 = 3, /**<  */
  kTopDarjeelingMuxedPadsMio4 = 4, /**<  */
  kTopDarjeelingMuxedPadsMio5 = 5, /**<  */
  kTopDarjeelingMuxedPadsMio6 = 6, /**<  */
  kTopDarjeelingMuxedPadsMio7 = 7, /**<  */
  kTopDarjeelingMuxedPadsMio8 = 8, /**<  */
  kTopDarjeelingMuxedPadsMio9 = 9, /**<  */
  kTopDarjeelingMuxedPadsMio10 = 10, /**<  */
  kTopDarjeelingMuxedPadsMio11 = 11, /**<  */
  kTopDarjeelingMuxedPadsLast = 11, /**< \internal Last valid muxed pad */
} top_darjeeling_muxed_pads_t;

/**
 * Power Manager Wakeup Signals
 */
typedef enum top_darjeeling_power_manager_wake_ups {
  kTopDarjeelingPowerManagerWakeUpsPinmuxAonPinWkupReq = 0, /**<  */
  kTopDarjeelingPowerManagerWakeUpsAonTimerAonWkupReq = 1, /**<  */
  kTopDarjeelingPowerManagerWakeUpsSensorCtrlWkupReq = 2, /**<  */
  kTopDarjeelingPowerManagerWakeUpsSocProxyWkupInternalReq = 3, /**<  */
  kTopDarjeelingPowerManagerWakeUpsSocProxyWkupExternalReq = 4, /**<  */
  kTopDarjeelingPowerManagerWakeUpsLast = 4, /**< \internal Last valid pwrmgr wakeup signal */
} top_darjeeling_power_manager_wake_ups_t;

/**
 * Reset Manager Software Controlled Resets
 */
typedef enum top_darjeeling_reset_manager_sw_resets {
  kTopDarjeelingResetManagerSwResetsSpiDevice = 0, /**<  */
  kTopDarjeelingResetManagerSwResetsSpiHost0 = 1, /**<  */
  kTopDarjeelingResetManagerSwResetsI2c0 = 2, /**<  */
  kTopDarjeelingResetManagerSwResetsLast = 2, /**< \internal Last valid rstmgr software reset request */
} top_darjeeling_reset_manager_sw_resets_t;

/**
 * Power Manager Reset Request Signals
 */
typedef enum top_darjeeling_power_manager_reset_requests {
  kTopDarjeelingPowerManagerResetRequestsAonTimerAonAonTimerRstReq = 0, /**<  */
  kTopDarjeelingPowerManagerResetRequestsSocProxyRstReqExternal = 1, /**<  */
  kTopDarjeelingPowerManagerResetRequestsLast = 1, /**< \internal Last valid pwrmgr reset_request signal */
} top_darjeeling_power_manager_reset_requests_t;

/**
 * Clock Manager Software-Controlled ("Gated") Clocks.
 *
 * The Software has full control over these clocks.
 */
typedef enum top_darjeeling_gateable_clocks {
  kTopDarjeelingGateableClocksIoDiv4Peri = 0, /**< Clock clk_io_div4_peri in group peri */
  kTopDarjeelingGateableClocksIoDiv2Peri = 1, /**< Clock clk_io_div2_peri in group peri */
  kTopDarjeelingGateableClocksUsbPeri = 2, /**< Clock clk_usb_peri in group peri */
  kTopDarjeelingGateableClocksLast = 2, /**< \internal Last Valid Gateable Clock */
} top_darjeeling_gateable_clocks_t;

/**
 * Clock Manager Software-Hinted Clocks.
 *
 * The Software has partial control over these clocks. It can ask them to stop,
 * but the clock manager is in control of whether the clock actually is stopped.
 */
typedef enum top_darjeeling_hintable_clocks {
  kTopDarjeelingHintableClocksMainAes = 0, /**< Clock clk_main_aes in group trans */
  kTopDarjeelingHintableClocksMainHmac = 1, /**< Clock clk_main_hmac in group trans */
  kTopDarjeelingHintableClocksMainKmac = 2, /**< Clock clk_main_kmac in group trans */
  kTopDarjeelingHintableClocksMainOtbn = 3, /**< Clock clk_main_otbn in group trans */
  kTopDarjeelingHintableClocksLast = 3, /**< \internal Last Valid Hintable Clock */
} top_darjeeling_hintable_clocks_t;

// Header Extern Guard
#ifdef __cplusplus
}  // extern "C"
#endif

#endif  // OPENTITAN_HW_TOP_DARJEELING_SW_AUTOGEN_TOP_DARJEELING_SOC_MBX_H_
