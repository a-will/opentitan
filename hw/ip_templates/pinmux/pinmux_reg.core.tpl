CAPI=2:
# Copyright lowRISC contributors (OpenTitan project).
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
name: ${instance_vlnv("lowrisc:ip:pinmux_reg:0.1")}
description: "Auto-generated pinmux register sources"
virtual:
  - lowrisc:ip_interfaces:pinmux_reg

filesets:
  files_rtl:
    depend:
      - lowrisc:prim:subreg
      - lowrisc:tlul:headers
    files:
      - rtl/pinmux_reg_pkg.sv
      - rtl/pinmux_reg_top.sv
    file_type: systemVerilogSource

targets:
  default: &default_target
    filesets:
      - files_rtl
