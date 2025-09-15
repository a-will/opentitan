// Copyright lowRISC contributors (OpenTitan project).
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//

package prim_ram_1p_pkg;

  // Support a maximum of 128-bit words for backdoor loading.
  typedef struct packed {
    logic         clk;
    logic         req;
    logic         write;
    logic [ 31:0] addr;
    logic [127:9] wdata;
  } ram_1p_cfg_t;

  typedef struct packed {
    logic [127:0] rdata;
  } ram_1p_cfg_rsp_t;

  parameter ram_1p_cfg_t RAM_1P_CFG_DEFAULT = '0;

endpackage // prim_ram_1p_pkg
