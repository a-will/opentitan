<!--
DO NOT EDIT THIS FILE DIRECTLY.
It has been generated with ./util/design/gen-otp-mmap.py
-->

|  Index  |         Partition         |  Size [B]  |  Access Granule  |                                    Item                                     |  Byte Address  |  Size [B]  |
|:-------:|:-------------------------:|:----------:|:----------------:|:---------------------------------------------------------------------------:|:--------------:|:----------:|
|    0    |        VENDOR_TEST        |     64     |      32bit       |                                   SCRATCH                                   |     0x000      |     56     |
|         |                           |            |      64bit       |               [VENDOR_TEST_DIGEST](#Reg_vendor_test_digest_0)               |     0x038      |     8      |
|    1    |      CREATOR_SW_CFG       |    368     |      32bit       |                           CREATOR_SW_CFG_AST_CFG                            |     0x040      |    156     |
|         |                           |            |      32bit       |                         CREATOR_SW_CFG_AST_INIT_EN                          |     0x0DC      |     4      |
|         |                           |            |      32bit       |                         CREATOR_SW_CFG_ROM_EXT_SKU                          |     0x0E0      |     4      |
|         |                           |            |      32bit       |                       CREATOR_SW_CFG_SIGVERIFY_SPX_EN                       |     0x0E4      |     4      |
|         |                           |            |      32bit       |                    CREATOR_SW_CFG_FLASH_DATA_DEFAULT_CFG                    |     0x0E8      |     4      |
|         |                           |            |      32bit       |                   CREATOR_SW_CFG_FLASH_INFO_BOOT_DATA_CFG                   |     0x0EC      |     4      |
|         |                           |            |      32bit       |                  CREATOR_SW_CFG_FLASH_HW_INFO_CFG_OVERRIDE                  |     0x0F0      |     4      |
|         |                           |            |      32bit       |                            CREATOR_SW_CFG_RNG_EN                            |     0x0F4      |     4      |
|         |                           |            |      32bit       |                          CREATOR_SW_CFG_JITTER_EN                           |     0x0F8      |     4      |
|         |                           |            |      32bit       |                      CREATOR_SW_CFG_RET_RAM_RESET_MASK                      |     0x0FC      |     4      |
|         |                           |            |      32bit       |                         CREATOR_SW_CFG_MANUF_STATE                          |     0x100      |     4      |
|         |                           |            |      32bit       |                         CREATOR_SW_CFG_ROM_EXEC_EN                          |     0x104      |     4      |
|         |                           |            |      32bit       |                           CREATOR_SW_CFG_CPUCTRL                            |     0x108      |     4      |
|         |                           |            |      32bit       |                     CREATOR_SW_CFG_MIN_SEC_VER_ROM_EXT                      |     0x10C      |     4      |
|         |                           |            |      32bit       |                       CREATOR_SW_CFG_MIN_SEC_VER_BL0                        |     0x110      |     4      |
|         |                           |            |      32bit       |                 CREATOR_SW_CFG_DEFAULT_BOOT_DATA_IN_PROD_EN                 |     0x114      |     4      |
|         |                           |            |      32bit       |                         CREATOR_SW_CFG_RMA_SPIN_EN                          |     0x118      |     4      |
|         |                           |            |      32bit       |                       CREATOR_SW_CFG_RMA_SPIN_CYCLES                        |     0x11C      |     4      |
|         |                           |            |      32bit       |                    CREATOR_SW_CFG_RNG_REPCNT_THRESHOLDS                     |     0x120      |     4      |
|         |                           |            |      32bit       |                    CREATOR_SW_CFG_RNG_REPCNTS_THRESHOLDS                    |     0x124      |     4      |
|         |                           |            |      32bit       |                   CREATOR_SW_CFG_RNG_ADAPTP_HI_THRESHOLDS                   |     0x128      |     4      |
|         |                           |            |      32bit       |                   CREATOR_SW_CFG_RNG_ADAPTP_LO_THRESHOLDS                   |     0x12C      |     4      |
|         |                           |            |      32bit       |                    CREATOR_SW_CFG_RNG_BUCKET_THRESHOLDS                     |     0x130      |     4      |
|         |                           |            |      32bit       |                   CREATOR_SW_CFG_RNG_MARKOV_HI_THRESHOLDS                   |     0x134      |     4      |
|         |                           |            |      32bit       |                   CREATOR_SW_CFG_RNG_MARKOV_LO_THRESHOLDS                   |     0x138      |     4      |
|         |                           |            |      32bit       |                   CREATOR_SW_CFG_RNG_EXTHT_HI_THRESHOLDS                    |     0x13C      |     4      |
|         |                           |            |      32bit       |                   CREATOR_SW_CFG_RNG_EXTHT_LO_THRESHOLDS                    |     0x140      |     4      |
|         |                           |            |      32bit       |                     CREATOR_SW_CFG_RNG_ALERT_THRESHOLD                      |     0x144      |     4      |
|         |                           |            |      32bit       |                   CREATOR_SW_CFG_RNG_HEALTH_CONFIG_DIGEST                   |     0x148      |     4      |
|         |                           |            |      32bit       |                      CREATOR_SW_CFG_SRAM_KEY_RENEW_EN                       |     0x14C      |     4      |
|         |                           |            |      32bit       |                     CREATOR_SW_CFG_IMMUTABLE_ROM_EXT_EN                     |     0x150      |     4      |
|         |                           |            |      32bit       |                CREATOR_SW_CFG_IMMUTABLE_ROM_EXT_START_OFFSET                |     0x154      |     4      |
|         |                           |            |      32bit       |                   CREATOR_SW_CFG_IMMUTABLE_ROM_EXT_LENGTH                   |     0x158      |     4      |
|         |                           |            |      32bit       |                CREATOR_SW_CFG_IMMUTABLE_ROM_EXT_SHA256_HASH                 |     0x15C      |     32     |
|         |                           |            |      32bit       |                           CREATOR_SW_CFG_RESERVED                           |     0x17C      |     32     |
|         |                           |            |      64bit       |            [CREATOR_SW_CFG_DIGEST](#Reg_creator_sw_cfg_digest_0)            |     0x1A8      |     8      |
|    2    |       OWNER_SW_CFG        |    712     |      32bit       |                      OWNER_SW_CFG_ROM_ERROR_REPORTING                       |     0x1B0      |     4      |
|         |                           |            |      32bit       |                       OWNER_SW_CFG_ROM_BOOTSTRAP_DIS                        |     0x1B4      |     4      |
|         |                           |            |      32bit       |                       OWNER_SW_CFG_ROM_ALERT_CLASS_EN                       |     0x1B8      |     4      |
|         |                           |            |      32bit       |                      OWNER_SW_CFG_ROM_ALERT_ESCALATION                      |     0x1BC      |     4      |
|         |                           |            |      32bit       |                    OWNER_SW_CFG_ROM_ALERT_CLASSIFICATION                    |     0x1C0      |    320     |
|         |                           |            |      32bit       |                 OWNER_SW_CFG_ROM_LOCAL_ALERT_CLASSIFICATION                 |     0x300      |     64     |
|         |                           |            |      32bit       |                     OWNER_SW_CFG_ROM_ALERT_ACCUM_THRESH                     |     0x340      |     16     |
|         |                           |            |      32bit       |                    OWNER_SW_CFG_ROM_ALERT_TIMEOUT_CYCLES                    |     0x350      |     16     |
|         |                           |            |      32bit       |                     OWNER_SW_CFG_ROM_ALERT_PHASE_CYCLES                     |     0x360      |     64     |
|         |                           |            |      32bit       |                     OWNER_SW_CFG_ROM_ALERT_DIGEST_PROD                      |     0x3A0      |     4      |
|         |                           |            |      32bit       |                   OWNER_SW_CFG_ROM_ALERT_DIGEST_PROD_END                    |     0x3A4      |     4      |
|         |                           |            |      32bit       |                      OWNER_SW_CFG_ROM_ALERT_DIGEST_DEV                      |     0x3A8      |     4      |
|         |                           |            |      32bit       |                      OWNER_SW_CFG_ROM_ALERT_DIGEST_RMA                      |     0x3AC      |     4      |
|         |                           |            |      32bit       |               OWNER_SW_CFG_ROM_WATCHDOG_BITE_THRESHOLD_CYCLES               |     0x3B0      |     4      |
|         |                           |            |      32bit       |                     OWNER_SW_CFG_ROM_KEYMGR_OTP_MEAS_EN                     |     0x3B4      |     4      |
|         |                           |            |      32bit       |                          OWNER_SW_CFG_MANUF_STATE                           |     0x3B8      |     4      |
|         |                           |            |      32bit       |                       OWNER_SW_CFG_ROM_RSTMGR_INFO_EN                       |     0x3BC      |     4      |
|         |                           |            |      32bit       |                      OWNER_SW_CFG_ROM_EXT_BOOTSTRAP_EN                      |     0x3C0      |     4      |
|         |                           |            |      32bit       |                   OWNER_SW_CFG_ROM_SENSOR_CTRL_ALERT_CFG                    |     0x3C4      |     12     |
|         |                           |            |      32bit       |                      OWNER_SW_CFG_ROM_SRAM_READBACK_EN                      |     0x3D0      |     4      |
|         |                           |            |      32bit       |                  OWNER_SW_CFG_ROM_PRESERVE_RESET_REASON_EN                  |     0x3D4      |     4      |
|         |                           |            |      32bit       |                  OWNER_SW_CFG_ROM_RESET_REASON_CHECK_VALUE                  |     0x3D8      |     4      |
|         |                           |            |      32bit       |                         OWNER_SW_CFG_ROM_BANNER_EN                          |     0x3DC      |     4      |
|         |                           |            |      32bit       |                  OWNER_SW_CFG_ROM_FLASH_ECC_EXC_HANDLER_EN                  |     0x3E0      |     4      |
|         |                           |            |      32bit       |                            OWNER_SW_CFG_RESERVED                            |     0x3E4      |    128     |
|         |                           |            |      64bit       |              [OWNER_SW_CFG_DIGEST](#Reg_owner_sw_cfg_digest_0)              |     0x470      |     8      |
|    3    | ROT_CREATOR_AUTH_CODESIGN |    472     |      32bit       |                  ROT_CREATOR_AUTH_CODESIGN_ECDSA_KEY_TYPE0                  |     0x478      |     4      |
|         |                           |            |      32bit       |                    ROT_CREATOR_AUTH_CODESIGN_ECDSA_KEY0                     |     0x47C      |     64     |
|         |                           |            |      32bit       |                  ROT_CREATOR_AUTH_CODESIGN_ECDSA_KEY_TYPE1                  |     0x4BC      |     4      |
|         |                           |            |      32bit       |                    ROT_CREATOR_AUTH_CODESIGN_ECDSA_KEY1                     |     0x4C0      |     64     |
|         |                           |            |      32bit       |                  ROT_CREATOR_AUTH_CODESIGN_ECDSA_KEY_TYPE2                  |     0x500      |     4      |
|         |                           |            |      32bit       |                    ROT_CREATOR_AUTH_CODESIGN_ECDSA_KEY2                     |     0x504      |     64     |
|         |                           |            |      32bit       |                  ROT_CREATOR_AUTH_CODESIGN_ECDSA_KEY_TYPE3                  |     0x544      |     4      |
|         |                           |            |      32bit       |                    ROT_CREATOR_AUTH_CODESIGN_ECDSA_KEY3                     |     0x548      |     64     |
|         |                           |            |      32bit       |                   ROT_CREATOR_AUTH_CODESIGN_SPX_KEY_TYPE0                   |     0x588      |     4      |
|         |                           |            |      32bit       |                     ROT_CREATOR_AUTH_CODESIGN_SPX_KEY0                      |     0x58C      |     32     |
|         |                           |            |      32bit       |                  ROT_CREATOR_AUTH_CODESIGN_SPX_KEY_CONFIG0                  |     0x5AC      |     4      |
|         |                           |            |      32bit       |                   ROT_CREATOR_AUTH_CODESIGN_SPX_KEY_TYPE1                   |     0x5B0      |     4      |
|         |                           |            |      32bit       |                     ROT_CREATOR_AUTH_CODESIGN_SPX_KEY1                      |     0x5B4      |     32     |
|         |                           |            |      32bit       |                  ROT_CREATOR_AUTH_CODESIGN_SPX_KEY_CONFIG1                  |     0x5D4      |     4      |
|         |                           |            |      32bit       |                   ROT_CREATOR_AUTH_CODESIGN_SPX_KEY_TYPE2                   |     0x5D8      |     4      |
|         |                           |            |      32bit       |                     ROT_CREATOR_AUTH_CODESIGN_SPX_KEY2                      |     0x5DC      |     32     |
|         |                           |            |      32bit       |                  ROT_CREATOR_AUTH_CODESIGN_SPX_KEY_CONFIG2                  |     0x5FC      |     4      |
|         |                           |            |      32bit       |                   ROT_CREATOR_AUTH_CODESIGN_SPX_KEY_TYPE3                   |     0x600      |     4      |
|         |                           |            |      32bit       |                     ROT_CREATOR_AUTH_CODESIGN_SPX_KEY3                      |     0x604      |     32     |
|         |                           |            |      32bit       |                  ROT_CREATOR_AUTH_CODESIGN_SPX_KEY_CONFIG3                  |     0x624      |     4      |
|         |                           |            |      32bit       |                ROT_CREATOR_AUTH_CODESIGN_BLOCK_SHA2_256_HASH                |     0x628      |     32     |
|         |                           |            |      64bit       | [ROT_CREATOR_AUTH_CODESIGN_DIGEST](#Reg_rot_creator_auth_codesign_digest_0) |     0x648      |     8      |
|    4    |  ROT_CREATOR_AUTH_STATE   |     40     |      32bit       |                      ROT_CREATOR_AUTH_STATE_ECDSA_KEY0                      |     0x650      |     4      |
|         |                           |            |      32bit       |                      ROT_CREATOR_AUTH_STATE_ECDSA_KEY1                      |     0x654      |     4      |
|         |                           |            |      32bit       |                      ROT_CREATOR_AUTH_STATE_ECDSA_KEY2                      |     0x658      |     4      |
|         |                           |            |      32bit       |                      ROT_CREATOR_AUTH_STATE_ECDSA_KEY3                      |     0x65C      |     4      |
|         |                           |            |      32bit       |                       ROT_CREATOR_AUTH_STATE_SPX_KEY0                       |     0x660      |     4      |
|         |                           |            |      32bit       |                       ROT_CREATOR_AUTH_STATE_SPX_KEY1                       |     0x664      |     4      |
|         |                           |            |      32bit       |                       ROT_CREATOR_AUTH_STATE_SPX_KEY2                       |     0x668      |     4      |
|         |                           |            |      32bit       |                       ROT_CREATOR_AUTH_STATE_SPX_KEY3                       |     0x66C      |     4      |
|         |                           |            |      64bit       |    [ROT_CREATOR_AUTH_STATE_DIGEST](#Reg_rot_creator_auth_state_digest_0)    |     0x670      |     8      |
|    5    |          HW_CFG0          |     72     |      32bit       |                                  DEVICE_ID                                  |     0x678      |     32     |
|         |                           |            |      32bit       |                                 MANUF_STATE                                 |     0x698      |     32     |
|         |                           |            |      64bit       |                   [HW_CFG0_DIGEST](#Reg_hw_cfg0_digest_0)                   |     0x6B8      |     8      |
|    6    |          HW_CFG1          |     16     |      32bit       |                               EN_SRAM_IFETCH                                |     0x6C0      |     1      |
|         |                           |            |      32bit       |                            EN_CSRNG_SW_APP_READ                             |     0x6C1      |     1      |
|         |                           |            |      32bit       |                            DIS_RV_DM_LATE_DEBUG                             |     0x6C2      |     1      |
|         |                           |            |      64bit       |                   [HW_CFG1_DIGEST](#Reg_hw_cfg1_digest_0)                   |     0x6C8      |     8      |
|    7    |          SECRET0          |     40     |      64bit       |                              TEST_UNLOCK_TOKEN                              |     0x6D0      |     16     |
|         |                           |            |      64bit       |                               TEST_EXIT_TOKEN                               |     0x6E0      |     16     |
|         |                           |            |      64bit       |                   [SECRET0_DIGEST](#Reg_secret0_digest_0)                   |     0x6F0      |     8      |
|    8    |          SECRET1          |     88     |      64bit       |                             FLASH_ADDR_KEY_SEED                             |     0x6F8      |     32     |
|         |                           |            |      64bit       |                             FLASH_DATA_KEY_SEED                             |     0x718      |     32     |
|         |                           |            |      64bit       |                             SRAM_DATA_KEY_SEED                              |     0x738      |     16     |
|         |                           |            |      64bit       |                   [SECRET1_DIGEST](#Reg_secret1_digest_0)                   |     0x748      |     8      |
|    9    |          SECRET2          |     88     |      64bit       |                                  RMA_TOKEN                                  |     0x750      |     16     |
|         |                           |            |      64bit       |                           CREATOR_ROOT_KEY_SHARE0                           |     0x760      |     32     |
|         |                           |            |      64bit       |                           CREATOR_ROOT_KEY_SHARE1                           |     0x780      |     32     |
|         |                           |            |      64bit       |                   [SECRET2_DIGEST](#Reg_secret2_digest_0)                   |     0x7A0      |     8      |
|   10    |        LIFE_CYCLE         |     88     |      32bit       |                              LC_TRANSITION_CNT                              |     0x7A8      |     48     |
|         |                           |            |      32bit       |                                  LC_STATE                                   |     0x7D8      |     40     |