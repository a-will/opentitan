# Copyright lowRISC contributors (OpenTitan project).
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Verix CDC waiver file

set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "*.u_spi_device.u_reg*u_cmd_info*") && (MultiClockDomains =~ "IO_DIV4_CLK::*SPI_DEV*CLK*")} -status {Waived} -comment {CMD_INFO is pre-configured, static}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "IO*") && (ReceivingFlop =~ "top_earlgrey.u_spi_host1.u_spi_core.u_shift_reg.*_q*")} -status {Waived} -comment {W_INTERFACE issues from PAD to spi_host}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.dio_pad_attr_q*.invert")} -status {Waived} -comment {waiving W_INTERFACE issues from PAD}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.io_mode_outclk*")} -status {Waived} -comment {waiving W_INTERFACE issues from PAD}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_reg.u_cfg_rx_order.q*")} -status {Waived}  -comment {waiving W_INTERFACE issues from PAD}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "SPI_*")} -status {Waived} -comment {waiving W_INTERFACE issues from PAD}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.dio_pad_attr_q*.invert")} -status {Waived} -comment {waiving W_INTERFACE issues from PAD}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_upload.u_*fifo.r_rptr_gray_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.io_mode_outclk[1:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_reg.u_cfg_rx_order.q[0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.spi_clk_csb_rst_toggle")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.sys_clk_tog")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_reg.u_rxf_ptr_rptr.q[12:2]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_fwmode.u_rx_fifo.storage*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_fwmode.u_rx_fifo.fifo_wptr_gray_q[3:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.io_mode_outclk[1:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_s2p.cnt[2:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_cmdparse.st[3:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_cmdparse.cmd_info_q.addr_mode[1:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_reg.u_cfg_rx_order.q[0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_s2p.data_q[7:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_spid_addr_4b.spi_cfg_addr_4b_en_o")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_readcmd.main_st[3:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_readcmd.addr_cnt_q[4:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_readcmd.u_readsram.u_sram_fifo.gen_normal_fifo.u_fifo_cnt.*ptr_o[1:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_readcmd.u_readsram.st_q[1:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_upload.st_q[1:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_upload.u_cmdfifo.u_sync_rptr_gray.u_sync_2.q_o[4:0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_upload.u_cmdfifo.w_wptr_q[4:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_upload.u_arbiter.gen_arb_ppc.u_reqarb.gen_normal_case.mask[2:0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_upload.addrcnt[4:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_upload.u_addrfifo.w_wptr_q[4:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_upload.u_addrfifo.u_sync_rptr_gray.u_sync_2.q_o[4:0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_fwmode.u_rx_fifo.fifo_wptr_gray_q[3:0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_reg.u_cfg_rx_order.q[0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_spid_status.u_sw_status_update_sync.storage*")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_spid_status.u_sw_status_update_sync.fifo_*ptr_gray_q[1:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_fwmode.u_tx_fifo.fifo_wptr_q[3:0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_fwmode.u_tx_fifo.fifo_rptr_sync_q[3:0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_spi_tpm.u_cmdaddr_buffer.storage[1:0][19:16]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_spi_tpm.u_cmdaddr_buffer.fifo_*ptr_gray_q[1:0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(ReceivingFlop =~ "top_earlgrey.u_spi_device.u_reg.u_reg_if.rdata_q*")} -status {Waived} -comment {waiving W_INTERFACE issues in spi_device reg}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_reg.u_cfg_rx_order.q*")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_upload.u_*fifo.r_rptr_gray_q[4:0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_reg.u_cfg_addr_4b_en.q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_spi_tpm.u_cmdaddr_buffer.fifo_wptr_gray_q*")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_spi_tpm.u_wrfifo.fifo_wptr_gray_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_spi_tpm.u_cmdaddr_buffer.fifo_rptr_gray_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_spi_tpm.u_wrfifo.fifo_rptr_gray_q*")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(ReceivingFlop =~ "top_earlgrey.u_pinmux_aon.mio_out_retreg_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(ReceivingFlop =~ "top_earlgrey.u_rv_core_ibex.u_alert_nmi_sync.u_sync_1.q_o*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(ReceivingFlop =~ "top_earlgrey.u_rv_dm.dap.dr_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_xbar_main.u_asf_35.reqfifo.fifo_*ptr_gray_q[0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_reg.u_main_meas_ctrl_en_cdc.u_src_to_dst_req.src_level")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_reg.u_main_meas_ctrl_shadowed_cdc.u_src_to_dst_req.src_level")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_reg.u_clk_hints_clk_main_aes_hint.q[0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_reg.u_clk_hints_clk_main_hmac_hint.q[0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_reg.u_clk_hints_clk_main_kmac_hint.q[0]")} -status {Waived}  -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_reg.u_clk_hints_clk_main_otbn_hint.q[0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_otp_ctrl.gen_partitions[3].gen_buffered.u_part_buf.dout_locked_q[7:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_otp_ctrl.gen_partitions[3].gen_buffered.u_part_buf.u_otp_ctrl_ecc_reg.data_q[8][15:8]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_otp_ctrl.gen_partitions[3].gen_buffered.u_part_buf.dout_locked_q[7:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_otp_ctrl.gen_partitions[3].gen_buffered.u_part_buf.u_otp_ctrl_ecc_reg.data_q[8][31:24]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_otp_ctrl.gen_partitions[3].gen_buffered.u_part_buf.dout_locked_q[7:0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_otp_ctrl.gen_partitions[3].gen_buffered.u_part_buf.u_otp_ctrl_ecc_reg.data_q[8][23:16]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_xbar_main.u_asf_35.reqfifo.fifo_rptr_gray_q[0]")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(ReceivingFlop =~ "top_earlgrey.u_lc_ctrl.u_dmi_jtag.dr_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_lc_ctrl.u_dmi_jtag.i_dmi_cdc.i_cdc_resp.u_prim_sync_reqack.gen_rz_hs_protocol.src_fsm_q")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(ReceivingFlop =~ "top_earlgrey.u_pinmux_aon.dio_out_retreg_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(ReceivingFlop =~ "top_earlgrey.u_spi_device.u_spi_tpm.sck_st_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(ComponentClass =~ "CNTL") && (ErrorType =~ "") && (MultiClockDomains =~ "SPI_DEV_IN_CLK,SPI_DEV_PASSTHRU_IN_CLK::IO_DIV4_CLK") && (Signal =~ "top_earlgrey.u_spi_device.rxf_full_q")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(ComponentClass =~ "CNTL") && (ErrorType =~ "") && (MultiClockDomains =~ "AST_EXT_CLK,MAIN_CLK::AST_EXT_CLK,JTAG_TCK,MAIN_CLK") && (Signal =~ "top_earlgrey.u_rv_dm.dap.i_dmi_cdc.i_cdc_resp.u_prim_sync_reqack.gen_rz_hs_protocol.src_fsm_q")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(ComponentClass =~ "FEEDBACK") && (ErrorType =~ "") && (MultiClockDomains =~ "AST_EXT_CLK,JTAG_TCK,MAIN_CLK::AST_EXT_CLK,MAIN_CLK") && (Signal =~ "top_earlgrey.u_rv_dm.dap.i_dmi_cdc.i_cdc_resp.u_prim_sync_reqack.gen_rz_hs_protocol.dst_fsm_q")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_device.u_fwmode.u_*xf_ctrl.*ptr*") && (ReceivingFlop =~ "top_earlgrey.u_spi_device.u_reg.u_intr_state_generic_*x*.q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_lc_ctrl.u_dmi_jtag.i_dmi_cdc.i_cdc_resp.u_prim_sync_reqack.gen_rz_hs_protocol.dst_fsm_q") && (ReceivingFlop =~ "top_earlgrey.u_lc_ctrl.u_dmi_jtag.i_dmi_cdc.i_cdc_resp.u_prim_sync_reqack.gen_rz_hs_protocol.ack_sync.u_sync_1.q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors and fifo with feedback path}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_rom_ctrl.gen_fsm_scramble_enabled.u_checker_fsm.u_compare.u_done_sender.gen_flops.u_prim_flop.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_pwrmgr_aon.u_fsm.u_state_regs.u_state_flop.q_o*")} -status {Waived} -comment {rom_ctrl_i.good is not synchronized as it acts as a "payload" signal to "done". Good is only observed if "done" is high}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "IOB*") && (ReceivingFlop =~ "top_earlgrey.u_pwrmgr_aon.u_fsm.u_state_regs.u_state_flop.q_o*")} -status {Waived} -comment {rom_ctrl_i.good is not synchronized as it acts as a "payload" signal to "done". Good is only observed if "done" is high}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_rv_core_ibex.core_sleep_q*") && (ReceivingFlop =~ "top_earlgrey.u_pwrmgr_aon.u_cdc.*.u_sync_1.q_o*")} -status {Waived} -comment {Handled by CDC handshaking}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_rom_ctrl.gen_fsm_scramble_enabled.u_checker_fsm.u_state_regs.u_state_flop.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_pwrmgr_aon.u_cdc.*.u_sync_1.q_o*")} -status {Waived} -comment {Handled by CDC handshaking. included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_flash_ctrl.u_reg_idle.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_pwrmgr_aon.u_cdc.*.u_sync_1.q_o*")} -status {Waived} -comment {Handled by CDC handshaking. included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pwrmgr_aon.u_fsm.u_fetch_en.gen_flops.u_prim_flop.u_secure_anchor_flop.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_rv_core_ibex.u_pwrmgr_sync.gen_flops.u_prim_flop_2sync.u_sync_1.q_o*")} -status {Waived} -comment {Handled by CDC handshaking. included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pwrmgr_aon.u_fsm.ip_clk_en_q*") && (ReceivingFlop =~ "top_earlgrey.u_clkmgr_aon.*.u_sync_1.q_o*")} -status {Waived} -comment {Handled by CDC handshaking. included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_io_root_ctrl.u_cg.i_sync.u_sync_2.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_clkmgr_aon.*.u_sync_1.q_o*")} -status {Waived} -comment {Handled by CDC handshaking. included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_reg.u_clk_enables_clk_io_peri_en.q*") && (ReceivingFlop =~ "top_earlgrey.u_clkmgr_aon.*.u_sync_1.q_o*")} -status {Waived} -comment {Handled by CDC handshaking. included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_prim_mubi4_sender_clk_io_peri.gen_flops.u_prim_flop.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_alert_handler.*.u_sync_1.q_o*")} -status {Waived} -comment {Handled by CDC handshaking. included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_host0.gen_alert_tx[0].u_prim_alert_sender.u_prim_flop_alert.u_secure_anchor_flop.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_alert_handler.*.u_sync_1.q_o*")} -status {Waived} -comment {Handled by CDC handshaking. included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_host0.gen_alert_tx[0].u_prim_alert_sender.u_prim_flop_alert.u_secure_anchor_flop.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_alert_handler.*.u_sync_1.q_o*")} -status {Waived} -comment {Handled by CDC handshaking. included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.mio_pad_attr_q*") && (ReceivingFlop =~ "top_earlgrey.u_spi_host1.u_spi_core.u_shift_reg.rx_buf_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.u_pinmux_strap_sampling.tap_strap_q*") && (ReceivingFlop =~ "top_earlgrey.u_spi_host1.u_spi_core.u_shift_reg.rx_buf_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.u_pinmux_strap_sampling.u_prim_lc_sender_pinmux_hw_debug_en.gen_flops.u_prim_flop.u_secure_anchor_flop.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_spi_host1.u_spi_core.u_shift_reg.rx_buf_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.u_pinmux_strap_sampling.u_prim_lc_sync_lc_dft_en.gen_flops.u_prim_flop_2sync.u_sync_2.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_spi_host1.u_spi_core.u_shift_reg.rx_buf_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.u_reg.u_mio_periph_insel_*.q*") && (ReceivingFlop =~ "top_earlgrey.u_spi_host1.u_spi_core.u_shift_reg.rx_buf_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_reg.u_clk_enables_clk_io_div2_peri_en.q*") && (ReceivingFlop =~ "top_earlgrey.u_clkmgr_aon.u_clk_io_div2_peri_sw_en_sync.u_sync_1.q_o*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_prim_mubi4_sender_clk_io_div2_peri.gen_flops.u_prim_flop.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_clkmgr_aon.u_clk_io_div2_peri_sw_en_sync.u_sync_1.q_o*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_spi_host1.gen_alert_tx[0].u_prim_alert_sender.u_prim_flop_alert.u_secure_anchor_flop.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_alert_handler.gen_alerts[20].u_alert_receiver.u_decode_alert.gen_async.i_sync_*.u_sync_1.q_o*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_io_div2_root_ctrl.u_cg.i_sync.u_sync_2.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_clkmgr_aon.u_io_status.u_en_sync.u_sync_1.q_o*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_clkmgr_aon.u_prim_mubi4_sender_clk_io_div2_peri.gen_flops.u_prim_flop.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_alert_handler.u_alert_handler_lpg_ctrl.gen_lpgs[8].u_prim_mubi4_sync_cg_en.gen_flops.u_prim_flop_2sync.u_sync_1.q_o*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.mio_pad_attr_q*") && (ReceivingFlop =~ "top_earlgrey.u_spi_host1.u_spi_core.u_shift_reg.*_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.u_pinmux_strap_sampling.tap_strap_q*") && (ReceivingFlop =~ "top_earlgrey.u_spi_host1.u_spi_core.u_shift_reg.*_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.u_pinmux_strap_sampling.u_prim_lc_sender_pinmux_hw_debug_en.gen_flops.u_prim_flop.u_secure_anchor_flop.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_spi_host1.u_spi_core.u_shift_reg.*_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.u_pinmux_strap_sampling.u_prim_lc_sync_lc_dft_en.gen_flops.u_prim_flop_2sync.u_sync_2.q_o*") && (ReceivingFlop =~ "top_earlgrey.u_spi_host1.u_spi_core.u_shift_reg.*_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
set_rule_status -rule {W_INTERFACE} -expression {(Signal =~ "top_earlgrey.u_pinmux_aon.u_reg.u_mio_periph_insel_*.q*") && (ReceivingFlop =~ "top_earlgrey.u_spi_host1.u_spi_core.u_shift_reg.*_q*")} -status {Waived} -comment {included in waived paths : start signal and receiving signal (flop) have been reviewed and waived in the same error or other errors}
