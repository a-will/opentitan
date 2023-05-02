// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// -------- W A R N I N G: A U T O - G E N E R A T E D  C O D E !! -------- //
// PLEASE DO NOT HAND-EDIT THIS FILE. IT HAS BEEN AUTO-GENERATED.
//
//############################################################################
// *Name: adc
// *Module Description:  Analog/Digital Converter
//############################################################################

module adc #(
  parameter int unsigned AdcCnvtClks = 19,// 21cc from adc_chnsel_i change to adc_d_val_o assertion
  parameter int AdcChannels = 2,          // ADC number of  Channels
  parameter int AdcDataWidth = 10
) (
  input ast_pkg::awire_t adc_a0_ai,  // ADC A0 Analog Input
  input ast_pkg::awire_t adc_a1_ai,  // ADC A1 Analog Input
  input [AdcChannels-1:0] adc_chnsel_i,  // Onehot value only for selrction
  input adc_pd_i,                    // ADC Power Down
  input clk_adc_i,                   // ADC Clock (aon_clk - 200KHz)
  input rst_adc_ni,                  // ADC Reset active low
  output logic [AdcDataWidth-1:0] adc_d_o,  // ADC 10-bit Data Output
  output logic adc_d_val_o           // ADC Data Valid Output
);

///////////////////////////////////////
// ADC Enable
///////////////////////////////////////
logic adc_en;

always_ff @( posedge clk_adc_i, negedge rst_adc_ni ) begin
  if ( !rst_adc_ni ) begin
    adc_en <= 1'b0;
  end else begin
    adc_en <= !adc_pd_i;
  end
end


///////////////////////////////////////
// ADC Channel Select
///////////////////////////////////////
logic chn_selected, chn_selected_d, new_convert, adc_busy;

assign chn_selected = |(adc_chnsel_i);

always_ff @( posedge clk_adc_i, negedge rst_adc_ni ) begin
  if ( !rst_adc_ni ) begin
    chn_selected_d <= 1'b0;
  end else begin
    chn_selected_d <= chn_selected;
  end
end

// New Convertion
assign new_convert = chn_selected && !chn_selected_d && !adc_busy;

////////////////////////////////////////
// ADC Analog Model
////////////////////////////////////////
logic [10-1:0] adc_d_ch0, adc_d_ch1;

adc_ana u_adc_ana (
  .adc_a0_ai ( adc_a0_ai ),
  .adc_a1_ai ( adc_a1_ai ),
  .adc_d_ch0_o ( adc_d_ch0[10-1:0] ),
  .adc_d_ch1_o ( adc_d_ch1[10-1:0] )
);


////////////////////////////////////////
// ADC Digital Model
////////////////////////////////////////
logic [8-1:0] cnv_cyc;
logic [8-1:0] ConvertCount;

assign ConvertCount = AdcCnvtClks[8-1:0];

always_ff @( posedge clk_adc_i, negedge rst_adc_ni ) begin
  if (!rst_adc_ni ) begin
    cnv_cyc     <= 8'h00;
    adc_busy    <= 1'b0;
    adc_d_val_o <= 1'b0;
    adc_d_o     <= {AdcDataWidth{1'b0}};
  end else if ( !(adc_en && chn_selected) ) begin
    cnv_cyc     <= 8'h00;
    adc_busy    <= 1'b0;
    adc_d_val_o <= 1'b0;
  end else if ( new_convert ) begin
    cnv_cyc     <= ConvertCount;
    adc_busy    <= 1'b1;
    adc_d_val_o <= 1'b0;
  end else if ( adc_busy && (cnv_cyc > 8'h00) ) begin
    cnv_cyc     <= cnv_cyc - 1'b1;
    adc_busy    <= 1'b1;
    adc_d_val_o <= 1'b0;
  end else if ( adc_busy ) begin
    adc_busy    <= 1'b0;
    adc_d_val_o <= 1'b1;
    adc_d_o     <= (adc_chnsel_i[1:0] == 2'b00) ? adc_d_o :
                   (adc_chnsel_i[1:0] == 2'b01) ? adc_d_ch0[10-1:0] :
                   (adc_chnsel_i[1:0] == 2'b10) ? adc_d_ch1[10-1:0] :
                                                  {AdcDataWidth{1'b1}};
  end
end

/////////////////////////
// ASSERTIONS
/////////////////////////
// Add Assertion mux selector is onehot - zero is allowed
`ASSERT(AdcChnselOneHot, $onehot0(adc_chnsel_i), clk_adc_i, !rst_adc_ni)

// Add Assertion adc_en=0 chnsel is 0.
`ASSERT(NoChannelWhileDisabled, (adc_en == 0) |-> (adc_chnsel_i == 4'h0), clk_adc_i, !rst_adc_ni)

// Add Assertion RE of adc_en on the first 30us (=6*5us cc) after adc_en rose chnsel is 0.
// The 7 samples ensure an interval of 30uS is covered, assuming clk_adc_i is at least 200 kHz and
// neglecting clk-to-q for the adc_en flop.
`ASSERT(ChannelStableOnAdcEn,
        $rose(adc_en) |-> ($past(adc_chnsel_i) == 4'h0)[*7], clk_adc_i, !rst_adc_ni)

endmodule : adc
