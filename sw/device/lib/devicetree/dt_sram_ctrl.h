// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef OPENTITAN_SW_DEVICE_LIB_DEVICETREE_DT_SRAM_CTRL_H_
#define OPENTITAN_SW_DEVICE_LIB_DEVICETREE_DT_SRAM_CTRL_H_

#include <stdint.h>

typedef enum {
  kDtSramCtrlRegBlockRegs = 0,
  kDtSramCtrlRegBlockRam,
  kDtSramCtrlRegBlockCount,
} dt_sram_ctrl_reg_block_t;

extern uint32_t dt_sram_ctrl_num_devices(void);
extern int32_t dt_sram_ctrl_device_id(uint32_t dev_idx);
extern uintptr_t dt_sram_ctrl_reg_addr(uint32_t dev_idx,
                                       dt_sram_ctrl_reg_block_t reg_block);

#endif  // OPENTITAN_SW_DEVICE_LIB_DEVICETREE_DT_SRAM_CTRL_H_
