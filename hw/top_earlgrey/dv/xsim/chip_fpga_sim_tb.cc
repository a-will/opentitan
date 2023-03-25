// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

#include "mem_area.h"
#include "svdpi.h"
#include "verilator_memutil.h"

typedef struct SimContext {
  std::string tb_scope;
  VerilatorMemUtil memutil;
} SimContext;

SimContext* fpga_sim_init(svOpenArrayHandle args) {
  SimContext *ctx = new SimContext;
  if (ctx == NULL) {
    printf("Failed to allocate SimContext\n");
    goto no_ctx;
  }

  ctx->tb_scope = std::string(svGetNameFromScope(svGetScope());

  std::string top_scope(ctx->tb_scope + (".u_dut.top_earlgrey"));
  std::string ram1p_adv_scope(
      "u_prim_ram_1p_adv.u_mem."
      "gen_generic.u_impl_generic");

  MemArea rom(top_scope + (".u_rom_ctrl.gen_rom_scramble_enabled.u_rom.u_rom."
                           "u_prim_rom.gen_generic.u_impl_generic"),
              0x4000 / 4, 4);
  MemArea ram(top_scope + ".u_ram1p_ram_main." + ram1p_adv_scope, 0x20000 / 4,
              4);
  // Only handle the lower bank of flash for now.
  MemArea flash(top_scope +
                    ".u_flash_ctrl.u_eflash.u_flash.gen_generic.u_impl_generic."
                    "gen_prim_flash_banks[0].u_prim_flash_bank.u_mem."
                    "gen_generic.u_impl_generic",
                0x80000 / 8, 8);
  // Start with the flash region erased. Future loads can overwrite.
  std::vector<uint8_t> all_ones(flash.GetSizeBytes());
  std::fill(all_ones.begin(), all_ones.end(), 0xffu);
  flash.Write(/*word_offset=*/0, all_ones);

  MemArea otp(top_scope + ".u_otp_ctrl.u_otp.gen_generic.u_impl_generic." +
                  ram1p_adv_scope,
              0x4000 / 4, 4);

  ctx->memutil.RegisterMemoryArea("rom", 0x8000, &rom);
  ctx->memutil.RegisterMemoryArea("ram", 0x10000000u, &ram);
  ctx->memutil.RegisterMemoryArea("flash", 0x20000000u, &flash);
  ctx->memutil.RegisterMemoryArea("otp", 0x40000000u /* (bogus LMA) */, &otp);

  int argc = svSize(args, 1);
  std::vector<const char *> c_args(argc);
  for (int i = 0; i < argc; ++i) {
    const char **arg = svGetArrElemPtr1(args, i);
    if (arg != NULL) {
      c_args.push_back(*arg);
    } else {
      goto del_ctx;
    }
  }
  bool exit_app = false;
  ctx->memutil.ParseCLIArguments(c_args.size(), c_args.data(), exit_app);
  if (exit_app) {
    goto del_ctx;
  }
  std::cout << "Simulation of OpenTitan Earl Grey" << std::endl
            << "=================================" << std::endl
            << std::endl;
  return ctx;

del_ctx:
  delete ctx;
no_ctx:
  return NULL;
}

void fpga_sim_finish(SimContext *ctx) {
  if (ctx == NULL) {
    return;
  }
  delete ctx;
}
