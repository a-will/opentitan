// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/lib/dif/dif_dma.h"

#include "gtest/gtest.h"
#include "sw/device/lib/base/mmio.h"
#include "sw/device/lib/base/mock_mmio.h"
#include "sw/device/lib/dif/dif_test_base.h"

extern "C" {
#include "dma_regs.h"  // Generated.
}  // extern "C"

namespace dif_dma_test {
using mock_mmio::MmioTest;
using mock_mmio::MockDevice;
using testing::Test;

// Base class for the rest fixtures in this file.
class DmaTest : public testing::Test, public mock_mmio::MmioTest {};

// Base class for the rest of the tests in this file, provides a
// `dif_dma_t` instance.
class DmaTestInitialized : public DmaTest {
 protected:
  dif_dma_t dma_;

  DmaTestInitialized() { EXPECT_DIF_OK(dif_dma_init(dev().region(), &dma_)); }
};

class ConfigureTest
    : public DmaTestInitialized,
      public testing::WithParamInterface<dif_dma_transaction_t> {};

TEST_P(ConfigureTest, Success) {
  dif_dma_transaction_t transaction = GetParam();
  EXPECT_WRITE32(
      DMA_SOURCE_ADDRESS_LO_REG_OFFSET,
      transaction.source.address & std::numeric_limits<uint32_t>::max());
  EXPECT_WRITE32(DMA_SOURCE_ADDRESS_HI_REG_OFFSET,
                 transaction.source.address >> 32);
  EXPECT_WRITE32(
      DMA_DESTINATION_ADDRESS_LO_REG_OFFSET,
      transaction.destination.address & std::numeric_limits<uint32_t>::max());
  EXPECT_WRITE32(DMA_DESTINATION_ADDRESS_HI_REG_OFFSET,
                 transaction.destination.address >> 32);

  EXPECT_WRITE32(
      DMA_ADDRESS_SPACE_ID_REG_OFFSET,
      {
          {DMA_ADDRESS_SPACE_ID_SOURCE_ASID_OFFSET, transaction.source.asid},
          {DMA_ADDRESS_SPACE_ID_DESTINATION_ASID_OFFSET,
           transaction.destination.asid},
      });

  EXPECT_WRITE32(DMA_TOTAL_DATA_SIZE_REG_OFFSET, transaction.size);
  EXPECT_WRITE32(DMA_TRANSFER_WIDTH_REG_OFFSET, transaction.width);

  EXPECT_DIF_OK(dif_dma_configure(&dma_, transaction));
}

INSTANTIATE_TEST_SUITE_P(ConfigureTest, ConfigureTest,
                         testing::ValuesIn(std::vector<dif_dma_transaction_t>{{
                             // Test 0
                             {
                                 .source =
                                     {
                                         .address = 0xB05BA84B,
                                         .asid = kDifDmaOpentitanInternalBus,
                                     },
                                 .destination =
                                     {
                                         .address = 0x721F400F,
                                         .asid = kDifDmaOpentitanInternalBus,
                                     },
                                 .size = 0x1,
                                 .width = kDifDmaTransWidth1Byte,
                             },
                             // Test 1
                             {
                                 .source =
                                     {
                                         .address = 0x34FCA80BC5C5CA67,
                                         .asid = kDifDmaOpentitanExternalFlash,
                                     },
                                 .destination =
                                     {
                                         .address = 0xD0CF2C50,
                                         .asid = kDifDmaSoCControlRegisterBus,
                                     },
                                 .size = 0x2,
                                 .width = kDifDmaTransWidth2Bytes,
                             },
                             // Test 2
                             {
                                 .source =
                                     {
                                         .address = 0x05BA857F8D9C0838,
                                         .asid = kDifDmaOpentitanExternalFlash,
                                     },
                                 .destination =
                                     {
                                         .address = 0x32CD872A12225CCE,
                                         .asid = kDifDmaSoCSystemBus,
                                     },
                                 .size = 0x4,
                                 .width = kDifDmaTransWidth4Bytes,
                             },
                             // Test 3
                             {
                                 .source =
                                     {
                                         .address = 0xBFED148856E0555E,
                                         .asid = kDifDmaSoCSystemBus,
                                     },
                                 .destination =
                                     {
                                         .address = 0x9ECFA11919F684D7,
                                         .asid = kDifDmaOpentitanExternalFlash,
                                     },
                                 .size = std::numeric_limits<uint32_t>::max(),
                                 .width = kDifDmaTransWidth4Bytes,
                             },
                         }}));

TEST_F(ConfigureTest, BadArg) {
  dif_dma_transaction_t transaction;
  EXPECT_DIF_BADARG(dif_dma_configure(nullptr, transaction));
}

}  // namespace dif_dma_test
