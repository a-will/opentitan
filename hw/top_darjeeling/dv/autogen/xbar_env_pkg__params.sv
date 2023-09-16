// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_env_pkg__params generated by `topgen.py` tool


// List of Xbar device memory map
tl_device_t xbar_devices[$] = '{
    '{"rv_dm__regs", '{
        '{32'h21200000, 32'h21200003}
    }},
    '{"rv_dm__mem", '{
        '{32'h00040000, 32'h00040fff}
    }},
    '{"rom_ctrl0__rom", '{
        '{32'h00008000, 32'h0000ffff}
    }},
    '{"rom_ctrl0__regs", '{
        '{32'h211e0000, 32'h211e007f}
    }},
    '{"rom_ctrl1__rom", '{
        '{32'h00020000, 32'h0002ffff}
    }},
    '{"rom_ctrl1__regs", '{
        '{32'h211e1000, 32'h211e107f}
    }},
    '{"soc_proxy__core", '{
        '{32'h22030000, 32'h2203000f}
    }},
    '{"soc_proxy__ctn", '{
        '{32'h40000000, 32'h7fffffff}
    }},
    '{"spi_host1", '{
        '{32'h32000000, 32'h3200003f}
    }},
    '{"usbdev", '{
        '{32'h32010000, 32'h32010fff}
    }},
    '{"hmac", '{
        '{32'h21110000, 32'h21110fff}
    }},
    '{"kmac", '{
        '{32'h21120000, 32'h21120fff}
    }},
    '{"aes", '{
        '{32'h21100000, 32'h211000ff}
    }},
    '{"csrng", '{
        '{32'h21150000, 32'h2115007f}
    }},
    '{"edn0", '{
        '{32'h21170000, 32'h2117007f}
    }},
    '{"edn1", '{
        '{32'h21180000, 32'h2118007f}
    }},
    '{"rv_plic", '{
        '{32'h28000000, 32'h2fffffff}
    }},
    '{"otbn", '{
        '{32'h21130000, 32'h2113ffff}
    }},
    '{"keymgr_dpe", '{
        '{32'h21140000, 32'h211400ff}
    }},
    '{"rv_core_ibex__cfg", '{
        '{32'h211f0000, 32'h211f07ff}
    }},
    '{"sram_ctrl_main__regs", '{
        '{32'h211c0000, 32'h211c001f}
    }},
    '{"sram_ctrl_main__ram", '{
        '{32'h10000000, 32'h1000ffff}
    }},
    '{"sram_ctrl_mbox__regs", '{
        '{32'h211d0000, 32'h211d001f}
    }},
    '{"sram_ctrl_mbox__ram", '{
        '{32'h11000000, 32'h11000fff}
    }},
    '{"dma", '{
        '{32'h22010000, 32'h220100ff}
    }},
    '{"mbx0__core", '{
        '{32'h22000000, 32'h2200007f}
    }},
    '{"mbx1__core", '{
        '{32'h22000100, 32'h2200017f}
    }},
    '{"mbx2__core", '{
        '{32'h22000200, 32'h2200027f}
    }},
    '{"mbx3__core", '{
        '{32'h22000300, 32'h2200037f}
    }},
    '{"mbx4__core", '{
        '{32'h22000400, 32'h2200047f}
    }},
    '{"mbx5__core", '{
        '{32'h22000500, 32'h2200057f}
    }},
    '{"mbx6__core", '{
        '{32'h22000600, 32'h2200067f}
    }},
    '{"mbx7__core", '{
        '{32'h22000700, 32'h2200077f}
    }},
    '{"mbx_jtag__core", '{
        '{32'h22000800, 32'h2200087f}
    }},
    '{"mbx_pcie0__core", '{
        '{32'h22040000, 32'h2204007f}
    }},
    '{"uart0", '{
        '{32'h30010000, 32'h3001003f}
    }},
    '{"i2c0", '{
        '{32'h30080000, 32'h3008007f}
    }},
    '{"i2c1", '{
        '{32'h31030000, 32'h3103007f}
    }},
    '{"i2c2", '{
        '{32'h31040000, 32'h3104007f}
    }},
    '{"gpio", '{
        '{32'h30000000, 32'h3000007f}
    }},
    '{"spi_host0", '{
        '{32'h30300000, 32'h3030003f}
    }},
    '{"spi_device", '{
        '{32'h30310000, 32'h30311fff}
    }},
    '{"rv_timer", '{
        '{32'h30100000, 32'h301001ff}
    }},
    '{"pwrmgr_aon", '{
        '{32'h30400000, 32'h3040007f}
    }},
    '{"rstmgr_aon", '{
        '{32'h30410000, 32'h3041007f}
    }},
    '{"clkmgr_aon", '{
        '{32'h30420000, 32'h3042007f}
    }},
    '{"pinmux_aon", '{
        '{32'h30460000, 32'h30460fff}
    }},
    '{"otp_ctrl__core", '{
        '{32'h30130000, 32'h30137fff}
    }},
    '{"otp_ctrl__prim", '{
        '{32'h30138000, 32'h3013801f}
    }},
    '{"lc_ctrl", '{
        '{32'h30140000, 32'h301400ff}
    }},
    '{"sensor_ctrl", '{
        '{32'h30020000, 32'h3002003f}
    }},
    '{"alert_handler", '{
        '{32'h30150000, 32'h301507ff}
    }},
    '{"sram_ctrl_ret_aon__regs", '{
        '{32'h30500000, 32'h3050001f}
    }},
    '{"sram_ctrl_ret_aon__ram", '{
        '{32'h30600000, 32'h30600fff}
    }},
    '{"aon_timer_aon", '{
        '{32'h30470000, 32'h3047003f}
    }},
    '{"sysrst_ctrl_aon", '{
        '{32'h31060000, 32'h310600ff}
    }},
    '{"adc_ctrl_aon", '{
        '{32'h31070000, 32'h3107007f}
    }},
    '{"ast", '{
        '{32'h30480000, 32'h304803ff}
    }},
    '{"mbx0__soc", '{
        '{32'h00005000, 32'h0000501f}
    }},
    '{"mbx1__soc", '{
        '{32'h00005100, 32'h0000511f}
    }},
    '{"mbx2__soc", '{
        '{32'h00005200, 32'h0000521f}
    }},
    '{"mbx3__soc", '{
        '{32'h00005300, 32'h0000531f}
    }},
    '{"mbx4__soc", '{
        '{32'h00005400, 32'h0000541f}
    }},
    '{"mbx5__soc", '{
        '{32'h00005500, 32'h0000551f}
    }},
    '{"mbx6__soc", '{
        '{32'h00005600, 32'h0000561f}
    }},
    '{"mbx7__soc", '{
        '{32'h00005700, 32'h0000571f}
    }},
    '{"mbx_pcie0__soc", '{
        '{32'h00000100, 32'h0000011f}
    }},
    '{"mbx_jtag__soc", '{
        '{32'h00000200, 32'h0000021f}
    }}};

  // List of Xbar hosts
tl_host_t xbar_hosts[$] = '{
    '{"rv_core_ibex__corei", 0, '{
        "rom_ctrl0__rom",
        "rom_ctrl1__rom",
        "rv_dm__mem",
        "sram_ctrl_main__ram",
        "soc_proxy__ctn"}}
    ,
    '{"rv_core_ibex__cored", 1, '{
        "rom_ctrl0__rom",
        "rom_ctrl0__regs",
        "rom_ctrl1__rom",
        "rom_ctrl1__regs",
        "rv_dm__mem",
        "rv_dm__regs",
        "sram_ctrl_main__ram",
        "uart0",
        "i2c0",
        "i2c1",
        "i2c2",
        "gpio",
        "spi_host0",
        "spi_device",
        "rv_timer",
        "pwrmgr_aon",
        "rstmgr_aon",
        "clkmgr_aon",
        "pinmux_aon",
        "otp_ctrl__core",
        "otp_ctrl__prim",
        "lc_ctrl",
        "sensor_ctrl",
        "alert_handler",
        "ast",
        "sram_ctrl_ret_aon__ram",
        "sram_ctrl_ret_aon__regs",
        "aon_timer_aon",
        "adc_ctrl_aon",
        "sysrst_ctrl_aon",
        "spi_host1",
        "usbdev",
        "aes",
        "csrng",
        "edn0",
        "edn1",
        "hmac",
        "rv_plic",
        "otbn",
        "keymgr_dpe",
        "kmac",
        "sram_ctrl_main__regs",
        "rv_core_ibex__cfg",
        "sram_ctrl_mbox__ram",
        "sram_ctrl_mbox__regs",
        "soc_proxy__ctn",
        "soc_proxy__core",
        "dma",
        "mbx0__core",
        "mbx1__core",
        "mbx2__core",
        "mbx3__core",
        "mbx4__core",
        "mbx5__core",
        "mbx6__core",
        "mbx7__core",
        "mbx_jtag__core",
        "mbx_pcie0__core"}}
    ,
    '{"rv_dm__sba", 2, '{
        "rom_ctrl0__rom",
        "rom_ctrl0__regs",
        "rom_ctrl1__rom",
        "rom_ctrl1__regs",
        "rv_dm__mem",
        "rv_dm__regs",
        "sram_ctrl_main__ram",
        "uart0",
        "i2c0",
        "i2c1",
        "i2c2",
        "gpio",
        "spi_host0",
        "spi_device",
        "rv_timer",
        "pwrmgr_aon",
        "rstmgr_aon",
        "clkmgr_aon",
        "pinmux_aon",
        "otp_ctrl__core",
        "otp_ctrl__prim",
        "lc_ctrl",
        "sensor_ctrl",
        "alert_handler",
        "ast",
        "sram_ctrl_ret_aon__ram",
        "sram_ctrl_ret_aon__regs",
        "aon_timer_aon",
        "adc_ctrl_aon",
        "sysrst_ctrl_aon",
        "spi_host1",
        "usbdev",
        "aes",
        "csrng",
        "edn0",
        "edn1",
        "hmac",
        "rv_plic",
        "otbn",
        "keymgr_dpe",
        "kmac",
        "sram_ctrl_main__regs",
        "rv_core_ibex__cfg",
        "sram_ctrl_mbox__ram",
        "sram_ctrl_mbox__regs",
        "soc_proxy__ctn",
        "soc_proxy__core",
        "dma",
        "mbx0__core",
        "mbx1__core",
        "mbx2__core",
        "mbx3__core",
        "mbx4__core",
        "mbx5__core",
        "mbx6__core",
        "mbx7__core",
        "mbx_jtag__core",
        "mbx_pcie0__core"}}
    ,
    '{"dma__host", 3, '{
        "sram_ctrl_main__ram",
        "uart0",
        "i2c0",
        "i2c1",
        "i2c2",
        "gpio",
        "spi_host0",
        "spi_device",
        "rv_timer",
        "pwrmgr_aon",
        "rstmgr_aon",
        "clkmgr_aon",
        "pinmux_aon",
        "otp_ctrl__core",
        "otp_ctrl__prim",
        "lc_ctrl",
        "sensor_ctrl",
        "alert_handler",
        "ast",
        "sram_ctrl_ret_aon__ram",
        "sram_ctrl_ret_aon__regs",
        "aon_timer_aon",
        "adc_ctrl_aon",
        "sysrst_ctrl_aon"}}
    ,
    '{"mbx0__sram", 4, '{
        "sram_ctrl_mbox__ram"}}
    ,
    '{"mbx1__sram", 5, '{
        "sram_ctrl_mbox__ram"}}
    ,
    '{"mbx2__sram", 6, '{
        "sram_ctrl_mbox__ram"}}
    ,
    '{"mbx3__sram", 7, '{
        "sram_ctrl_mbox__ram"}}
    ,
    '{"mbx4__sram", 8, '{
        "sram_ctrl_mbox__ram"}}
    ,
    '{"mbx5__sram", 9, '{
        "sram_ctrl_mbox__ram"}}
    ,
    '{"mbx6__sram", 10, '{
        "sram_ctrl_mbox__ram"}}
    ,
    '{"mbx7__sram", 11, '{
        "sram_ctrl_mbox__ram"}}
    ,
    '{"mbx_jtag__sram", 12, '{
        "sram_ctrl_mbox__ram"}}
    ,
    '{"mbx_pcie0__sram", 13, '{
        "sram_ctrl_mbox__ram"}}
};
