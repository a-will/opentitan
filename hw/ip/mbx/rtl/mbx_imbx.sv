// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

`include "prim_assert.sv"

module mbx_imbx #(
  parameter int unsigned CfgSramAddrWidth = 32,
  parameter int unsigned CfgSramDataWidth = 32
) (
  input  logic                        clk_i,
  input  logic                        rst_ni,
  output logic                        imbx_state_error_o,
  output logic                        imbx_pending_o,
  output logic                        imbx_irq_ready_o,
  output logic                        imbx_irq_abort_o,
  output logic                        imbx_status_busy_update_o,
  output logic                        imbx_status_busy_o,
  // Access to the control and status registers of host interface
  input  logic                        hostif_control_abort_set_i,
  input  logic                        hostif_status_busy_clear_i,
  input  logic                        hostif_status_error_set_i,
  // Range configuration for the private SRAM
  input  logic                        hostif_range_valid_i,
  input  logic [CfgSramAddrWidth-1:0] hostif_base_i,
  input  logic [CfgSramAddrWidth-1:0] hostif_limit_i,
  // Device interface from the system side
  input  logic                        sysif_status_busy_i,
  input  logic                        sysif_control_go_set_i,
  input  logic                        sysif_control_abort_set_i,
  input  logic                        sysif_data_write_valid_i,
  // Host interface to the private SRAM
  output logic                        hostif_sram_write_req_o,
  input  logic                        hostif_sram_write_gnt_i,
  output logic [CfgSramAddrWidth-1:0] hostif_sram_write_ptr_o
);
  localparam int unsigned LCFG_SRM_ADDRINC = CfgSramDataWidth / 8;

  logic [CfgSramAddrWidth-1:0] sram_write_ptr_d, sram_write_ptr_q;

  // Status signals from the FSM
  logic mbx_empty, mbx_write, mbx_read, mbx_sys_abort;

  // hostif_sram_write_req_o is actually sticky because the sys-side TLUL_adapter_reg is
  // NOT ack'ed until the command is granted by the host-side TLUL_adapter_host
  // RW2A = sticky from DEC/RW-stage to (srm command) ACK
  logic   write_req;
  assign  write_req = (mbx_empty & sysif_data_write_valid_i) |
                      (mbx_write & sysif_data_write_valid_i & (sram_write_ptr_q <= hostif_limit_i));

  // Create a sticky TLUL write request until its granted
  logic req_q;
  assign hostif_sram_write_req_o = write_req | req_q;

  prim_flop #(
    .Width(1)
  ) u_req_state (
    .clk_i ( clk_i                                              ),
    .rst_ni( rst_ni                                             ),
    .d_i   ( hostif_sram_write_req_o & ~hostif_sram_write_gnt_i ),
    .q_o   ( req_q                                              )
  );

  logic sys_clear_abort;
  logic load_write_ptr, advance_write_ptr;

  assign sys_clear_abort = hostif_control_abort_set_i & mbx_sys_abort;

  // Rewind the write pointer to the base
  assign load_write_ptr = mbx_empty | sys_clear_abort |
                         (mbx_read & hostif_status_busy_clear_i);

  // Advance the write pointer when the valid write command is granted by the tlul_adaptor_host
  assign  advance_write_ptr = hostif_sram_write_req_o & hostif_sram_write_gnt_i;

  always_comb begin
    sram_write_ptr_d = sram_write_ptr_q;

    if (load_write_ptr) begin
      sram_write_ptr_d = hostif_base_i;
    end else if (advance_write_ptr) begin
      sram_write_ptr_d = sram_write_ptr_q + LCFG_SRM_ADDRINC;
    end
  end

  prim_generic_flop_en #(
    .Width(CfgSramAddrWidth)
  ) u_sram_write_ptr (
    .clk_i ( clk_i                              ),
    .rst_ni( rst_ni                             ),
    .en_i  ( load_write_ptr | advance_write_ptr ),
    .d_i   ( sram_write_ptr_d                   ),
    .q_o   ( sram_write_ptr_q                   )
  );
  assign hostif_sram_write_ptr_o = sram_write_ptr_q;

  // Backpressure the next write data until the current write data is granted by the TLUL adapter
  logic set_pending, clear_pending;

  // Block the request from TLUL until the SRAM write is complete
  assign set_pending   = write_req;
  assign clear_pending = hostif_sram_write_gnt_i;

  prim_flop #(
    .Width(1)
  ) u_pending (
    .clk_i ( clk_i                                           ),
    .rst_ni( rst_ni                                          ),
    .d_i   ( ~clear_pending & (set_pending | imbx_pending_o) ),
    .q_o   ( imbx_pending_o                                  )
  );

  // Busy logic
  logic imbx_set_busy, imbx_clear_busy;
  assign imbx_set_busy  = (mbx_write                   &
                           sysif_control_go_set_i      &
                           ~hostif_status_error_set_i  &
                           ~sysif_control_abort_set_i) |
                           sysif_control_abort_set_i;

  // Exit of mailbox read is used to clear imbx.busy and imbx.ready
  // Not yet qualified with mbx_read
  assign imbx_clear_busy = hostif_status_error_set_i |
                           sysif_control_abort_set_i |
                           hostif_status_busy_clear_i;

  // External busy update interface
  assign imbx_status_busy_update_o = imbx_set_busy | imbx_clear_busy;
  assign imbx_status_busy_o        = imbx_set_busy;

  // Generate host interrupt
  //   on sys_write go, when host enters state to process the received objects
  //   on abort
  assign imbx_irq_ready_o = mbx_read;
  assign imbx_irq_abort_o = mbx_sys_abort;

  mbx_fsm #(
    .CfgObMbx ( 0 )
  ) u_mbxfsm(
    .clk_i                     ( clk_i                      ),
    .rst_ni                    ( rst_ni                     ),
    .mbx_range_valid_i         ( hostif_range_valid_i       ),
    .hostif_abort_ack_i        ( hostif_control_abort_set_i ),
    .hostif_status_error_set_i ( hostif_status_error_set_i  ),
    .hostif_status_busy_clear_i( hostif_status_busy_clear_i ),
    .sysif_control_abort_set_i ( sysif_control_abort_set_i  ),
    .sys_read_all_i            ( 1'b0                       ),
    .writer_close_mbx_i        ( sysif_control_go_set_i     ),
    .writer_write_valid_i      ( sysif_data_write_valid_i   ),
    // Status signals
    .mbx_empty_o               ( mbx_empty                  ),
    .mbx_write_o               ( mbx_write                  ),
    .mbx_read_o                ( mbx_read                   ),
    .mbx_sys_abort_o           ( mbx_sys_abort              ),
    .mbx_ob_ready_update_o     (                            ),
    .mbx_ob_ready_o            (                            ),
    .mbx_state_error_o         ( imbx_state_error_o         )
  );

  //////////////////////////////////////////////////////////////////////////////
  // Assertions
  //////////////////////////////////////////////////////////////////////////////

  // Don't write the mailbox if it is full
  `ASSERT(NeverWriteMbxIfFull_A, imbx_is_full & hostif_sram_write_req_o)

`ifdef INC_ASSERT
  logic[CfgSramAddrWidth-1:0] sram_write_ptr_assert_q;
  prim_flop #(
    .Width(CfgSramAddrWidth)
  ) u_sram_write_ptr_assert (
    .clk_i ( clk_i             ),
    .rst_ni( rst_ni            ),
    .d_i   ( sram_write_ptr_d        ),
    .q_o   ( sram_write_ptr_assert_q )
  );
  // A granted write by the host adapter must advance the write pointer
  `ASSERT_IF(GntMustAdvanceWritePtr_A, sram_write_ptr_assert_q == sram_write_ptr_q,
             hostif_sram_write_gnt_i)
`endif

  // The write pointer should not be advanced if there  is not yet acked request
  `ASSERT_IF(WrPtrShouldNotAdvanceIfNoAck_A, ~imbx_pending_o, advance_write_ptr & imbx_pending_o)
  // Clear busy/abort does not clear the IRQ
  `ASSERT_IF(ClearBusyAbortDoesNotClearIrq_A, sysif_status_busy_i == imbx_irq_host_o,
             sysif_status_busy_i & imbx_irq_host_o)
  // Busy and host IRQ are not set together
  `ASSERT_IF(BusyIrqNotSetTogether_A, sysif_status_busy_i & imbx_irq_host_o,
             sysif_control_go_set_i | sysif_control_abort_set_i)
  // When writing to the mailbox, DOE status busy must be low
  `ASSERT_NEVER(WriteToMbxBusyMustBeLow_A, hostif_sram_write_req_o & sysif_status_busy_i)

endmodule
