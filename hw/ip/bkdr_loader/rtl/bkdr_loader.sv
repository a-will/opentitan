// Copyright lowRISC contributors (OpenTitan project).
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Backdoor loader with indirect programming.

`include "prim_assert.sv"

module bkdr_loader
  import bkdr_loader_pkg::*;
  import bkdr_loader_reg_pkg::*;
#(
  parameter int NumTargets           = 1
) (
  input  logic                       clk_i,
  input  logic                       rst_ni,
  input  tlul_pkg::tl_h2d_t          regs_tl_i,
  output tlul_pkg::tl_d2h_t          regs_tl_o,
  output bkdr_req_t [NumTargets-1:0] bkdr_req_o
);

  bkdr_loader_reg_pkg::bkdr_loader_regs_reg2hw_t reg2hw;
  bkdr_loader_reg_pkg::bkdr_loader_regs_hw2reg_t hw2reg;

  bkdr_loader_regs_reg_top u_regs_reg_top (
    .clk_i,
    .rst_ni,
    .tl_i(regs_tl_i),
    .tl_o(regs_tl_o),
    .reg2hw,
    .hw2reg,
    .intg_err_o()
  );

  assign hw2reg.op.issue_write.d = 1'b0;
  assign hw2reg.op.issue_write.de = reg2hw.op.issue_write.q;

  for (genvar i = 0; i < NumTargets; i++) begin : gen_
    assign bkdr_req_o[i].clk = clk_i;
    assign bkdr_req_o[i].req = reg2hw.op.issue_write.q && (reg2hw.op.mem_select.q == i);
    assign bkdr_req_o[i].write = 1'b1;
    assign bkdr_req_o[i].addr = reg2hw.index;
    assign bkdr_req_o[i].wdata = reg2hw.data;
  end

  ////////////////
  // Assertions //
  ////////////////

  `ASSERT_KNOWN(RegsTlOutKnown_A,  regs_tl_o)

endmodule : bkdr_loader
