// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of a
//        bit 31~0 - a[31:0] (Read/Write)
// 0x14 : Data signal of a
//        bit 31~0 - a[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of length_r
//        bit 14~0 - length_r[14:0] (Read/Write)
//        others   - reserved
// 0x20 : reserved
// 0x24 : Data signal of tlast
//        bit 0  - tlast[0] (Read/Write)
//        others - reserved
// 0x28 : reserved
// 0x2c : Data signal of replay_length
//        bit 14~0 - replay_length[14:0] (Read/Write)
//        others   - reserved
// 0x30 : reserved
// 0x34 : Data signal of run
//        bit 0  - run[0] (Read/Write)
//        others - reserved
// 0x38 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XDAC_TABLE_AXIM_CONTROL_ADDR_AP_CTRL            0x00
#define XDAC_TABLE_AXIM_CONTROL_ADDR_GIE                0x04
#define XDAC_TABLE_AXIM_CONTROL_ADDR_IER                0x08
#define XDAC_TABLE_AXIM_CONTROL_ADDR_ISR                0x0c
#define XDAC_TABLE_AXIM_CONTROL_ADDR_A_DATA             0x10
#define XDAC_TABLE_AXIM_CONTROL_BITS_A_DATA             64
#define XDAC_TABLE_AXIM_CONTROL_ADDR_LENGTH_R_DATA      0x1c
#define XDAC_TABLE_AXIM_CONTROL_BITS_LENGTH_R_DATA      15
#define XDAC_TABLE_AXIM_CONTROL_ADDR_TLAST_DATA         0x24
#define XDAC_TABLE_AXIM_CONTROL_BITS_TLAST_DATA         1
#define XDAC_TABLE_AXIM_CONTROL_ADDR_REPLAY_LENGTH_DATA 0x2c
#define XDAC_TABLE_AXIM_CONTROL_BITS_REPLAY_LENGTH_DATA 15
#define XDAC_TABLE_AXIM_CONTROL_ADDR_RUN_DATA           0x34
#define XDAC_TABLE_AXIM_CONTROL_BITS_RUN_DATA           1

