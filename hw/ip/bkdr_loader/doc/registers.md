# Registers

<!-- BEGIN CMDGEN util/regtool.py -d ./hw/ip/bkdr_loader/data/bkdr_loader.hjson -->
## Summary

| Name                          | Offset   |   Length | Description                             |
|:------------------------------|:---------|---------:|:----------------------------------------|
| bkdr_loader.[`INFO`](#info)   | 0x0      |        4 | Information about this backdoor loader. |
| bkdr_loader.[`OP`](#op)       | 0x4      |        4 | Operation control and status            |
| bkdr_loader.[`DATA_0`](#data) | 0x40     |        4 | Value to be written to the RAM          |
| bkdr_loader.[`DATA_1`](#data) | 0x44     |        4 | Value to be written to the RAM          |
| bkdr_loader.[`DATA_2`](#data) | 0x48     |        4 | Value to be written to the RAM          |
| bkdr_loader.[`DATA_3`](#data) | 0x4c     |        4 | Value to be written to the RAM          |
| bkdr_loader.[`INDEX`](#index) | 0x50     |        4 | Index of the word to be written         |

## INFO
Information about this backdoor loader.
- Offset: `0x0`
- Reset default: `0x2007`
- Reset mask: `0x3f07`

### Fields

```wavejson
{"reg": [{"name": "MAX_WORD_SIZE", "bits": 3, "attr": ["ro"], "rotate": -90}, {"bits": 5}, {"name": "MAX_INDEX_BITS", "bits": 6, "attr": ["ro"], "rotate": -90}, {"bits": 18}], "config": {"lanes": 1, "fontsize": 10, "vspace": 160}}
```

|  Bits  |  Type  |  Reset  | Name           | Description                                                              |
|:------:|:------:|:-------:|:---------------|:-------------------------------------------------------------------------|
| 31:14  |        |         |                | Reserved                                                                 |
|  13:8  |   ro   |  0x20   | MAX_INDEX_BITS | The maximum number of bits supported in a word index (word "address").   |
|  7:3   |        |         |                | Reserved                                                                 |
|  2:0   |   ro   |   0x7   | MAX_WORD_SIZE  | The maximum number of bits supported in a word, encoded as a power of 2. |

## OP
Operation control and status
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0xff01`

### Fields

```wavejson
{"reg": [{"name": "ISSUE_WRITE", "bits": 1, "attr": ["rw1s"], "rotate": -90}, {"bits": 7}, {"name": "MEM_SELECT", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 130}}
```

|  Bits  |  Type  |  Reset  | Name        | Description                                                         |
|:------:|:------:|:-------:|:------------|:--------------------------------------------------------------------|
| 31:16  |        |         |             | Reserved                                                            |
|  15:8  |   rw   |   0x0   | MEM_SELECT  | Binary-encoded memory selector for issuing an operation.            |
|  7:1   |        |         |             | Reserved                                                            |
|   0    |  rw1s  |   0x0   | ISSUE_WRITE | Issue a write transaction with the current state of the other CSRs. |

## DATA
Value to be written to the RAM
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name   | Offset   |
|:-------|:---------|
| DATA_0 | 0x40     |
| DATA_1 | 0x44     |
| DATA_2 | 0x48     |
| DATA_3 | 0x4c     |


### Fields

```wavejson
{"reg": [{"name": "VAL", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   rw   |   0x0   | VAL    |               |

## INDEX
Index of the word to be written
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name   | Offset   |
|:-------|:---------|
| INDEX  | 0x50     |


### Fields

```wavejson
{"reg": [{"name": "VAL", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   rw   |   0x0   | VAL    |               |


<!-- END CMDGEN -->
