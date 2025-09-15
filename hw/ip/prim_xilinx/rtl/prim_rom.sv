// Copyright lowRISC contributors (OpenTitan project).
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

`include "prim_assert.sv"

module prim_rom import prim_rom_pkg::*; #(
  parameter  int Width       = 32,
  parameter  int Depth       = 2048, // 8kB default
  parameter  string MemInitFile = "", // VMEM file to initialize the memory with

  localparam int Aw          = $clog2(Depth)
) (
  input  logic             clk_i,
  input  logic             rst_ni,
  input  logic             req_i,
  input  logic [Aw-1:0]    addr_i,
  output logic [Width-1:0] rdata_o,
  input rom_cfg_t          cfg_i
);

  logic unused_signals;
  assign unused_signals = ^{rst_ni};

  logic [Width-1:0] mem [Depth];

  always_ff @(posedge clk_i) begin
    if (req_i) begin
      rdata_o <= mem[addr_i];
    end
  end

  // Backdoor loading
  logic clk_bkdr;
  assign clk_bkdr = cfg_i.clk;

  logic [Aw-1:0] addr_bkdr;
  assign addr_bkdr = cfg_i.addr[Aw-1:0];

  logic [Width-1:0] wdata_bkdr, rdata_bkdr;
  assign wdata_bkdr = cfg_i.wdata[Width-1:0];
  //assign cfg_rsp_o.rdata = {'0, rdata_bkdr};
  logic unused_bkdr;
  assign unused_bkdr = ^{rdata_bkdr};

  always @(posedge clk_bkdr) begin
    if (cfg_i.req) begin
      if (cfg_i.write) begin
        mem[addr_bkdr] <= wdata_bkdr;
      end
    end else begin
      rdata_bkdr <= mem[addr_bkdr];
    end
  end

  `include "prim_util_memload.svh"

  ////////////////
  // ASSERTIONS //
  ////////////////

  // Control Signals should never be X
  `ASSERT(noXOnCsI, !$isunknown(req_i), clk_i, '0)
endmodule
