# Copyright lowRISC contributors (OpenTitan project).
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("//rules:fusesoc.bzl", "fusesoc_build")

fusesoc_build(
    name = "fpga_cw305",
    testonly = True,
    srcs = [
        "//hw:rtl_files",
	"//hw/top_englishbreakfast:rtl_files",
    ],
    cores = ["//:cores"],
    flags = [
        "--BootRomInitFile=",
    ],
    output_groups = {
        "bitstream": ["synth-vivado/lowrisc_systems_chip_englishbreakfast_cw305_0.1.bit"],
        "mmi": ["synth-vivado/memories.mmi"],
        "logs": ["synth-vivado/lowrisc_systems_chip_englishbreakfast_cw305_0.1.runs/"],
    },
    systems = ["lowrisc:systems:chip_englishbreakfast_cw305"],
    tags = ["manual"],
    target = "synth",
)


