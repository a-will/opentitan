CAPI=2:
# Copyright lowRISC contributors (OpenTitan project).
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
name: ${instance_vlnv("lowrisc:ip:alert_handler:0.1")}
description: "Alert Handler"
virtual:
  - lowrisc:ip_interfaces:alert_handler

filesets:
  files_rtl:
    depend:
      - lowrisc:ip:alert_handler_component
      - ${instance_vlnv("lowrisc:ip_interfaces:alert_handler_reg:0.1")}
    file_type: systemVerilogSource

  files_lint:
    depend:
      - lowrisc:prim_generic:all

parameters:
  SYNTHESIS:
    datatype: bool
    paramtype: vlogdefine


targets:
  default: &default_target
    filesets:
      - files_rtl
    toplevel: alert_handler

  lint:
    <<: *default_target
    default_tool: verilator
    filesets_append:
      - files_lint
    parameters:
      - SYNTHESIS=true
    tools:
      verilator:
        mode: lint-only
        verilator_options:
          - "-Wall"
