// Copyright lowRISC contributors (OpenTitan project).
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//

package prim_rom_pkg;

  // Support a maximum of 128-bit words for backdoor loading.
  typedef struct packed {
    logic         clk;
    logic         req;
    logic         write;
    logic [ 31:0] addr;
    logic [127:9] wdata;
  } rom_cfg_t;

  parameter rom_cfg_t ROM_CFG_DEFAULT = '0;

endpackage // prim_rom_pkg
