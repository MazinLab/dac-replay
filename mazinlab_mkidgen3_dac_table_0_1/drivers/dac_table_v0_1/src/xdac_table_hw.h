// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x000000 : Control signals
//            bit 0  - ap_start (Read/Write/COH)
//            bit 1  - ap_done (Read/COR)
//            bit 2  - ap_idle (Read)
//            bit 3  - ap_ready (Read)
//            bit 7  - auto_restart (Read/Write)
//            others - reserved
// 0x000004 : Global Interrupt Enable Register
//            bit 0  - Global Interrupt Enable (Read/Write)
//            others - reserved
// 0x000008 : IP Interrupt Enable Register (Read/Write)
//            bit 0  - Channel 0 (ap_done)
//            bit 1  - Channel 1 (ap_ready)
//            others - reserved
// 0x00000c : IP Interrupt Status Register (Read/TOW)
//            bit 0  - Channel 0 (ap_done)
//            bit 1  - Channel 1 (ap_ready)
//            others - reserved
// 0x110000 : Data signal of length_r
//            bit 31~0 - length_r[31:0] (Read/Write)
// 0x110004 : reserved
// 0x110008 : Data signal of tlast
//            bit 0  - tlast[0] (Read/Write)
//            others - reserved
// 0x11000c : reserved
// 0x110010 : Data signal of tlast_length
//            bit 31~0 - tlast_length[31:0] (Read/Write)
// 0x110014 : reserved
// 0x010000 ~
// 0x01ffff : Memory 'comb_0_0' (32768 * 16b)
//            Word n : bit [15: 0] - comb_0_0[2n]
//                     bit [31:16] - comb_0_0[2n+1]
// 0x020000 ~
// 0x02ffff : Memory 'comb_0_1' (32768 * 16b)
//            Word n : bit [15: 0] - comb_0_1[2n]
//                     bit [31:16] - comb_0_1[2n+1]
// 0x030000 ~
// 0x03ffff : Memory 'comb_1_0' (32768 * 16b)
//            Word n : bit [15: 0] - comb_1_0[2n]
//                     bit [31:16] - comb_1_0[2n+1]
// 0x040000 ~
// 0x04ffff : Memory 'comb_1_1' (32768 * 16b)
//            Word n : bit [15: 0] - comb_1_1[2n]
//                     bit [31:16] - comb_1_1[2n+1]
// 0x050000 ~
// 0x05ffff : Memory 'comb_2_0' (32768 * 16b)
//            Word n : bit [15: 0] - comb_2_0[2n]
//                     bit [31:16] - comb_2_0[2n+1]
// 0x060000 ~
// 0x06ffff : Memory 'comb_2_1' (32768 * 16b)
//            Word n : bit [15: 0] - comb_2_1[2n]
//                     bit [31:16] - comb_2_1[2n+1]
// 0x070000 ~
// 0x07ffff : Memory 'comb_3_0' (32768 * 16b)
//            Word n : bit [15: 0] - comb_3_0[2n]
//                     bit [31:16] - comb_3_0[2n+1]
// 0x080000 ~
// 0x08ffff : Memory 'comb_3_1' (32768 * 16b)
//            Word n : bit [15: 0] - comb_3_1[2n]
//                     bit [31:16] - comb_3_1[2n+1]
// 0x090000 ~
// 0x09ffff : Memory 'comb_4_0' (32768 * 16b)
//            Word n : bit [15: 0] - comb_4_0[2n]
//                     bit [31:16] - comb_4_0[2n+1]
// 0x0a0000 ~
// 0x0affff : Memory 'comb_4_1' (32768 * 16b)
//            Word n : bit [15: 0] - comb_4_1[2n]
//                     bit [31:16] - comb_4_1[2n+1]
// 0x0b0000 ~
// 0x0bffff : Memory 'comb_5_0' (32768 * 16b)
//            Word n : bit [15: 0] - comb_5_0[2n]
//                     bit [31:16] - comb_5_0[2n+1]
// 0x0c0000 ~
// 0x0cffff : Memory 'comb_5_1' (32768 * 16b)
//            Word n : bit [15: 0] - comb_5_1[2n]
//                     bit [31:16] - comb_5_1[2n+1]
// 0x0d0000 ~
// 0x0dffff : Memory 'comb_6_0' (32768 * 16b)
//            Word n : bit [15: 0] - comb_6_0[2n]
//                     bit [31:16] - comb_6_0[2n+1]
// 0x0e0000 ~
// 0x0effff : Memory 'comb_6_1' (32768 * 16b)
//            Word n : bit [15: 0] - comb_6_1[2n]
//                     bit [31:16] - comb_6_1[2n+1]
// 0x0f0000 ~
// 0x0fffff : Memory 'comb_7_0' (32768 * 16b)
//            Word n : bit [15: 0] - comb_7_0[2n]
//                     bit [31:16] - comb_7_0[2n+1]
// 0x100000 ~
// 0x10ffff : Memory 'comb_7_1' (32768 * 16b)
//            Word n : bit [15: 0] - comb_7_1[2n]
//                     bit [31:16] - comb_7_1[2n+1]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XDAC_TABLE_CONTROL_ADDR_AP_CTRL           0x000000
#define XDAC_TABLE_CONTROL_ADDR_GIE               0x000004
#define XDAC_TABLE_CONTROL_ADDR_IER               0x000008
#define XDAC_TABLE_CONTROL_ADDR_ISR               0x00000c
#define XDAC_TABLE_CONTROL_ADDR_LENGTH_R_DATA     0x110000
#define XDAC_TABLE_CONTROL_BITS_LENGTH_R_DATA     32
#define XDAC_TABLE_CONTROL_ADDR_TLAST_DATA        0x110008
#define XDAC_TABLE_CONTROL_BITS_TLAST_DATA        1
#define XDAC_TABLE_CONTROL_ADDR_TLAST_LENGTH_DATA 0x110010
#define XDAC_TABLE_CONTROL_BITS_TLAST_LENGTH_DATA 32
#define XDAC_TABLE_CONTROL_ADDR_COMB_0_0_BASE     0x010000
#define XDAC_TABLE_CONTROL_ADDR_COMB_0_0_HIGH     0x01ffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_0_0         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_0_0         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_0_1_BASE     0x020000
#define XDAC_TABLE_CONTROL_ADDR_COMB_0_1_HIGH     0x02ffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_0_1         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_0_1         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_1_0_BASE     0x030000
#define XDAC_TABLE_CONTROL_ADDR_COMB_1_0_HIGH     0x03ffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_1_0         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_1_0         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_1_1_BASE     0x040000
#define XDAC_TABLE_CONTROL_ADDR_COMB_1_1_HIGH     0x04ffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_1_1         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_1_1         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_2_0_BASE     0x050000
#define XDAC_TABLE_CONTROL_ADDR_COMB_2_0_HIGH     0x05ffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_2_0         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_2_0         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_2_1_BASE     0x060000
#define XDAC_TABLE_CONTROL_ADDR_COMB_2_1_HIGH     0x06ffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_2_1         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_2_1         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_3_0_BASE     0x070000
#define XDAC_TABLE_CONTROL_ADDR_COMB_3_0_HIGH     0x07ffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_3_0         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_3_0         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_3_1_BASE     0x080000
#define XDAC_TABLE_CONTROL_ADDR_COMB_3_1_HIGH     0x08ffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_3_1         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_3_1         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_4_0_BASE     0x090000
#define XDAC_TABLE_CONTROL_ADDR_COMB_4_0_HIGH     0x09ffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_4_0         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_4_0         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_4_1_BASE     0x0a0000
#define XDAC_TABLE_CONTROL_ADDR_COMB_4_1_HIGH     0x0affff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_4_1         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_4_1         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_5_0_BASE     0x0b0000
#define XDAC_TABLE_CONTROL_ADDR_COMB_5_0_HIGH     0x0bffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_5_0         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_5_0         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_5_1_BASE     0x0c0000
#define XDAC_TABLE_CONTROL_ADDR_COMB_5_1_HIGH     0x0cffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_5_1         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_5_1         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_6_0_BASE     0x0d0000
#define XDAC_TABLE_CONTROL_ADDR_COMB_6_0_HIGH     0x0dffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_6_0         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_6_0         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_6_1_BASE     0x0e0000
#define XDAC_TABLE_CONTROL_ADDR_COMB_6_1_HIGH     0x0effff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_6_1         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_6_1         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_7_0_BASE     0x0f0000
#define XDAC_TABLE_CONTROL_ADDR_COMB_7_0_HIGH     0x0fffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_7_0         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_7_0         32768
#define XDAC_TABLE_CONTROL_ADDR_COMB_7_1_BASE     0x100000
#define XDAC_TABLE_CONTROL_ADDR_COMB_7_1_HIGH     0x10ffff
#define XDAC_TABLE_CONTROL_WIDTH_COMB_7_1         16
#define XDAC_TABLE_CONTROL_DEPTH_COMB_7_1         32768

