# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Generic constraints file for simple testsynthesis flow

# Note that we do not fix hold timing in this flow
set SETUP_CLOCK_UNCERTAINTY 0.5
set CLK_PERIOD_FACTOR 0.95 ;# clock period over constraining factor
puts "Applying constraints for top level"

# Note: the netlist does include pads at this level, but not all IO interfaces
# have been properly constrained yet. The clocks are generated inside AST and
# for the purpose of test synthesis, these clock nets are just set to ideal networks.

#####################
# Architectural CGs #
#####################

# This is not needed by CDC runs
if {!$IS_CDC_RUN} {
    # in synthesis, we treat all clock networks as ideal nets.
    # architecturally insterted CGs however can be interpreted as
    # sequential cells by the tool, hence stopping automatic propagation
    # of ideal network attributes. therefore, we go through the design and
    # declare all architectural CG outputs as ideal.
    set_ideal_network [get_pins -hier u_clkgate/Q]
}

#####################
# main clock        #
#####################
set MAIN_CLK_PIN u_ast/clk_src_sys_o
set MAIN_RST_PIN IO_RST_N
# target is 100MHz, overconstrain by factor
set MAIN_TCK_TARGET_PERIOD  10
set MAIN_TCK_FACTOR 0.85
set MAIN_TCK_PERIOD [expr $MAIN_TCK_TARGET_PERIOD*$MAIN_TCK_FACTOR] ;# over constraining
# For now we remove this as clock is, by default, ideal. Reset, we'll try w/o ideal_network.
#set_ideal_network [get_pins ${MAIN_CLK_PIN}]
#set_ideal_network [get_ports ${MAIN_RST_PIN}]

create_clock -name MAIN_CLK -period ${MAIN_TCK_PERIOD} [get_pins ${MAIN_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks MAIN_CLK]
#set_false_path -from [get_clocks ${MAIN_CLK_PIN_AST}] -to [get_clocks ${MAIN_CLK_PIN}]
#####################
# USB clock         #
#####################
set USB_CLK_PIN u_ast/clk_src_usb_o
# target is 48MHz, overconstrain by 5%
set USB_TCK_TARGET_PERIOD 20.8
set USB_TCK_PERIOD [expr $USB_TCK_TARGET_PERIOD*$CLK_PERIOD_FACTOR]
#set_ideal_network [get_pins ${USB_CLK_PIN}]

create_clock -name USB_CLK -period ${USB_TCK_PERIOD} [get_pins ${USB_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks USB_CLK]

set USBDEV_IOMUX_PATH top_earlgrey/u_usbdev/i_usbdev_iomux/cdc_io_to_usb/u_sync_1/gen_*u_impl*
set USBDEV_OUTREG_PATH top_earlgrey/u_usbdev/usbdev_impl/u_usb_fs_nb_pe/u_usb_fs_tx
# This requires knowledge of actual pin names, which are different depending on
# whether we run this with tech lizbs or not.
if {$FOUNDRY_ROOT != ""} {
    set USB_N_PIN  gen_flops[2]*.u_size_only_reg/D
    set USB_P_PIN  gen_flops[3]*.u_size_only_reg/D
    set USB_PIN    gen_flops[1]*.u_size_only_reg/D
    set USB_D_PIN  u_usb_d_flop/gen_*u_impl*/gen_flops[0]*.u_size_only_reg/Q
    set USB_OE_PIN u_oe_flop/gen_*u_impl*/gen_flops[0]*.u_size_only_reg/Q
} else {
    set USB_N_PIN  d_i[2]
    set USB_P_PIN  d_i[3]
    set USB_PIN    d_i[1]
    set USB_D_PIN  u_usb_d_flop/gen_*u_impl*/q_o[0]
    set USB_OE_PIN u_oe_flop/gen_*u_impl*/q_o[0]
}

set_max_delay 5 -from [get_ports USB_N] -to [get_pins ${USBDEV_IOMUX_PATH}/${USB_N_PIN}]
set_max_delay 5 -from [get_ports USB_P] -to [get_pins ${USBDEV_IOMUX_PATH}/${USB_P_PIN}]
set_max_delay 5 -from [get_ports USB_*] -to [get_pins ${USBDEV_IOMUX_PATH}/${USB_PIN}]
set_max_delay 5 -from [get_pins ${USBDEV_OUTREG_PATH}/${USB_D_PIN}] -to [get_ports USB_*]
set_max_delay 5 -from [get_pins ${USBDEV_OUTREG_PATH}/${USB_OE_PIN}] -to [get_ports USB_*]

#####################
# IO clk            #
#####################
set IO_CLK_PIN u_ast/clk_src_io_o
# target is 96MHz, overconstrain by factor
set IO_TCK_TARGET_PERIOD 10.416
set IO_TCK_PERIOD [expr $IO_TCK_TARGET_PERIOD*$CLK_PERIOD_FACTOR]

create_clock -name IO_CLK -period ${IO_TCK_PERIOD} [get_pins ${IO_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks IO_CLK]

# This requires knowledge of actual port name
set CLK_DST_NAME clk_o

# generated clocks (div2/div4)
set CLK_PATH top_earlgrey/u_clkmgr_aon/u_no_scan_io_div2_div
create_generated_clock -name IO_DIV2_CLK  \
    -source [get_pins ${IO_CLK_PIN}] -divide_by 2 [get_pins ${CLK_PATH}/${CLK_DST_NAME}]

set CLK_PATH top_earlgrey/u_clkmgr_aon/u_no_scan_io_div4_div
create_generated_clock -name IO_DIV4_CLK  \
    -source [get_pins ${IO_CLK_PIN}] -divide_by 4 [get_pins ${CLK_PATH}/${CLK_DST_NAME}]

# TODO: these are dummy constraints and likely incorrect, need to properly constrain min/max
# note that due to the muxing, additional timing views with set_case_analysis may be needed.

# aggregate all IO banks
set IO_BANKS [get_ports IOA*]
append_to_collection IO_BANKS [get_ports IOB*]
append_to_collection IO_BANKS [get_ports IOC*]
append_to_collection IO_BANKS [get_ports IOR*]

# constrain muxed IOs running on IO_DIV2_CLK and IO_DIV4_CLK
set IO_IN_DEL_FRACTION 0.4
set IO_OUT_DEL_FRACTION 0.4

# IO_DIV2_CLK
set IO_DIV2_IN_DEL    [expr ${IO_IN_DEL_FRACTION} * ${IO_TCK_PERIOD} * 2.0]
set IO_DIV2_OUT_DEL   [expr ${IO_OUT_DEL_FRACTION} * ${IO_TCK_PERIOD} * 2.0]

set_input_delay ${IO_DIV2_IN_DEL}   ${IO_BANKS} -clock IO_DIV2_CLK
set_output_delay ${IO_DIV2_OUT_DEL} ${IO_BANKS} -clock IO_DIV2_CLK

# IO_DIV4_CLK
set IO_DIV4_IN_DEL    [expr ${IO_IN_DEL_FRACTION} * ${IO_TCK_PERIOD} * 4.0]
set IO_DIV4_OUT_DEL   [expr ${IO_OUT_DEL_FRACTION} * ${IO_TCK_PERIOD} * 4.0]

set_input_delay ${IO_DIV4_IN_DEL}   ${IO_BANKS} -clock IO_DIV4_CLK -add_delay
set_output_delay ${IO_DIV4_OUT_DEL} ${IO_BANKS} -clock IO_DIV4_CLK -add_delay

#####################
# sysrst_ctrl       #
#####################

# MIO paths that go into sysrst_ctrl and fan out into MIOs or dedicated sysrst_ctrl outputs are async in nature, hence we constrain them using a max delay.
set SYSRST_MAXDELAY 70.0
set_max_delay -from ${IO_BANKS} -to ${IO_BANKS} -through [get_cells top_earlgrey/u_sysrst_ctrl_aon/*] ${SYSRST_MAXDELAY}

#####################
# AON clk           #
#####################
set AON_CLK_PIN u_ast/clk_src_aon_o
# target is 200KHz, overconstrain by factor
set AON_TCK_TARGET_PERIOD 5000.0
set AON_TCK_PERIOD [expr $AON_TCK_TARGET_PERIOD*$CLK_PERIOD_FACTOR]
#set_ideal_network [get_pins ${AON_CLK_PIN}]

create_clock -name AON_CLK -period ${AON_TCK_PERIOD} [get_pins ${AON_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks AON_CLK]

#####################
# JTAG clock        #
#####################
# TODO: set up constraints for JTAG.
set JTAG_CLK_PIN IOR3
# target is 20MHz, overconstrain by factor
set JTAG_TCK_TARGET_PERIOD 50
set JTAG_TCK_PERIOD [expr $JTAG_TCK_TARGET_PERIOD*$CLK_PERIOD_FACTOR]

create_clock -name JTAG_TCK -period $JTAG_TCK_PERIOD [get_ports $JTAG_CLK_PIN]
#set_ideal_network [get_ports $JTAG_CLK_PIN]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks JTAG_TCK]
#####################
# AST clock        #
#####################

set AST_EXT_CLK_PIN IOC6
# target is 48MHz, overconstrain by factor
set AST_EXT_TCK_TARGET_PERIOD [expr $IO_TCK_TARGET_PERIOD*2]
set AST_EXT_TCK_PERIOD [expr $AST_EXT_TCK_TARGET_PERIOD*$CLK_PERIOD_FACTOR]

create_clock -name AST_EXT_CLK -period ${AST_EXT_TCK_PERIOD} [get_ports ${AST_EXT_CLK_PIN}]
set_clock_uncertainty -setup  ${SETUP_CLOCK_UNCERTAINTY} [get_clocks AST_EXT_CLK]

# This is not needed by CDC runs because io_clk/usb_clk/main_clk/aon_clk are propagated from ast_ext_clk in ast.lib
# we don't use this constraint to avoid unnecessary CDC issues
if {!$IS_CDC_RUN} {
    set_clock_groups -name group_ast -async -group [get_clocks AST_EXT_CLK]
}
####################################
# SPI System Parameters             #
#####################################

# Routing delay from external component to device
# Represents approximately 5 inches of trace
set PCB_DEL 0.85

# Max skew between signals. Represents approximately 3 inches.
set PCB_SKEW 0.51

# external spi host setup and hold
set HOST_SETUP_DEL 5
set HOST_HOLD_DEL -5
# Limit hold requirements for full-cycle sampling.
set HOST_HOLD_DEL_FULL_CYCLE -3

# external spi host clk-to-q
set HOST_OUT_DEL_MIN -2
set HOST_OUT_DEL_MAX  3

# external spi dev setup and hold
set STORAGE_SETUP_DEL 3
set STORAGE_HOLD_DEL -3

# external spi dev clk-to-q
set STORAGE_OUT_DEL_MIN 0
set STORAGE_OUT_DEL_MAX 9

#################
# SPI DEV clock #
#################
# TODO
# Add source delays for generated clocks

# The SPI DEV section is for all non-passthrough modes with full-cycle sampling.
# The full-cycle sampling target frequency is 48 MHz.
set SPI_DEV_CLK_PIN SPI_DEV_CLK
# Target is 48 MHz. Overconstrain to 50 MHz.
set SPI_DEV_TCK 20.0
set SPI_DEV_TCK_HALF [expr ${SPI_DEV_TCK} / 2]
#set_ideal_network ${SPI_DEV_CLK_PIN}

# Board skew affects input sampling path.
set SPI_DEV_IN_DEL_MIN [expr ${HOST_OUT_DEL_MIN} - ${PCB_SKEW}]
set SPI_DEV_IN_DEL_MAX [expr ${HOST_OUT_DEL_MAX} + ${PCB_SKEW}]

# Board propagation delay affects return path.
set SPI_DEV_OUT_DEL_MIN ${HOST_HOLD_DEL}
set SPI_DEV_OUT_DEL_MIN_FC ${HOST_HOLD_DEL_FULL_CYCLE}
set SPI_DEV_OUT_DEL_MAX [expr ${HOST_SETUP_DEL} + 2 * ${PCB_DEL}]

## TODO: Create generated clock for negedge SPI_DEV_CLK. Then make them clock group
create_clock -name SPI_DEV_CLK  -period ${SPI_DEV_TCK} [get_ports ${SPI_DEV_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks SPI_DEV_CLK]
set_propagated_clock SPI_DEV_CLK

create_generated_clock -name SPI_DEV_IN_CLK \
    -source [get_ports ${SPI_DEV_CLK_PIN}] -divide_by 1 \
    [get_pins top_earlgrey/u_spi_device/u_clk_spi_in_buf/clk_o]
create_generated_clock -name SPI_DEV_OUT_CLK \
    -source [get_ports ${SPI_DEV_CLK_PIN}] -divide_by 1 -invert \
    [get_pins top_earlgrey/u_spi_device/u_clk_spi_out_buf/clk_o]

# bidir ports
set SPI_DEV_DATA_PORTS [get_ports {SPI_DEV_D0 SPI_DEV_D1 SPI_DEV_D2 SPI_DEV_D3}]
set_input_delay -min ${SPI_DEV_IN_DEL_MIN} ${SPI_DEV_DATA_PORTS} \
    -clock_fall -clock SPI_DEV_CLK -add_delay
set_input_delay -max ${SPI_DEV_IN_DEL_MAX} ${SPI_DEV_DATA_PORTS} \
    -clock_fall -clock SPI_DEV_CLK -add_delay

# Full-cycle sampling has the host on the next falling edge.
set_output_delay -min ${SPI_DEV_OUT_DEL_MIN_FC} ${SPI_DEV_DATA_PORTS} \
    -clock_fall -clock SPI_DEV_CLK -add_delay
set_output_delay -max ${SPI_DEV_OUT_DEL_MAX} ${SPI_DEV_DATA_PORTS} \
    -clock_fall -clock SPI_DEV_CLK -add_delay
set_multicycle_path -setup 2 -from [get_clocks SPI_DEV_IN_CLK] \
    -to [get_clocks SPI_DEV_CLK] -through [get_ports ${SPI_DEV_DATA_PORTS}]

# SPI DEV CSB, the chip-select for non-TPM modes, acts as clock, data, and
# reset.
create_clock -name SPI_DEV_CSB_CLK -period [expr 2 * ${SPI_DEV_TCK}] \
    -waveform "${SPI_DEV_TCK_HALF} [expr ${SPI_DEV_TCK_HALF} + ${SPI_DEV_TCK}]" \
    [get_ports SPI_DEV_CS_L]
set_clock_latency -source -min ${SPI_DEV_IN_DEL_MIN} [get_clocks SPI_DEV_CSB_CLK]
set_clock_latency -source -max ${SPI_DEV_IN_DEL_MAX} [get_clocks SPI_DEV_CSB_CLK]
set_propagated_clock [get_clocks SPI_DEV_CSB_CLK]
set_clock_sense -logical_stop_propagation [get_pins -leaf -of_objects [get_pins top_earlgrey/u_spi_device/u_csb_buf/out_o[0]]]

# CSB-clocked status bits to various negedge-triggered flops, especially in the
# serializer.
# Advance the hold edge by one cycle, since CSB changes nominally on the same
# edge as SPI_DEV_OUT_CLK, but SPI_DEV_OUT_CLK isn't actually toggling.
#set_ideal_network [get_pins top_earlgrey/u_spi_device/u_csb_rst_scan_mux/clk_o]
set_multicycle_path -hold -end -from [get_clocks SPI_DEV_CSB_CLK] \
    -to [get_clocks SPI_DEV_OUT_CLK] 1
# Because this section does full-cycle sampling, the same moving of the capture
# edge is needed for SPI_DEV_CSB_CLK -> SPI_DEV_D* hold analysis. The default
# falling edge of SPI_DEV_CLK would not be active.
set_multicycle_path -hold -end -from [get_clocks SPI_DEV_CSB_CLK] \
    -to [get_clocks SPI_DEV_CLK] -through [get_ports ${SPI_DEV_DATA_PORTS}] 1
# Even though this represents full-cycle sampling, require the data to at least
# *start* appearing on the output before the posedge. This constraint may
# optionally be removed. If it is removed, restrict generic mode to the same
# frequencies as SPI DEV TPM mode in the datasheet.
set_max_delay -ignore_clock_latency -from [get_clocks SPI_DEV_CSB_CLK] \
    -to [get_clocks SPI_DEV_CLK] -through [get_ports ${SPI_DEV_DATA_PORTS}] \
    [expr ${SPI_DEV_TCK_HALF} + ${SPI_DEV_OUT_DEL_MAX} - 2]

# Remove hold analysis from the following paths to ports. Even though the pins
# can change before the prior data was latched upstream, their effect is held
# back by other logic on SPI_DEV_OUT_CLK.
# Note: The final output logic equation must not permit glitches in the presence
# of changes on the listed pins. Otherwise, any hold time failures could be
# real.
set_false_path -hold -from [get_clocks SPI_DEV_IN_CLK] \
    -to [get_ports ${SPI_DEV_DATA_PORTS}] \
    -through [get_pins -leaf -filter "@pin_direction == out" -of_objects \
               [get_nets -segments -of_objects \
                 [get_pins top_earlgrey/u_spi_device/u_p2s/data_valid_i]]]
set_false_path -hold -from [get_clocks SPI_DEV_IN_CLK] \
    -to [get_ports ${SPI_DEV_DATA_PORTS}] \
    -through [get_pins -leaf -filter "@pin_direction == out" -of_objects \
               [get_nets -segments -of_objects \
                 [get_pins top_earlgrey/u_spi_device/u_p2s/data_i*]]]
set_false_path -hold -from [get_clocks SPI_DEV_IN_CLK] \
    -to [get_ports ${SPI_DEV_DATA_PORTS}] \
    -through [get_pins -leaf -filter "@pin_direction == out" -of_objects \
               [get_nets -segments -of_objects \
                 [get_pins top_earlgrey/u_spi_device/u_spi_tpm/miso_o]]]

####################
# SPI DEV TPM mode #
####################
# The SPI DEV TPM section is for TPM mode with half-cycle sampling, though it
# would apply to any non-passthrough mode with half-cycle sampling. For the
# non-TPM case, there are no constraints below for the SPI_DEV_CS_L port, but it
# is sufficiently constrained in the 48 MHz case above.
# The half-cycle sampling target frequency is 24 MHz. Over-constrain to 25 MHz.
set SPI_TPM_TCK 40.0
create_clock -name SPI_TPM_CLK -add -period ${SPI_TPM_TCK} [get_ports ${SPI_DEV_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks SPI_TPM_CLK]
set_propagated_clock SPI_TPM_CLK

create_generated_clock -name SPI_TPM_IN_CLK \
    -source [get_ports ${SPI_DEV_CLK_PIN}] -divide_by 1 \
    -master_clock SPI_TPM_CLK -add \
    [get_pins top_earlgrey/u_spi_device/u_clk_spi_in_buf/clk_o]
create_generated_clock -name SPI_TPM_OUT_CLK \
    -source [get_ports ${SPI_DEV_CLK_PIN}] -divide_by 1 -invert \
    -master_clock SPI_TPM_CLK -add \
    [get_pins top_earlgrey/u_spi_device/u_clk_spi_out_buf/clk_o]

# bidir ports
set_input_delay -min ${SPI_DEV_IN_DEL_MIN} ${SPI_DEV_DATA_PORTS} \
    -clock_fall -clock SPI_TPM_CLK -add_delay
set_input_delay -max ${SPI_DEV_IN_DEL_MAX} ${SPI_DEV_DATA_PORTS} \
    -clock_fall -clock SPI_TPM_CLK -add_delay

# Half-cycle sampling has the host on the next rising edge.
set_output_delay -min ${SPI_DEV_OUT_DEL_MIN} ${SPI_DEV_DATA_PORTS} \
    -clock SPI_TPM_CLK -add_delay
set_output_delay -max ${SPI_DEV_OUT_DEL_MAX} ${SPI_DEV_DATA_PORTS} \
    -clock SPI_TPM_CLK -add_delay

# SPI TPM CSB, the chip-select for TPM mode.
# Any muxed port could be a SPI TPM CSB.
set MUXED_IOA_PORTS [get_ports IOA*]
set MUXED_IOB_PORTS [get_ports IOB*]
set MUXED_IOC_PORTS [get_ports IOC*]
set MUXED_IOR_PORTS [get_ports "IOR0 IOR1 IOR2 IOR3 IOR4 IOR5 IOR6 IOR7 IOR10 IOR11 IOR12 IOR13"]
set ALL_MUXED_PORTS "${MUXED_IOA_PORTS} ${MUXED_IOB_PORTS} ${MUXED_IOC_PORTS} ${MUXED_IOR_PORTS}"

# TPM CSB input delays.
set_input_delay -min ${SPI_DEV_IN_DEL_MIN} [get_ports ${ALL_MUXED_PORTS}] \
    -clock SPI_TPM_CLK -clock_fall -add_delay
set_input_delay -max ${SPI_DEV_IN_DEL_MAX} [get_ports ${ALL_MUXED_PORTS}] \
    -clock SPI_TPM_CLK -clock_fall -add_delay

# Relax hold path for TPM CSB, since CSB changes nominally on the same edge as
# SPI_TPM_OUT_CLK, but the latter isn't actually toggling.
set_multicycle_path -hold -end -from [get_clocks SPI_TPM_CLK] \
    -through [get_ports ${ALL_MUXED_PORTS}] \
    -to [get_clocks SPI_TPM_OUT_CLK] 1

# Remove hold analysis from the following paths to ports. Even though the pins
# can change before the prior data was latched upstream, their effect is held
# back by other logic on SPI_TPM_OUT_CLK.
# Note: The final output logic equation must not permit glitches in the presence
# of changes on the listed pins. Otherwise, any hold time failures could be
# real.
set_false_path -hold -from [get_clocks SPI_TPM_IN_CLK] \
    -to [get_ports ${SPI_DEV_DATA_PORTS}] \
    -through [get_pins -leaf -filter "@pin_direction == out" -of_objects \
               [get_nets -segments -of_objects \
                 [get_pins top_earlgrey/u_spi_device/u_p2s/data_valid_i]]]
set_false_path -hold -from [get_clocks SPI_TPM_IN_CLK] \
    -to [get_ports ${SPI_DEV_DATA_PORTS}] \
    -through [get_pins -leaf -filter "@pin_direction == out" -of_objects \
               [get_nets -segments -of_objects \
                 [get_pins top_earlgrey/u_spi_device/u_p2s/data_i*]]]
set_false_path -hold -from [get_clocks SPI_TPM_IN_CLK] \
    -to [get_ports ${SPI_DEV_DATA_PORTS}] \
    -through [get_pins -leaf -filter "@pin_direction == out" -of_objects \
               [get_nets -segments -of_objects \
                 [get_pins top_earlgrey/u_spi_device/u_spi_tpm/miso_o]]]


##################
# SPI HOST clock #
##################
# SPI host core logic operates on the IO_CLK
#
# See https://docs.google.com/drawings/d/1qkUnXaRafIPyBnVpreqfbF_zSy0xlpHqXMZp6F-j8Cc/edit?usp=sharing
# During pre-layout, the SPI_HOST_CLK source latencies are estimated to account
# for pad and logic latencies. After CTS, source latency must be removed as all
# clocks are propagated.

# This requires knowledge of actual pin names, which are different depending on
# whether we run this with tech libs or not.
if {$FOUNDRY_ROOT != ""} {
    set REG_PIN  gen_flops[0]*.u_size_only_reg/Q
} else {
    set REG_PIN  q_o[0]
}

# cascaded generated clock on the port
create_generated_clock -name SPI_HOST_CLK -source [get_pins ${IO_CLK_PIN}] \
                       -divide_by 2 [get_ports SPI_HOST_CLK]

# Multi-cycle path to adjust the hold edge, since launch and capture edges are
# opposite in the SPI_HOST_CLK domain.
set_multicycle_path -setup 1 -start -from [get_clocks IO_CLK] -to [get_clocks SPI_HOST_CLK]
set_multicycle_path -hold  1 -start -from [get_clocks IO_CLK] -to [get_clocks SPI_HOST_CLK]

# set multicycle path for data going from SPI_HOST_CLK to logic
# the SPI host logic will read these paths at "full cycle"
set_multicycle_path -setup 2 -end -from [get_clocks SPI_HOST_CLK] -to [get_clocks IO_CLK]
set_multicycle_path -hold 1  -end -from [get_clocks SPI_HOST_CLK] -to [get_clocks IO_CLK]

# computed delays from connected device
# host in has 2x the pcb delay to account for delays on both outgoing clocks and incoming data
set SPI_HOST_OUT_DEL_MIN [expr ${STORAGE_HOLD_DEL}  - ${PCB_SKEW}]
set SPI_HOST_OUT_DEL_MAX [expr ${STORAGE_SETUP_DEL} + ${PCB_SKEW}]
set SPI_HOST_IN_DEL_MIN  [expr ${STORAGE_OUT_DEL_MIN}]
set SPI_HOST_IN_DEL_MAX  [expr ${STORAGE_OUT_DEL_MAX} + 2 * ${PCB_DEL}]

# bidir ports, with the downstream device launching on falling edge
set SPI_HOST_DATA_PORTS [get_ports SPI_HOST_D*]
set_input_delay -min ${SPI_HOST_IN_DEL_MIN} ${SPI_HOST_DATA_PORTS} \
    -clock_fall -clock SPI_HOST_CLK -add_delay
set_input_delay -max ${SPI_HOST_IN_DEL_MAX} ${SPI_HOST_DATA_PORTS} \
    -clock_fall -clock SPI_HOST_CLK -add_delay
set_output_delay -min ${SPI_HOST_OUT_DEL_MIN} \
    [get_ports "SPI_HOST_CS_L ${SPI_HOST_DATA_PORTS}"] \
    -clock SPI_HOST_CLK -add_delay
set_output_delay -max ${SPI_HOST_OUT_DEL_MAX} \
    [get_ports "SPI_HOST_CS_L ${SPI_HOST_DATA_PORTS}"] \
    -clock SPI_HOST_CLK -add_delay


#####################################
# SPI DEV clock Passthru Operation  #
#####################################
# Passthrough target freq is 33MHz. Using 40MHz to over-constrain
# For details on SPI passthrough timing, please see
# https://docs.google.com/presentation/d/1GEPxKaOsr9ZcJwI_MBEL74P7jQvBFzOdzSbgru_yVLQ/edit?usp=sharing
# See the SPI TPM section for half-cycle sampling with non-passthrough modes.
#
# The constraints below take the following approach:
# Define incoming passthrough clock on the SPI_DEV_CLK pin and relate all the inputs to it.
# Define also output delays since all pins are bidirectional.
# Define outgoing passthrough clock on the SPI_HOST_CLK pin but make sure it is a generated version
# of the incoming passthrough clock, relate the host side pins to this clock in both input/output
# directions.

set SPI_DEV_PASS_TCK 30.0
set SPI_DEV_PASS_TCK_HALF [expr ${SPI_DEV_PASS_TCK} / 2]
create_clock -name SPI_DEV_PASS_CLK -period ${SPI_DEV_PASS_TCK} \
    [get_ports ${SPI_DEV_CLK_PIN}] -add
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks SPI_DEV_PASS_CLK]

# clocks used by spi device internally
create_generated_clock -name SPI_DEV_PASS_IN_CLK \
    -source [get_ports ${SPI_DEV_CLK_PIN}] -divide_by 1 \
    -master_clock SPI_DEV_PASS_CLK -add \
    [get_pins top_earlgrey/u_spi_device/u_clk_spi_in_buf/clk_o]
create_generated_clock -name SPI_DEV_PASS_OUT_CLK \
    -source [get_ports ${SPI_DEV_CLK_PIN}] -divide_by 1 -invert \
    -master_clock SPI_DEV_PASS_CLK -add \
    [get_pins top_earlgrey/u_spi_device/u_clk_spi_out_buf/clk_o]


# clocks accounting for propagation delay to the other side
create_generated_clock -name SPI_HOST_PASS_CLK \
    -source [get_ports ${SPI_DEV_CLK_PIN}] -divide_by 1 \
    -master_clock SPI_DEV_PASS_CLK -add \
    [get_ports SPI_HOST_CLK]

# The propagated properties are needed to ensure the passthrough clocks assume all passthrough delay.
# This is done specifically for the passthrough interface to get realistic timing even during
# pre-layout.
set_propagated_clock [get_clock SPI_DEV_PASS_CLK]
set_propagated_clock [get_clock SPI_HOST_PASS_CLK]

# bidir ports facing host, with full-cycle sampling at the upstream host
set_input_delay -min ${SPI_DEV_IN_DEL_MIN} ${SPI_DEV_DATA_PORTS} \
    -clock_fall -clock SPI_DEV_PASS_CLK -add_delay
set_input_delay -max ${SPI_DEV_IN_DEL_MAX} ${SPI_DEV_DATA_PORTS} \
    -clock_fall -clock SPI_DEV_PASS_CLK -add_delay
set_output_delay -min ${SPI_DEV_OUT_DEL_MIN_FC} ${SPI_DEV_DATA_PORTS} \
    -clock_fall -clock SPI_DEV_PASS_CLK -add_delay
set_output_delay -max ${SPI_DEV_OUT_DEL_MAX} ${SPI_DEV_DATA_PORTS} \
    -clock_fall -clock SPI_DEV_PASS_CLK -add_delay


# bidir ports facing storage device
set_input_delay -min ${SPI_HOST_IN_DEL_MIN} ${SPI_HOST_DATA_PORTS} \
    -clock_fall -clock SPI_HOST_PASS_CLK -add_delay
set_input_delay -max ${SPI_HOST_IN_DEL_MAX} ${SPI_HOST_DATA_PORTS} \
    -clock_fall -clock SPI_HOST_PASS_CLK -add_delay
set_output_delay -min ${SPI_HOST_OUT_DEL_MIN} \
    [get_ports "SPI_HOST_CS_L ${SPI_HOST_DATA_PORTS}"] \
    -clock SPI_HOST_PASS_CLK -add_delay
set_output_delay -max ${SPI_HOST_OUT_DEL_MAX} \
    [get_ports "SPI_HOST_CS_L ${SPI_HOST_DATA_PORTS}"] \
    -clock SPI_HOST_PASS_CLK -add_delay

# CSB clock from top-level port (added to SPI_DEV_CSB_CLK)
create_clock -name SPI_DEV_PASS_CSB_CLK -add \
    -period [expr 2 * ${SPI_DEV_PASS_TCK}] \
    -waveform "${SPI_DEV_PASS_TCK_HALF} [expr ${SPI_DEV_PASS_TCK_HALF} + ${SPI_DEV_PASS_TCK}]" \
    [get_ports SPI_DEV_CS_L]
set_clock_latency -source -min ${SPI_DEV_IN_DEL_MIN} \
    -clock SPI_DEV_PASS_CSB_CLK [get_ports SPI_DEV_CS_L]
set_clock_latency -source -max ${SPI_DEV_IN_DEL_MAX} \
    -clock SPI_DEV_PASS_CSB_CLK [get_ports SPI_DEV_CS_L]
set_propagated_clock [get_clock SPI_DEV_PASS_CSB_CLK]

# CSB-clocked status bits to various negedge-triggered flops, especially in the
# serializer.
# Advance the hold edge by one cycle, since CSB changes nominally on the same
# edge as SPI_DEV_PASS_OUT_CLK, but SPI_DEV_PASS_OUT_CLK isn't actually
# toggling.
#set_ideal_network [get_pins top_earlgrey/u_spi_device/u_csb_rst_scan_mux/clk_o]
set_multicycle_path -hold -end -from [get_clocks SPI_DEV_PASS_CSB_CLK] \
    -to [get_clocks SPI_DEV_PASS_OUT_CLK] 1
# Because this section does full-cycle sampling, the same moving of the capture
# edge is needed for SPI_DEV_CSB_CLK -> SPI_DEV_D* hold analysis. The default
# falling edge of SPI_DEV_CLK would not be active.
set_multicycle_path -hold -end -from [get_clocks SPI_DEV_PASS_CSB_CLK] \
    -to [get_clocks SPI_DEV_PASS_CLK] -through [get_ports ${SPI_DEV_DATA_PORTS}] 1
# Even though this represents full-cycle sampling, require the data to at least
# *start* appearing on the output before the posedge. This constraint may
# optionally be removed. If it is removed, restrict generic mode to the same
# frequencies as SPI DEV TPM mode in the datasheet.
set_max_delay -ignore_clock_latency -from [get_clocks SPI_DEV_PASS_CSB_CLK] \
    -to [get_clocks SPI_DEV_PASS_CLK] -through [get_ports ${SPI_DEV_DATA_PORTS}] \
    [expr ${SPI_DEV_PASS_TCK_HALF} + ${SPI_DEV_OUT_DEL_MAX} - 2]

# Remove hold analysis from the following paths to ports. Even though the pins
# can change before the prior data was latched upstream, their effect is held
# back by other logic on SPI_DEV_PASS_OUT_CLK.
# Note: The final output logic equation must not permit glitches in the presence
# of changes on the listed pins. Otherwise, any hold time failures could be
# real.
set_false_path -hold -from [get_clocks SPI_DEV_PASS_IN_CLK] \
    -to [get_ports ${SPI_DEV_DATA_PORTS}] \
    -through [get_pins -leaf -filter "@pin_direction == out" -of_objects \
               [get_nets -segments -of_objects \
                 [get_pins top_earlgrey/u_spi_device/u_p2s/data_valid_i]]]
set_false_path -hold -from [get_clocks SPI_DEV_PASS_IN_CLK] \
    -to [get_ports ${SPI_DEV_DATA_PORTS}] \
    -through [get_pins -leaf -filter "@pin_direction == out" -of_objects \
               [get_nets -segments -of_objects \
                 [get_pins top_earlgrey/u_spi_device/u_p2s/data_i*]]]
set_false_path -hold -from [get_clocks SPI_DEV_PASS_IN_CLK] \
    -to [get_ports ${SPI_DEV_DATA_PORTS}] \
    -through [get_pins -leaf -filter "@pin_direction == out" -of_objects \
               [get_nets -segments -of_objects \
                 [get_pins top_earlgrey/u_spi_device/u_spi_tpm/miso_o]]]

####################
# SPI-specific CDC #
####################
# CSB and clocks are not active simultaneously, and CSB does not actually sample
# data from these clocks.
set_clock_groups -logically_exclusive \
    -group {SPI_DEV_CLK SPI_DEV_PASS_CLK SPI_TPM_CLK} \
    -group {SPI_DEV_CSB_CLK SPI_DEV_PASS_CSB_CLK}

# Only one mode can be active at a time.
set_clock_groups -physically_exclusive \
    -group {SPI_DEV_CLK SPI_DEV_IN_CLK SPI_DEV_OUT_CLK SPI_DEV_CSB_CLK} \
    -group {SPI_HOST_PASS_CLK SPI_DEV_PASS_CLK SPI_DEV_PASS_IN_CLK SPI_DEV_PASS_OUT_CLK SPI_DEV_PASS_CSB_CLK} \
    -group {SPI_TPM_CLK SPI_TPM_IN_CLK SPI_TPM_OUT_CLK}

#####################
# CDC               #
#####################
# NOTE: Bad CDCs?
# SPI_DEV_CSB_CLK -> SPI_HOST_CLK
#
set SPI_DEV_CLKS "SPI_DEV_CLK SPI_DEV_IN_CLK SPI_DEV_OUT_CLK SPI_DEV_CSB_CLK"
set SPI_DEV_PASS_CLKS "SPI_HOST_PASS_CLK SPI_DEV_PASS_CLK SPI_DEV_PASS_IN_CLK SPI_DEV_PASS_OUT_CLK SPI_DEV_PASS_CSB_CLK"
set SPI_TPM_CLKS "SPI_TPM_CLK SPI_TPM_IN_CLK SPI_TPM_OUT_CLK"

# this may need some refinement (and max delay / skew needs to be constrained)
set_clock_groups -name group1 -async                                  \
    -group [get_clocks MAIN_CLK                                     ] \
    -group [get_clocks USB_CLK                                      ] \
    -group [get_clocks "${SPI_DEV_CLKS} ${SPI_DEV_PASS_CLKS} ${SPI_TPM_CLKS}"] \
    -group [get_clocks {IO_CLK SPI_HOST_CLK}       ] \
    -group [get_clocks IO_DIV2_CLK                                  ] \
    -group [get_clocks IO_DIV4_CLK                                  ] \
    -group [get_clocks JTAG_TCK                                     ] \
    -group [get_clocks AON_CLK                                      ]

# UART loopback path can be considered to be a false path
set_false_path -through [get_pins top_earlgrey/u_uart*/cio_rx_i] -through [get_pins top_earlgrey/u_uart*/cio_tx_o]

# break all timing paths through bidirectional IO buffers (i.e., from output and oe to input buffer output)
set_false_path -through [get_pins *padring/*pad/*/oe_i] -through [get_pins *padring/*pad/*/in_o]
set_false_path -through [get_pins *padring/*pad/*/out_i] -through [get_pins *padring/*pad/*/in_o]

# break path through jtag mux
set_false_path -from [get_ports IOC7] -to [get_ports IOR*]

# pass through is not fully supported yet by SPI host
# TODO: revise this
# set_false_path -through [get_pins top_earlgrey/u_spi_host1/u_sck_passthrough/gen_*/u_size_only_mux2/${DRIVING_CELL_PIN}]

#####################
# I/O drive/load    #
#####################

# This is not needed by CDC runs
if {!$IS_CDC_RUN} {
    # attach load and drivers to IOs to get a more realistic estimate
    set_driving_cell -no_design_rule -lib_cell ${DRIVING_PAD} -pin ${DRIVING_PAD_PIN} [all_inputs]
    set_load [load_of ${LOAD_PAD_LIB}/${LOAD_PAD}/${LOAD_PAD_PIN}] [all_outputs]
}

###################################
# Size Only and Don't touch Cells #
###################################

# This is not needed by CDC runs
if {!$IS_CDC_RUN} {
    # this is for architectural clock buffers, inverters and muxes
    set_size_only -all_instances [get_cells -h *u_size_only*] true
    # do not touch pad cells
    set_dont_touch [get_cells -h *u_pad_macro*]
}
puts "Done applying constraints for top level"

##########################################
# Case analysis for quasi-static signals #
##########################################

# assume a value of 0 for the open drain pad attribute
set_case_analysis 0 [get_pins u_padring/*_pad/attr_i\[od_en\]]
