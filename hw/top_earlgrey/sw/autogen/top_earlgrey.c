// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "hw/top_earlgrey/sw/autogen/top_earlgrey.h"

/**
 * PLIC Interrupt Source to Peripheral Map
 *
 * This array is a mapping from `top_earlgrey_plic_irq_id_t` to
 * `top_earlgrey_plic_peripheral_t`.
 */
const top_earlgrey_plic_peripheral_t
    top_earlgrey_plic_interrupt_for_peripheral[83] = {
  [kTopEarlgreyPlicIrqIdNone] = kTopEarlgreyPlicPeripheralUnknown,
  [kTopEarlgreyPlicIrqIdUart0TxWatermark] = kTopEarlgreyPlicPeripheralUart0,
  [kTopEarlgreyPlicIrqIdUart0RxWatermark] = kTopEarlgreyPlicPeripheralUart0,
  [kTopEarlgreyPlicIrqIdUart0TxEmpty] = kTopEarlgreyPlicPeripheralUart0,
  [kTopEarlgreyPlicIrqIdUart0RxOverflow] = kTopEarlgreyPlicPeripheralUart0,
  [kTopEarlgreyPlicIrqIdUart0RxFrameErr] = kTopEarlgreyPlicPeripheralUart0,
  [kTopEarlgreyPlicIrqIdUart0RxBreakErr] = kTopEarlgreyPlicPeripheralUart0,
  [kTopEarlgreyPlicIrqIdUart0RxTimeout] = kTopEarlgreyPlicPeripheralUart0,
  [kTopEarlgreyPlicIrqIdUart0RxParityErr] = kTopEarlgreyPlicPeripheralUart0,
  [kTopEarlgreyPlicIrqIdGpioGpio0] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio1] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio2] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio3] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio4] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio5] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio6] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio7] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio8] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio9] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio10] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio11] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio12] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio13] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio14] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio15] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio16] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio17] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio18] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio19] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio20] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio21] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio22] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio23] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio24] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio25] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio26] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio27] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio28] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio29] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio30] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdGpioGpio31] = kTopEarlgreyPlicPeripheralGpio,
  [kTopEarlgreyPlicIrqIdSpiDeviceGenericRxFull] = kTopEarlgreyPlicPeripheralSpiDevice,
  [kTopEarlgreyPlicIrqIdSpiDeviceGenericRxWatermark] = kTopEarlgreyPlicPeripheralSpiDevice,
  [kTopEarlgreyPlicIrqIdSpiDeviceGenericTxWatermark] = kTopEarlgreyPlicPeripheralSpiDevice,
  [kTopEarlgreyPlicIrqIdSpiDeviceGenericRxError] = kTopEarlgreyPlicPeripheralSpiDevice,
  [kTopEarlgreyPlicIrqIdSpiDeviceGenericRxOverflow] = kTopEarlgreyPlicPeripheralSpiDevice,
  [kTopEarlgreyPlicIrqIdSpiDeviceGenericTxUnderflow] = kTopEarlgreyPlicPeripheralSpiDevice,
  [kTopEarlgreyPlicIrqIdSpiDeviceUploadCmdfifoNotEmpty] = kTopEarlgreyPlicPeripheralSpiDevice,
  [kTopEarlgreyPlicIrqIdSpiDeviceUploadPayloadNotEmpty] = kTopEarlgreyPlicPeripheralSpiDevice,
  [kTopEarlgreyPlicIrqIdSpiDeviceReadbufWatermark] = kTopEarlgreyPlicPeripheralSpiDevice,
  [kTopEarlgreyPlicIrqIdSpiDeviceReadbufFlip] = kTopEarlgreyPlicPeripheralSpiDevice,
  [kTopEarlgreyPlicIrqIdSpiDeviceTpmHeaderNotEmpty] = kTopEarlgreyPlicPeripheralSpiDevice,
  [kTopEarlgreyPlicIrqIdSpiHost0Error] = kTopEarlgreyPlicPeripheralSpiHost0,
  [kTopEarlgreyPlicIrqIdSpiHost0SpiEvent] = kTopEarlgreyPlicPeripheralSpiHost0,
  [kTopEarlgreyPlicIrqIdUsbdevPktReceived] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevPktSent] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevDisconnected] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevHostLost] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevLinkReset] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevLinkSuspend] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevLinkResume] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevAvEmpty] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevRxFull] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevAvOverflow] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevLinkInErr] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevRxCrcErr] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevRxPidErr] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevRxBitstuffErr] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevFrame] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevConnected] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdUsbdevLinkOutErr] = kTopEarlgreyPlicPeripheralUsbdev,
  [kTopEarlgreyPlicIrqIdPwrmgrAonWakeup] = kTopEarlgreyPlicPeripheralPwrmgrAon,
  [kTopEarlgreyPlicIrqIdAonTimerAonWkupTimerExpired] = kTopEarlgreyPlicPeripheralAonTimerAon,
  [kTopEarlgreyPlicIrqIdAonTimerAonWdogTimerBark] = kTopEarlgreyPlicPeripheralAonTimerAon,
  [kTopEarlgreyPlicIrqIdFlashCtrlProgEmpty] = kTopEarlgreyPlicPeripheralFlashCtrl,
  [kTopEarlgreyPlicIrqIdFlashCtrlProgLvl] = kTopEarlgreyPlicPeripheralFlashCtrl,
  [kTopEarlgreyPlicIrqIdFlashCtrlRdFull] = kTopEarlgreyPlicPeripheralFlashCtrl,
  [kTopEarlgreyPlicIrqIdFlashCtrlRdLvl] = kTopEarlgreyPlicPeripheralFlashCtrl,
  [kTopEarlgreyPlicIrqIdFlashCtrlOpDone] = kTopEarlgreyPlicPeripheralFlashCtrl,
  [kTopEarlgreyPlicIrqIdFlashCtrlCorrErr] = kTopEarlgreyPlicPeripheralFlashCtrl,
  [kTopEarlgreyPlicIrqIdHmacHmacDone] = kTopEarlgreyPlicPeripheralHmac,
  [kTopEarlgreyPlicIrqIdHmacFifoEmpty] = kTopEarlgreyPlicPeripheralHmac,
  [kTopEarlgreyPlicIrqIdHmacHmacErr] = kTopEarlgreyPlicPeripheralHmac,
};


/**
 * Alert Handler Alert Source to Peripheral Map
 *
 * This array is a mapping from `top_earlgrey_alert_id_t` to
 * `top_earlgrey_alert_peripheral_t`.
 */
const top_earlgrey_alert_peripheral_t
    top_earlgrey_alert_for_peripheral[26] = {
  [kTopEarlgreyAlertIdUart0FatalFault] = kTopEarlgreyAlertPeripheralUart0,
  [kTopEarlgreyAlertIdGpioFatalFault] = kTopEarlgreyAlertPeripheralGpio,
  [kTopEarlgreyAlertIdSpiDeviceFatalFault] = kTopEarlgreyAlertPeripheralSpiDevice,
  [kTopEarlgreyAlertIdSpiHost0FatalFault] = kTopEarlgreyAlertPeripheralSpiHost0,
  [kTopEarlgreyAlertIdRvTimerFatalFault] = kTopEarlgreyAlertPeripheralRvTimer,
  [kTopEarlgreyAlertIdUsbdevFatalFault] = kTopEarlgreyAlertPeripheralUsbdev,
  [kTopEarlgreyAlertIdPwrmgrAonFatalFault] = kTopEarlgreyAlertPeripheralPwrmgrAon,
  [kTopEarlgreyAlertIdRstmgrAonFatalFault] = kTopEarlgreyAlertPeripheralRstmgrAon,
  [kTopEarlgreyAlertIdClkmgrAonRecovFault] = kTopEarlgreyAlertPeripheralClkmgrAon,
  [kTopEarlgreyAlertIdClkmgrAonFatalFault] = kTopEarlgreyAlertPeripheralClkmgrAon,
  [kTopEarlgreyAlertIdPinmuxAonFatalFault] = kTopEarlgreyAlertPeripheralPinmuxAon,
  [kTopEarlgreyAlertIdAonTimerAonFatalFault] = kTopEarlgreyAlertPeripheralAonTimerAon,
  [kTopEarlgreyAlertIdSramCtrlRetAonFatalError] = kTopEarlgreyAlertPeripheralSramCtrlRetAon,
  [kTopEarlgreyAlertIdFlashCtrlRecovErr] = kTopEarlgreyAlertPeripheralFlashCtrl,
  [kTopEarlgreyAlertIdFlashCtrlFatalErr] = kTopEarlgreyAlertPeripheralFlashCtrl,
  [kTopEarlgreyAlertIdRvDmFatalFault] = kTopEarlgreyAlertPeripheralRvDm,
  [kTopEarlgreyAlertIdRvPlicFatalFault] = kTopEarlgreyAlertPeripheralRvPlic,
  [kTopEarlgreyAlertIdAesRecovCtrlUpdateErr] = kTopEarlgreyAlertPeripheralAes,
  [kTopEarlgreyAlertIdAesFatalFault] = kTopEarlgreyAlertPeripheralAes,
  [kTopEarlgreyAlertIdHmacFatalFault] = kTopEarlgreyAlertPeripheralHmac,
  [kTopEarlgreyAlertIdSramCtrlMainFatalError] = kTopEarlgreyAlertPeripheralSramCtrlMain,
  [kTopEarlgreyAlertIdRomCtrlFatal] = kTopEarlgreyAlertPeripheralRomCtrl,
  [kTopEarlgreyAlertIdRvCoreIbexFatalSwErr] = kTopEarlgreyAlertPeripheralRvCoreIbex,
  [kTopEarlgreyAlertIdRvCoreIbexRecovSwErr] = kTopEarlgreyAlertPeripheralRvCoreIbex,
  [kTopEarlgreyAlertIdRvCoreIbexFatalHwErr] = kTopEarlgreyAlertPeripheralRvCoreIbex,
  [kTopEarlgreyAlertIdRvCoreIbexRecovHwErr] = kTopEarlgreyAlertPeripheralRvCoreIbex,
};

