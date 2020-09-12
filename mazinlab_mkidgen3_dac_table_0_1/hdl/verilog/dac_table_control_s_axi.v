// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module dac_table_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 21,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle,
    input  wire [14:0]                   comb_0_0_address0,
    input  wire                          comb_0_0_ce0,
    output wire [15:0]                   comb_0_0_q0,
    input  wire [14:0]                   comb_0_1_address0,
    input  wire                          comb_0_1_ce0,
    output wire [15:0]                   comb_0_1_q0,
    input  wire [14:0]                   comb_1_0_address0,
    input  wire                          comb_1_0_ce0,
    output wire [15:0]                   comb_1_0_q0,
    input  wire [14:0]                   comb_1_1_address0,
    input  wire                          comb_1_1_ce0,
    output wire [15:0]                   comb_1_1_q0,
    input  wire [14:0]                   comb_2_0_address0,
    input  wire                          comb_2_0_ce0,
    output wire [15:0]                   comb_2_0_q0,
    input  wire [14:0]                   comb_2_1_address0,
    input  wire                          comb_2_1_ce0,
    output wire [15:0]                   comb_2_1_q0,
    input  wire [14:0]                   comb_3_0_address0,
    input  wire                          comb_3_0_ce0,
    output wire [15:0]                   comb_3_0_q0,
    input  wire [14:0]                   comb_3_1_address0,
    input  wire                          comb_3_1_ce0,
    output wire [15:0]                   comb_3_1_q0,
    input  wire [14:0]                   comb_4_0_address0,
    input  wire                          comb_4_0_ce0,
    output wire [15:0]                   comb_4_0_q0,
    input  wire [14:0]                   comb_4_1_address0,
    input  wire                          comb_4_1_ce0,
    output wire [15:0]                   comb_4_1_q0,
    input  wire [14:0]                   comb_5_0_address0,
    input  wire                          comb_5_0_ce0,
    output wire [15:0]                   comb_5_0_q0,
    input  wire [14:0]                   comb_5_1_address0,
    input  wire                          comb_5_1_ce0,
    output wire [15:0]                   comb_5_1_q0,
    input  wire [14:0]                   comb_6_0_address0,
    input  wire                          comb_6_0_ce0,
    output wire [15:0]                   comb_6_0_q0,
    input  wire [14:0]                   comb_6_1_address0,
    input  wire                          comb_6_1_ce0,
    output wire [15:0]                   comb_6_1_q0,
    input  wire [14:0]                   comb_7_0_address0,
    input  wire                          comb_7_0_ce0,
    output wire [15:0]                   comb_7_0_q0,
    input  wire [14:0]                   comb_7_1_address0,
    input  wire                          comb_7_1_ce0,
    output wire [15:0]                   comb_7_1_q0,
    output wire [31:0]                   length_r,
    output wire [0:0]                    tlast,
    output wire [31:0]                   tlast_length
);
//------------------------Address Info-------------------
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL             = 21'h000000,
    ADDR_GIE                 = 21'h000004,
    ADDR_IER                 = 21'h000008,
    ADDR_ISR                 = 21'h00000c,
    ADDR_LENGTH_R_DATA_0     = 21'h110000,
    ADDR_LENGTH_R_CTRL       = 21'h110004,
    ADDR_TLAST_DATA_0        = 21'h110008,
    ADDR_TLAST_CTRL          = 21'h11000c,
    ADDR_TLAST_LENGTH_DATA_0 = 21'h110010,
    ADDR_TLAST_LENGTH_CTRL   = 21'h110014,
    ADDR_COMB_0_0_BASE       = 21'h010000,
    ADDR_COMB_0_0_HIGH       = 21'h01ffff,
    ADDR_COMB_0_1_BASE       = 21'h020000,
    ADDR_COMB_0_1_HIGH       = 21'h02ffff,
    ADDR_COMB_1_0_BASE       = 21'h030000,
    ADDR_COMB_1_0_HIGH       = 21'h03ffff,
    ADDR_COMB_1_1_BASE       = 21'h040000,
    ADDR_COMB_1_1_HIGH       = 21'h04ffff,
    ADDR_COMB_2_0_BASE       = 21'h050000,
    ADDR_COMB_2_0_HIGH       = 21'h05ffff,
    ADDR_COMB_2_1_BASE       = 21'h060000,
    ADDR_COMB_2_1_HIGH       = 21'h06ffff,
    ADDR_COMB_3_0_BASE       = 21'h070000,
    ADDR_COMB_3_0_HIGH       = 21'h07ffff,
    ADDR_COMB_3_1_BASE       = 21'h080000,
    ADDR_COMB_3_1_HIGH       = 21'h08ffff,
    ADDR_COMB_4_0_BASE       = 21'h090000,
    ADDR_COMB_4_0_HIGH       = 21'h09ffff,
    ADDR_COMB_4_1_BASE       = 21'h0a0000,
    ADDR_COMB_4_1_HIGH       = 21'h0affff,
    ADDR_COMB_5_0_BASE       = 21'h0b0000,
    ADDR_COMB_5_0_HIGH       = 21'h0bffff,
    ADDR_COMB_5_1_BASE       = 21'h0c0000,
    ADDR_COMB_5_1_HIGH       = 21'h0cffff,
    ADDR_COMB_6_0_BASE       = 21'h0d0000,
    ADDR_COMB_6_0_HIGH       = 21'h0dffff,
    ADDR_COMB_6_1_BASE       = 21'h0e0000,
    ADDR_COMB_6_1_HIGH       = 21'h0effff,
    ADDR_COMB_7_0_BASE       = 21'h0f0000,
    ADDR_COMB_7_0_HIGH       = 21'h0fffff,
    ADDR_COMB_7_1_BASE       = 21'h100000,
    ADDR_COMB_7_1_HIGH       = 21'h10ffff,
    WRIDLE                   = 2'd0,
    WRDATA                   = 2'd1,
    WRRESP                   = 2'd2,
    WRRESET                  = 2'd3,
    RDIDLE                   = 2'd0,
    RDDATA                   = 2'd1,
    RDRESET                  = 2'd2,
    ADDR_BITS         = 21;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [31:0]                   wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [31:0]                   rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready;
    reg                           int_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [31:0]                   int_length_r = 'b0;
    reg  [0:0]                    int_tlast = 'b0;
    reg  [31:0]                   int_tlast_length = 'b0;
    // memory signals
    wire [13:0]                   int_comb_0_0_address0;
    wire                          int_comb_0_0_ce0;
    wire                          int_comb_0_0_we0;
    wire [3:0]                    int_comb_0_0_be0;
    wire [31:0]                   int_comb_0_0_d0;
    wire [31:0]                   int_comb_0_0_q0;
    wire [13:0]                   int_comb_0_0_address1;
    wire                          int_comb_0_0_ce1;
    wire                          int_comb_0_0_we1;
    wire [3:0]                    int_comb_0_0_be1;
    wire [31:0]                   int_comb_0_0_d1;
    wire [31:0]                   int_comb_0_0_q1;
    reg                           int_comb_0_0_read;
    reg                           int_comb_0_0_write;
    reg  [0:0]                    int_comb_0_0_shift;
    wire [13:0]                   int_comb_0_1_address0;
    wire                          int_comb_0_1_ce0;
    wire                          int_comb_0_1_we0;
    wire [3:0]                    int_comb_0_1_be0;
    wire [31:0]                   int_comb_0_1_d0;
    wire [31:0]                   int_comb_0_1_q0;
    wire [13:0]                   int_comb_0_1_address1;
    wire                          int_comb_0_1_ce1;
    wire                          int_comb_0_1_we1;
    wire [3:0]                    int_comb_0_1_be1;
    wire [31:0]                   int_comb_0_1_d1;
    wire [31:0]                   int_comb_0_1_q1;
    reg                           int_comb_0_1_read;
    reg                           int_comb_0_1_write;
    reg  [0:0]                    int_comb_0_1_shift;
    wire [13:0]                   int_comb_1_0_address0;
    wire                          int_comb_1_0_ce0;
    wire                          int_comb_1_0_we0;
    wire [3:0]                    int_comb_1_0_be0;
    wire [31:0]                   int_comb_1_0_d0;
    wire [31:0]                   int_comb_1_0_q0;
    wire [13:0]                   int_comb_1_0_address1;
    wire                          int_comb_1_0_ce1;
    wire                          int_comb_1_0_we1;
    wire [3:0]                    int_comb_1_0_be1;
    wire [31:0]                   int_comb_1_0_d1;
    wire [31:0]                   int_comb_1_0_q1;
    reg                           int_comb_1_0_read;
    reg                           int_comb_1_0_write;
    reg  [0:0]                    int_comb_1_0_shift;
    wire [13:0]                   int_comb_1_1_address0;
    wire                          int_comb_1_1_ce0;
    wire                          int_comb_1_1_we0;
    wire [3:0]                    int_comb_1_1_be0;
    wire [31:0]                   int_comb_1_1_d0;
    wire [31:0]                   int_comb_1_1_q0;
    wire [13:0]                   int_comb_1_1_address1;
    wire                          int_comb_1_1_ce1;
    wire                          int_comb_1_1_we1;
    wire [3:0]                    int_comb_1_1_be1;
    wire [31:0]                   int_comb_1_1_d1;
    wire [31:0]                   int_comb_1_1_q1;
    reg                           int_comb_1_1_read;
    reg                           int_comb_1_1_write;
    reg  [0:0]                    int_comb_1_1_shift;
    wire [13:0]                   int_comb_2_0_address0;
    wire                          int_comb_2_0_ce0;
    wire                          int_comb_2_0_we0;
    wire [3:0]                    int_comb_2_0_be0;
    wire [31:0]                   int_comb_2_0_d0;
    wire [31:0]                   int_comb_2_0_q0;
    wire [13:0]                   int_comb_2_0_address1;
    wire                          int_comb_2_0_ce1;
    wire                          int_comb_2_0_we1;
    wire [3:0]                    int_comb_2_0_be1;
    wire [31:0]                   int_comb_2_0_d1;
    wire [31:0]                   int_comb_2_0_q1;
    reg                           int_comb_2_0_read;
    reg                           int_comb_2_0_write;
    reg  [0:0]                    int_comb_2_0_shift;
    wire [13:0]                   int_comb_2_1_address0;
    wire                          int_comb_2_1_ce0;
    wire                          int_comb_2_1_we0;
    wire [3:0]                    int_comb_2_1_be0;
    wire [31:0]                   int_comb_2_1_d0;
    wire [31:0]                   int_comb_2_1_q0;
    wire [13:0]                   int_comb_2_1_address1;
    wire                          int_comb_2_1_ce1;
    wire                          int_comb_2_1_we1;
    wire [3:0]                    int_comb_2_1_be1;
    wire [31:0]                   int_comb_2_1_d1;
    wire [31:0]                   int_comb_2_1_q1;
    reg                           int_comb_2_1_read;
    reg                           int_comb_2_1_write;
    reg  [0:0]                    int_comb_2_1_shift;
    wire [13:0]                   int_comb_3_0_address0;
    wire                          int_comb_3_0_ce0;
    wire                          int_comb_3_0_we0;
    wire [3:0]                    int_comb_3_0_be0;
    wire [31:0]                   int_comb_3_0_d0;
    wire [31:0]                   int_comb_3_0_q0;
    wire [13:0]                   int_comb_3_0_address1;
    wire                          int_comb_3_0_ce1;
    wire                          int_comb_3_0_we1;
    wire [3:0]                    int_comb_3_0_be1;
    wire [31:0]                   int_comb_3_0_d1;
    wire [31:0]                   int_comb_3_0_q1;
    reg                           int_comb_3_0_read;
    reg                           int_comb_3_0_write;
    reg  [0:0]                    int_comb_3_0_shift;
    wire [13:0]                   int_comb_3_1_address0;
    wire                          int_comb_3_1_ce0;
    wire                          int_comb_3_1_we0;
    wire [3:0]                    int_comb_3_1_be0;
    wire [31:0]                   int_comb_3_1_d0;
    wire [31:0]                   int_comb_3_1_q0;
    wire [13:0]                   int_comb_3_1_address1;
    wire                          int_comb_3_1_ce1;
    wire                          int_comb_3_1_we1;
    wire [3:0]                    int_comb_3_1_be1;
    wire [31:0]                   int_comb_3_1_d1;
    wire [31:0]                   int_comb_3_1_q1;
    reg                           int_comb_3_1_read;
    reg                           int_comb_3_1_write;
    reg  [0:0]                    int_comb_3_1_shift;
    wire [13:0]                   int_comb_4_0_address0;
    wire                          int_comb_4_0_ce0;
    wire                          int_comb_4_0_we0;
    wire [3:0]                    int_comb_4_0_be0;
    wire [31:0]                   int_comb_4_0_d0;
    wire [31:0]                   int_comb_4_0_q0;
    wire [13:0]                   int_comb_4_0_address1;
    wire                          int_comb_4_0_ce1;
    wire                          int_comb_4_0_we1;
    wire [3:0]                    int_comb_4_0_be1;
    wire [31:0]                   int_comb_4_0_d1;
    wire [31:0]                   int_comb_4_0_q1;
    reg                           int_comb_4_0_read;
    reg                           int_comb_4_0_write;
    reg  [0:0]                    int_comb_4_0_shift;
    wire [13:0]                   int_comb_4_1_address0;
    wire                          int_comb_4_1_ce0;
    wire                          int_comb_4_1_we0;
    wire [3:0]                    int_comb_4_1_be0;
    wire [31:0]                   int_comb_4_1_d0;
    wire [31:0]                   int_comb_4_1_q0;
    wire [13:0]                   int_comb_4_1_address1;
    wire                          int_comb_4_1_ce1;
    wire                          int_comb_4_1_we1;
    wire [3:0]                    int_comb_4_1_be1;
    wire [31:0]                   int_comb_4_1_d1;
    wire [31:0]                   int_comb_4_1_q1;
    reg                           int_comb_4_1_read;
    reg                           int_comb_4_1_write;
    reg  [0:0]                    int_comb_4_1_shift;
    wire [13:0]                   int_comb_5_0_address0;
    wire                          int_comb_5_0_ce0;
    wire                          int_comb_5_0_we0;
    wire [3:0]                    int_comb_5_0_be0;
    wire [31:0]                   int_comb_5_0_d0;
    wire [31:0]                   int_comb_5_0_q0;
    wire [13:0]                   int_comb_5_0_address1;
    wire                          int_comb_5_0_ce1;
    wire                          int_comb_5_0_we1;
    wire [3:0]                    int_comb_5_0_be1;
    wire [31:0]                   int_comb_5_0_d1;
    wire [31:0]                   int_comb_5_0_q1;
    reg                           int_comb_5_0_read;
    reg                           int_comb_5_0_write;
    reg  [0:0]                    int_comb_5_0_shift;
    wire [13:0]                   int_comb_5_1_address0;
    wire                          int_comb_5_1_ce0;
    wire                          int_comb_5_1_we0;
    wire [3:0]                    int_comb_5_1_be0;
    wire [31:0]                   int_comb_5_1_d0;
    wire [31:0]                   int_comb_5_1_q0;
    wire [13:0]                   int_comb_5_1_address1;
    wire                          int_comb_5_1_ce1;
    wire                          int_comb_5_1_we1;
    wire [3:0]                    int_comb_5_1_be1;
    wire [31:0]                   int_comb_5_1_d1;
    wire [31:0]                   int_comb_5_1_q1;
    reg                           int_comb_5_1_read;
    reg                           int_comb_5_1_write;
    reg  [0:0]                    int_comb_5_1_shift;
    wire [13:0]                   int_comb_6_0_address0;
    wire                          int_comb_6_0_ce0;
    wire                          int_comb_6_0_we0;
    wire [3:0]                    int_comb_6_0_be0;
    wire [31:0]                   int_comb_6_0_d0;
    wire [31:0]                   int_comb_6_0_q0;
    wire [13:0]                   int_comb_6_0_address1;
    wire                          int_comb_6_0_ce1;
    wire                          int_comb_6_0_we1;
    wire [3:0]                    int_comb_6_0_be1;
    wire [31:0]                   int_comb_6_0_d1;
    wire [31:0]                   int_comb_6_0_q1;
    reg                           int_comb_6_0_read;
    reg                           int_comb_6_0_write;
    reg  [0:0]                    int_comb_6_0_shift;
    wire [13:0]                   int_comb_6_1_address0;
    wire                          int_comb_6_1_ce0;
    wire                          int_comb_6_1_we0;
    wire [3:0]                    int_comb_6_1_be0;
    wire [31:0]                   int_comb_6_1_d0;
    wire [31:0]                   int_comb_6_1_q0;
    wire [13:0]                   int_comb_6_1_address1;
    wire                          int_comb_6_1_ce1;
    wire                          int_comb_6_1_we1;
    wire [3:0]                    int_comb_6_1_be1;
    wire [31:0]                   int_comb_6_1_d1;
    wire [31:0]                   int_comb_6_1_q1;
    reg                           int_comb_6_1_read;
    reg                           int_comb_6_1_write;
    reg  [0:0]                    int_comb_6_1_shift;
    wire [13:0]                   int_comb_7_0_address0;
    wire                          int_comb_7_0_ce0;
    wire                          int_comb_7_0_we0;
    wire [3:0]                    int_comb_7_0_be0;
    wire [31:0]                   int_comb_7_0_d0;
    wire [31:0]                   int_comb_7_0_q0;
    wire [13:0]                   int_comb_7_0_address1;
    wire                          int_comb_7_0_ce1;
    wire                          int_comb_7_0_we1;
    wire [3:0]                    int_comb_7_0_be1;
    wire [31:0]                   int_comb_7_0_d1;
    wire [31:0]                   int_comb_7_0_q1;
    reg                           int_comb_7_0_read;
    reg                           int_comb_7_0_write;
    reg  [0:0]                    int_comb_7_0_shift;
    wire [13:0]                   int_comb_7_1_address0;
    wire                          int_comb_7_1_ce0;
    wire                          int_comb_7_1_we0;
    wire [3:0]                    int_comb_7_1_be0;
    wire [31:0]                   int_comb_7_1_d0;
    wire [31:0]                   int_comb_7_1_q0;
    wire [13:0]                   int_comb_7_1_address1;
    wire                          int_comb_7_1_ce1;
    wire                          int_comb_7_1_we1;
    wire [3:0]                    int_comb_7_1_be1;
    wire [31:0]                   int_comb_7_1_d1;
    wire [31:0]                   int_comb_7_1_q1;
    reg                           int_comb_7_1_read;
    reg                           int_comb_7_1_write;
    reg  [0:0]                    int_comb_7_1_shift;

//------------------------Instantiation------------------
// int_comb_0_0
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_0_0 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_0_0_address0 ),
    .ce0      ( int_comb_0_0_ce0 ),
    .we0      ( int_comb_0_0_we0 ),
    .be0      ( int_comb_0_0_be0 ),
    .d0       ( int_comb_0_0_d0 ),
    .q0       ( int_comb_0_0_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_0_0_address1 ),
    .ce1      ( int_comb_0_0_ce1 ),
    .we1      ( int_comb_0_0_we1 ),
    .be1      ( int_comb_0_0_be1 ),
    .d1       ( int_comb_0_0_d1 ),
    .q1       ( int_comb_0_0_q1 )
);
// int_comb_0_1
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_0_1 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_0_1_address0 ),
    .ce0      ( int_comb_0_1_ce0 ),
    .we0      ( int_comb_0_1_we0 ),
    .be0      ( int_comb_0_1_be0 ),
    .d0       ( int_comb_0_1_d0 ),
    .q0       ( int_comb_0_1_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_0_1_address1 ),
    .ce1      ( int_comb_0_1_ce1 ),
    .we1      ( int_comb_0_1_we1 ),
    .be1      ( int_comb_0_1_be1 ),
    .d1       ( int_comb_0_1_d1 ),
    .q1       ( int_comb_0_1_q1 )
);
// int_comb_1_0
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_1_0 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_1_0_address0 ),
    .ce0      ( int_comb_1_0_ce0 ),
    .we0      ( int_comb_1_0_we0 ),
    .be0      ( int_comb_1_0_be0 ),
    .d0       ( int_comb_1_0_d0 ),
    .q0       ( int_comb_1_0_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_1_0_address1 ),
    .ce1      ( int_comb_1_0_ce1 ),
    .we1      ( int_comb_1_0_we1 ),
    .be1      ( int_comb_1_0_be1 ),
    .d1       ( int_comb_1_0_d1 ),
    .q1       ( int_comb_1_0_q1 )
);
// int_comb_1_1
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_1_1 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_1_1_address0 ),
    .ce0      ( int_comb_1_1_ce0 ),
    .we0      ( int_comb_1_1_we0 ),
    .be0      ( int_comb_1_1_be0 ),
    .d0       ( int_comb_1_1_d0 ),
    .q0       ( int_comb_1_1_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_1_1_address1 ),
    .ce1      ( int_comb_1_1_ce1 ),
    .we1      ( int_comb_1_1_we1 ),
    .be1      ( int_comb_1_1_be1 ),
    .d1       ( int_comb_1_1_d1 ),
    .q1       ( int_comb_1_1_q1 )
);
// int_comb_2_0
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_2_0 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_2_0_address0 ),
    .ce0      ( int_comb_2_0_ce0 ),
    .we0      ( int_comb_2_0_we0 ),
    .be0      ( int_comb_2_0_be0 ),
    .d0       ( int_comb_2_0_d0 ),
    .q0       ( int_comb_2_0_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_2_0_address1 ),
    .ce1      ( int_comb_2_0_ce1 ),
    .we1      ( int_comb_2_0_we1 ),
    .be1      ( int_comb_2_0_be1 ),
    .d1       ( int_comb_2_0_d1 ),
    .q1       ( int_comb_2_0_q1 )
);
// int_comb_2_1
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_2_1 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_2_1_address0 ),
    .ce0      ( int_comb_2_1_ce0 ),
    .we0      ( int_comb_2_1_we0 ),
    .be0      ( int_comb_2_1_be0 ),
    .d0       ( int_comb_2_1_d0 ),
    .q0       ( int_comb_2_1_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_2_1_address1 ),
    .ce1      ( int_comb_2_1_ce1 ),
    .we1      ( int_comb_2_1_we1 ),
    .be1      ( int_comb_2_1_be1 ),
    .d1       ( int_comb_2_1_d1 ),
    .q1       ( int_comb_2_1_q1 )
);
// int_comb_3_0
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_3_0 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_3_0_address0 ),
    .ce0      ( int_comb_3_0_ce0 ),
    .we0      ( int_comb_3_0_we0 ),
    .be0      ( int_comb_3_0_be0 ),
    .d0       ( int_comb_3_0_d0 ),
    .q0       ( int_comb_3_0_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_3_0_address1 ),
    .ce1      ( int_comb_3_0_ce1 ),
    .we1      ( int_comb_3_0_we1 ),
    .be1      ( int_comb_3_0_be1 ),
    .d1       ( int_comb_3_0_d1 ),
    .q1       ( int_comb_3_0_q1 )
);
// int_comb_3_1
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_3_1 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_3_1_address0 ),
    .ce0      ( int_comb_3_1_ce0 ),
    .we0      ( int_comb_3_1_we0 ),
    .be0      ( int_comb_3_1_be0 ),
    .d0       ( int_comb_3_1_d0 ),
    .q0       ( int_comb_3_1_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_3_1_address1 ),
    .ce1      ( int_comb_3_1_ce1 ),
    .we1      ( int_comb_3_1_we1 ),
    .be1      ( int_comb_3_1_be1 ),
    .d1       ( int_comb_3_1_d1 ),
    .q1       ( int_comb_3_1_q1 )
);
// int_comb_4_0
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_4_0 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_4_0_address0 ),
    .ce0      ( int_comb_4_0_ce0 ),
    .we0      ( int_comb_4_0_we0 ),
    .be0      ( int_comb_4_0_be0 ),
    .d0       ( int_comb_4_0_d0 ),
    .q0       ( int_comb_4_0_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_4_0_address1 ),
    .ce1      ( int_comb_4_0_ce1 ),
    .we1      ( int_comb_4_0_we1 ),
    .be1      ( int_comb_4_0_be1 ),
    .d1       ( int_comb_4_0_d1 ),
    .q1       ( int_comb_4_0_q1 )
);
// int_comb_4_1
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_4_1 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_4_1_address0 ),
    .ce0      ( int_comb_4_1_ce0 ),
    .we0      ( int_comb_4_1_we0 ),
    .be0      ( int_comb_4_1_be0 ),
    .d0       ( int_comb_4_1_d0 ),
    .q0       ( int_comb_4_1_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_4_1_address1 ),
    .ce1      ( int_comb_4_1_ce1 ),
    .we1      ( int_comb_4_1_we1 ),
    .be1      ( int_comb_4_1_be1 ),
    .d1       ( int_comb_4_1_d1 ),
    .q1       ( int_comb_4_1_q1 )
);
// int_comb_5_0
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_5_0 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_5_0_address0 ),
    .ce0      ( int_comb_5_0_ce0 ),
    .we0      ( int_comb_5_0_we0 ),
    .be0      ( int_comb_5_0_be0 ),
    .d0       ( int_comb_5_0_d0 ),
    .q0       ( int_comb_5_0_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_5_0_address1 ),
    .ce1      ( int_comb_5_0_ce1 ),
    .we1      ( int_comb_5_0_we1 ),
    .be1      ( int_comb_5_0_be1 ),
    .d1       ( int_comb_5_0_d1 ),
    .q1       ( int_comb_5_0_q1 )
);
// int_comb_5_1
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_5_1 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_5_1_address0 ),
    .ce0      ( int_comb_5_1_ce0 ),
    .we0      ( int_comb_5_1_we0 ),
    .be0      ( int_comb_5_1_be0 ),
    .d0       ( int_comb_5_1_d0 ),
    .q0       ( int_comb_5_1_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_5_1_address1 ),
    .ce1      ( int_comb_5_1_ce1 ),
    .we1      ( int_comb_5_1_we1 ),
    .be1      ( int_comb_5_1_be1 ),
    .d1       ( int_comb_5_1_d1 ),
    .q1       ( int_comb_5_1_q1 )
);
// int_comb_6_0
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_6_0 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_6_0_address0 ),
    .ce0      ( int_comb_6_0_ce0 ),
    .we0      ( int_comb_6_0_we0 ),
    .be0      ( int_comb_6_0_be0 ),
    .d0       ( int_comb_6_0_d0 ),
    .q0       ( int_comb_6_0_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_6_0_address1 ),
    .ce1      ( int_comb_6_0_ce1 ),
    .we1      ( int_comb_6_0_we1 ),
    .be1      ( int_comb_6_0_be1 ),
    .d1       ( int_comb_6_0_d1 ),
    .q1       ( int_comb_6_0_q1 )
);
// int_comb_6_1
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_6_1 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_6_1_address0 ),
    .ce0      ( int_comb_6_1_ce0 ),
    .we0      ( int_comb_6_1_we0 ),
    .be0      ( int_comb_6_1_be0 ),
    .d0       ( int_comb_6_1_d0 ),
    .q0       ( int_comb_6_1_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_6_1_address1 ),
    .ce1      ( int_comb_6_1_ce1 ),
    .we1      ( int_comb_6_1_we1 ),
    .be1      ( int_comb_6_1_be1 ),
    .d1       ( int_comb_6_1_d1 ),
    .q1       ( int_comb_6_1_q1 )
);
// int_comb_7_0
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_7_0 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_7_0_address0 ),
    .ce0      ( int_comb_7_0_ce0 ),
    .we0      ( int_comb_7_0_we0 ),
    .be0      ( int_comb_7_0_be0 ),
    .d0       ( int_comb_7_0_d0 ),
    .q0       ( int_comb_7_0_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_7_0_address1 ),
    .ce1      ( int_comb_7_0_ce1 ),
    .we1      ( int_comb_7_0_we1 ),
    .be1      ( int_comb_7_0_be1 ),
    .d1       ( int_comb_7_0_d1 ),
    .q1       ( int_comb_7_0_q1 )
);
// int_comb_7_1
dac_table_control_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 16384 )
) int_comb_7_1 (
    .clk0     ( ACLK ),
    .address0 ( int_comb_7_1_address0 ),
    .ce0      ( int_comb_7_1_ce0 ),
    .we0      ( int_comb_7_1_we0 ),
    .be0      ( int_comb_7_1_be0 ),
    .d0       ( int_comb_7_1_d0 ),
    .q0       ( int_comb_7_1_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_comb_7_1_address1 ),
    .ce1      ( int_comb_7_1_ce1 ),
    .we1      ( int_comb_7_1_we1 ),
    .be1      ( int_comb_7_1_be1 ),
    .d1       ( int_comb_7_1_d1 ),
    .q1       ( int_comb_7_1_q1 )
);

//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA) & !int_comb_0_0_read & !int_comb_0_1_read & !int_comb_1_0_read & !int_comb_1_1_read & !int_comb_2_0_read & !int_comb_2_1_read & !int_comb_3_0_read & !int_comb_3_1_read & !int_comb_4_0_read & !int_comb_4_1_read & !int_comb_5_0_read & !int_comb_5_1_read & !int_comb_6_0_read & !int_comb_6_1_read & !int_comb_7_0_read & !int_comb_7_1_read;
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 1'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_LENGTH_R_DATA_0: begin
                    rdata <= int_length_r[31:0];
                end
                ADDR_TLAST_DATA_0: begin
                    rdata <= int_tlast[0:0];
                end
                ADDR_TLAST_LENGTH_DATA_0: begin
                    rdata <= int_tlast_length[31:0];
                end
            endcase
        end
        else if (int_comb_0_0_read) begin
            rdata <= int_comb_0_0_q1;
        end
        else if (int_comb_0_1_read) begin
            rdata <= int_comb_0_1_q1;
        end
        else if (int_comb_1_0_read) begin
            rdata <= int_comb_1_0_q1;
        end
        else if (int_comb_1_1_read) begin
            rdata <= int_comb_1_1_q1;
        end
        else if (int_comb_2_0_read) begin
            rdata <= int_comb_2_0_q1;
        end
        else if (int_comb_2_1_read) begin
            rdata <= int_comb_2_1_q1;
        end
        else if (int_comb_3_0_read) begin
            rdata <= int_comb_3_0_q1;
        end
        else if (int_comb_3_1_read) begin
            rdata <= int_comb_3_1_q1;
        end
        else if (int_comb_4_0_read) begin
            rdata <= int_comb_4_0_q1;
        end
        else if (int_comb_4_1_read) begin
            rdata <= int_comb_4_1_q1;
        end
        else if (int_comb_5_0_read) begin
            rdata <= int_comb_5_0_q1;
        end
        else if (int_comb_5_1_read) begin
            rdata <= int_comb_5_1_q1;
        end
        else if (int_comb_6_0_read) begin
            rdata <= int_comb_6_0_q1;
        end
        else if (int_comb_6_1_read) begin
            rdata <= int_comb_6_1_q1;
        end
        else if (int_comb_7_0_read) begin
            rdata <= int_comb_7_0_q1;
        end
        else if (int_comb_7_1_read) begin
            rdata <= int_comb_7_1_q1;
        end
    end
end


//------------------------Register logic-----------------
assign interrupt    = int_gie & (|int_isr);
assign ap_start     = int_ap_start;
assign length_r     = int_length_r;
assign tlast        = int_tlast;
assign tlast_length = int_tlast_length;
// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (ap_done)
            int_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_ready <= ap_ready;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_length_r[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_length_r[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LENGTH_R_DATA_0)
            int_length_r[31:0] <= (WDATA[31:0] & wmask) | (int_length_r[31:0] & ~wmask);
    end
end

// int_tlast[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_tlast[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TLAST_DATA_0)
            int_tlast[0:0] <= (WDATA[31:0] & wmask) | (int_tlast[0:0] & ~wmask);
    end
end

// int_tlast_length[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_tlast_length[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TLAST_LENGTH_DATA_0)
            int_tlast_length[31:0] <= (WDATA[31:0] & wmask) | (int_tlast_length[31:0] & ~wmask);
    end
end


//------------------------Memory logic-------------------
// comb_0_0
assign int_comb_0_0_address0 = comb_0_0_address0 >> 1;
assign int_comb_0_0_ce0      = comb_0_0_ce0;
assign int_comb_0_0_we0      = 1'b0;
assign int_comb_0_0_be0      = 1'b0;
assign int_comb_0_0_d0       = 1'b0;
assign comb_0_0_q0           = int_comb_0_0_q0 >> (int_comb_0_0_shift * 16);
assign int_comb_0_0_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_0_0_ce1      = ar_hs | (int_comb_0_0_write & WVALID);
assign int_comb_0_0_we1      = int_comb_0_0_write & WVALID;
assign int_comb_0_0_be1      = WSTRB;
assign int_comb_0_0_d1       = WDATA;
// comb_0_1
assign int_comb_0_1_address0 = comb_0_1_address0 >> 1;
assign int_comb_0_1_ce0      = comb_0_1_ce0;
assign int_comb_0_1_we0      = 1'b0;
assign int_comb_0_1_be0      = 1'b0;
assign int_comb_0_1_d0       = 1'b0;
assign comb_0_1_q0           = int_comb_0_1_q0 >> (int_comb_0_1_shift * 16);
assign int_comb_0_1_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_0_1_ce1      = ar_hs | (int_comb_0_1_write & WVALID);
assign int_comb_0_1_we1      = int_comb_0_1_write & WVALID;
assign int_comb_0_1_be1      = WSTRB;
assign int_comb_0_1_d1       = WDATA;
// comb_1_0
assign int_comb_1_0_address0 = comb_1_0_address0 >> 1;
assign int_comb_1_0_ce0      = comb_1_0_ce0;
assign int_comb_1_0_we0      = 1'b0;
assign int_comb_1_0_be0      = 1'b0;
assign int_comb_1_0_d0       = 1'b0;
assign comb_1_0_q0           = int_comb_1_0_q0 >> (int_comb_1_0_shift * 16);
assign int_comb_1_0_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_1_0_ce1      = ar_hs | (int_comb_1_0_write & WVALID);
assign int_comb_1_0_we1      = int_comb_1_0_write & WVALID;
assign int_comb_1_0_be1      = WSTRB;
assign int_comb_1_0_d1       = WDATA;
// comb_1_1
assign int_comb_1_1_address0 = comb_1_1_address0 >> 1;
assign int_comb_1_1_ce0      = comb_1_1_ce0;
assign int_comb_1_1_we0      = 1'b0;
assign int_comb_1_1_be0      = 1'b0;
assign int_comb_1_1_d0       = 1'b0;
assign comb_1_1_q0           = int_comb_1_1_q0 >> (int_comb_1_1_shift * 16);
assign int_comb_1_1_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_1_1_ce1      = ar_hs | (int_comb_1_1_write & WVALID);
assign int_comb_1_1_we1      = int_comb_1_1_write & WVALID;
assign int_comb_1_1_be1      = WSTRB;
assign int_comb_1_1_d1       = WDATA;
// comb_2_0
assign int_comb_2_0_address0 = comb_2_0_address0 >> 1;
assign int_comb_2_0_ce0      = comb_2_0_ce0;
assign int_comb_2_0_we0      = 1'b0;
assign int_comb_2_0_be0      = 1'b0;
assign int_comb_2_0_d0       = 1'b0;
assign comb_2_0_q0           = int_comb_2_0_q0 >> (int_comb_2_0_shift * 16);
assign int_comb_2_0_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_2_0_ce1      = ar_hs | (int_comb_2_0_write & WVALID);
assign int_comb_2_0_we1      = int_comb_2_0_write & WVALID;
assign int_comb_2_0_be1      = WSTRB;
assign int_comb_2_0_d1       = WDATA;
// comb_2_1
assign int_comb_2_1_address0 = comb_2_1_address0 >> 1;
assign int_comb_2_1_ce0      = comb_2_1_ce0;
assign int_comb_2_1_we0      = 1'b0;
assign int_comb_2_1_be0      = 1'b0;
assign int_comb_2_1_d0       = 1'b0;
assign comb_2_1_q0           = int_comb_2_1_q0 >> (int_comb_2_1_shift * 16);
assign int_comb_2_1_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_2_1_ce1      = ar_hs | (int_comb_2_1_write & WVALID);
assign int_comb_2_1_we1      = int_comb_2_1_write & WVALID;
assign int_comb_2_1_be1      = WSTRB;
assign int_comb_2_1_d1       = WDATA;
// comb_3_0
assign int_comb_3_0_address0 = comb_3_0_address0 >> 1;
assign int_comb_3_0_ce0      = comb_3_0_ce0;
assign int_comb_3_0_we0      = 1'b0;
assign int_comb_3_0_be0      = 1'b0;
assign int_comb_3_0_d0       = 1'b0;
assign comb_3_0_q0           = int_comb_3_0_q0 >> (int_comb_3_0_shift * 16);
assign int_comb_3_0_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_3_0_ce1      = ar_hs | (int_comb_3_0_write & WVALID);
assign int_comb_3_0_we1      = int_comb_3_0_write & WVALID;
assign int_comb_3_0_be1      = WSTRB;
assign int_comb_3_0_d1       = WDATA;
// comb_3_1
assign int_comb_3_1_address0 = comb_3_1_address0 >> 1;
assign int_comb_3_1_ce0      = comb_3_1_ce0;
assign int_comb_3_1_we0      = 1'b0;
assign int_comb_3_1_be0      = 1'b0;
assign int_comb_3_1_d0       = 1'b0;
assign comb_3_1_q0           = int_comb_3_1_q0 >> (int_comb_3_1_shift * 16);
assign int_comb_3_1_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_3_1_ce1      = ar_hs | (int_comb_3_1_write & WVALID);
assign int_comb_3_1_we1      = int_comb_3_1_write & WVALID;
assign int_comb_3_1_be1      = WSTRB;
assign int_comb_3_1_d1       = WDATA;
// comb_4_0
assign int_comb_4_0_address0 = comb_4_0_address0 >> 1;
assign int_comb_4_0_ce0      = comb_4_0_ce0;
assign int_comb_4_0_we0      = 1'b0;
assign int_comb_4_0_be0      = 1'b0;
assign int_comb_4_0_d0       = 1'b0;
assign comb_4_0_q0           = int_comb_4_0_q0 >> (int_comb_4_0_shift * 16);
assign int_comb_4_0_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_4_0_ce1      = ar_hs | (int_comb_4_0_write & WVALID);
assign int_comb_4_0_we1      = int_comb_4_0_write & WVALID;
assign int_comb_4_0_be1      = WSTRB;
assign int_comb_4_0_d1       = WDATA;
// comb_4_1
assign int_comb_4_1_address0 = comb_4_1_address0 >> 1;
assign int_comb_4_1_ce0      = comb_4_1_ce0;
assign int_comb_4_1_we0      = 1'b0;
assign int_comb_4_1_be0      = 1'b0;
assign int_comb_4_1_d0       = 1'b0;
assign comb_4_1_q0           = int_comb_4_1_q0 >> (int_comb_4_1_shift * 16);
assign int_comb_4_1_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_4_1_ce1      = ar_hs | (int_comb_4_1_write & WVALID);
assign int_comb_4_1_we1      = int_comb_4_1_write & WVALID;
assign int_comb_4_1_be1      = WSTRB;
assign int_comb_4_1_d1       = WDATA;
// comb_5_0
assign int_comb_5_0_address0 = comb_5_0_address0 >> 1;
assign int_comb_5_0_ce0      = comb_5_0_ce0;
assign int_comb_5_0_we0      = 1'b0;
assign int_comb_5_0_be0      = 1'b0;
assign int_comb_5_0_d0       = 1'b0;
assign comb_5_0_q0           = int_comb_5_0_q0 >> (int_comb_5_0_shift * 16);
assign int_comb_5_0_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_5_0_ce1      = ar_hs | (int_comb_5_0_write & WVALID);
assign int_comb_5_0_we1      = int_comb_5_0_write & WVALID;
assign int_comb_5_0_be1      = WSTRB;
assign int_comb_5_0_d1       = WDATA;
// comb_5_1
assign int_comb_5_1_address0 = comb_5_1_address0 >> 1;
assign int_comb_5_1_ce0      = comb_5_1_ce0;
assign int_comb_5_1_we0      = 1'b0;
assign int_comb_5_1_be0      = 1'b0;
assign int_comb_5_1_d0       = 1'b0;
assign comb_5_1_q0           = int_comb_5_1_q0 >> (int_comb_5_1_shift * 16);
assign int_comb_5_1_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_5_1_ce1      = ar_hs | (int_comb_5_1_write & WVALID);
assign int_comb_5_1_we1      = int_comb_5_1_write & WVALID;
assign int_comb_5_1_be1      = WSTRB;
assign int_comb_5_1_d1       = WDATA;
// comb_6_0
assign int_comb_6_0_address0 = comb_6_0_address0 >> 1;
assign int_comb_6_0_ce0      = comb_6_0_ce0;
assign int_comb_6_0_we0      = 1'b0;
assign int_comb_6_0_be0      = 1'b0;
assign int_comb_6_0_d0       = 1'b0;
assign comb_6_0_q0           = int_comb_6_0_q0 >> (int_comb_6_0_shift * 16);
assign int_comb_6_0_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_6_0_ce1      = ar_hs | (int_comb_6_0_write & WVALID);
assign int_comb_6_0_we1      = int_comb_6_0_write & WVALID;
assign int_comb_6_0_be1      = WSTRB;
assign int_comb_6_0_d1       = WDATA;
// comb_6_1
assign int_comb_6_1_address0 = comb_6_1_address0 >> 1;
assign int_comb_6_1_ce0      = comb_6_1_ce0;
assign int_comb_6_1_we0      = 1'b0;
assign int_comb_6_1_be0      = 1'b0;
assign int_comb_6_1_d0       = 1'b0;
assign comb_6_1_q0           = int_comb_6_1_q0 >> (int_comb_6_1_shift * 16);
assign int_comb_6_1_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_6_1_ce1      = ar_hs | (int_comb_6_1_write & WVALID);
assign int_comb_6_1_we1      = int_comb_6_1_write & WVALID;
assign int_comb_6_1_be1      = WSTRB;
assign int_comb_6_1_d1       = WDATA;
// comb_7_0
assign int_comb_7_0_address0 = comb_7_0_address0 >> 1;
assign int_comb_7_0_ce0      = comb_7_0_ce0;
assign int_comb_7_0_we0      = 1'b0;
assign int_comb_7_0_be0      = 1'b0;
assign int_comb_7_0_d0       = 1'b0;
assign comb_7_0_q0           = int_comb_7_0_q0 >> (int_comb_7_0_shift * 16);
assign int_comb_7_0_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_7_0_ce1      = ar_hs | (int_comb_7_0_write & WVALID);
assign int_comb_7_0_we1      = int_comb_7_0_write & WVALID;
assign int_comb_7_0_be1      = WSTRB;
assign int_comb_7_0_d1       = WDATA;
// comb_7_1
assign int_comb_7_1_address0 = comb_7_1_address0 >> 1;
assign int_comb_7_1_ce0      = comb_7_1_ce0;
assign int_comb_7_1_we0      = 1'b0;
assign int_comb_7_1_be0      = 1'b0;
assign int_comb_7_1_d0       = 1'b0;
assign comb_7_1_q0           = int_comb_7_1_q0 >> (int_comb_7_1_shift * 16);
assign int_comb_7_1_address1 = ar_hs? raddr[15:2] : waddr[15:2];
assign int_comb_7_1_ce1      = ar_hs | (int_comb_7_1_write & WVALID);
assign int_comb_7_1_we1      = int_comb_7_1_write & WVALID;
assign int_comb_7_1_be1      = WSTRB;
assign int_comb_7_1_d1       = WDATA;
// int_comb_0_0_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_0_0_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_0_0_BASE && raddr <= ADDR_COMB_0_0_HIGH)
            int_comb_0_0_read <= 1'b1;
        else
            int_comb_0_0_read <= 1'b0;
    end
end

// int_comb_0_0_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_0_0_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_0_0_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_0_0_HIGH)
            int_comb_0_0_write <= 1'b1;
        else if (WVALID)
            int_comb_0_0_write <= 1'b0;
    end
end

// int_comb_0_0_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_0_0_ce0)
            int_comb_0_0_shift <= comb_0_0_address0[0];
    end
end

// int_comb_0_1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_0_1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_0_1_BASE && raddr <= ADDR_COMB_0_1_HIGH)
            int_comb_0_1_read <= 1'b1;
        else
            int_comb_0_1_read <= 1'b0;
    end
end

// int_comb_0_1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_0_1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_0_1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_0_1_HIGH)
            int_comb_0_1_write <= 1'b1;
        else if (WVALID)
            int_comb_0_1_write <= 1'b0;
    end
end

// int_comb_0_1_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_0_1_ce0)
            int_comb_0_1_shift <= comb_0_1_address0[0];
    end
end

// int_comb_1_0_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_1_0_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_1_0_BASE && raddr <= ADDR_COMB_1_0_HIGH)
            int_comb_1_0_read <= 1'b1;
        else
            int_comb_1_0_read <= 1'b0;
    end
end

// int_comb_1_0_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_1_0_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_1_0_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_1_0_HIGH)
            int_comb_1_0_write <= 1'b1;
        else if (WVALID)
            int_comb_1_0_write <= 1'b0;
    end
end

// int_comb_1_0_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_1_0_ce0)
            int_comb_1_0_shift <= comb_1_0_address0[0];
    end
end

// int_comb_1_1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_1_1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_1_1_BASE && raddr <= ADDR_COMB_1_1_HIGH)
            int_comb_1_1_read <= 1'b1;
        else
            int_comb_1_1_read <= 1'b0;
    end
end

// int_comb_1_1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_1_1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_1_1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_1_1_HIGH)
            int_comb_1_1_write <= 1'b1;
        else if (WVALID)
            int_comb_1_1_write <= 1'b0;
    end
end

// int_comb_1_1_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_1_1_ce0)
            int_comb_1_1_shift <= comb_1_1_address0[0];
    end
end

// int_comb_2_0_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_2_0_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_2_0_BASE && raddr <= ADDR_COMB_2_0_HIGH)
            int_comb_2_0_read <= 1'b1;
        else
            int_comb_2_0_read <= 1'b0;
    end
end

// int_comb_2_0_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_2_0_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_2_0_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_2_0_HIGH)
            int_comb_2_0_write <= 1'b1;
        else if (WVALID)
            int_comb_2_0_write <= 1'b0;
    end
end

// int_comb_2_0_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_2_0_ce0)
            int_comb_2_0_shift <= comb_2_0_address0[0];
    end
end

// int_comb_2_1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_2_1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_2_1_BASE && raddr <= ADDR_COMB_2_1_HIGH)
            int_comb_2_1_read <= 1'b1;
        else
            int_comb_2_1_read <= 1'b0;
    end
end

// int_comb_2_1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_2_1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_2_1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_2_1_HIGH)
            int_comb_2_1_write <= 1'b1;
        else if (WVALID)
            int_comb_2_1_write <= 1'b0;
    end
end

// int_comb_2_1_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_2_1_ce0)
            int_comb_2_1_shift <= comb_2_1_address0[0];
    end
end

// int_comb_3_0_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_3_0_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_3_0_BASE && raddr <= ADDR_COMB_3_0_HIGH)
            int_comb_3_0_read <= 1'b1;
        else
            int_comb_3_0_read <= 1'b0;
    end
end

// int_comb_3_0_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_3_0_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_3_0_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_3_0_HIGH)
            int_comb_3_0_write <= 1'b1;
        else if (WVALID)
            int_comb_3_0_write <= 1'b0;
    end
end

// int_comb_3_0_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_3_0_ce0)
            int_comb_3_0_shift <= comb_3_0_address0[0];
    end
end

// int_comb_3_1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_3_1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_3_1_BASE && raddr <= ADDR_COMB_3_1_HIGH)
            int_comb_3_1_read <= 1'b1;
        else
            int_comb_3_1_read <= 1'b0;
    end
end

// int_comb_3_1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_3_1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_3_1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_3_1_HIGH)
            int_comb_3_1_write <= 1'b1;
        else if (WVALID)
            int_comb_3_1_write <= 1'b0;
    end
end

// int_comb_3_1_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_3_1_ce0)
            int_comb_3_1_shift <= comb_3_1_address0[0];
    end
end

// int_comb_4_0_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_4_0_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_4_0_BASE && raddr <= ADDR_COMB_4_0_HIGH)
            int_comb_4_0_read <= 1'b1;
        else
            int_comb_4_0_read <= 1'b0;
    end
end

// int_comb_4_0_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_4_0_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_4_0_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_4_0_HIGH)
            int_comb_4_0_write <= 1'b1;
        else if (WVALID)
            int_comb_4_0_write <= 1'b0;
    end
end

// int_comb_4_0_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_4_0_ce0)
            int_comb_4_0_shift <= comb_4_0_address0[0];
    end
end

// int_comb_4_1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_4_1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_4_1_BASE && raddr <= ADDR_COMB_4_1_HIGH)
            int_comb_4_1_read <= 1'b1;
        else
            int_comb_4_1_read <= 1'b0;
    end
end

// int_comb_4_1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_4_1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_4_1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_4_1_HIGH)
            int_comb_4_1_write <= 1'b1;
        else if (WVALID)
            int_comb_4_1_write <= 1'b0;
    end
end

// int_comb_4_1_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_4_1_ce0)
            int_comb_4_1_shift <= comb_4_1_address0[0];
    end
end

// int_comb_5_0_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_5_0_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_5_0_BASE && raddr <= ADDR_COMB_5_0_HIGH)
            int_comb_5_0_read <= 1'b1;
        else
            int_comb_5_0_read <= 1'b0;
    end
end

// int_comb_5_0_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_5_0_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_5_0_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_5_0_HIGH)
            int_comb_5_0_write <= 1'b1;
        else if (WVALID)
            int_comb_5_0_write <= 1'b0;
    end
end

// int_comb_5_0_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_5_0_ce0)
            int_comb_5_0_shift <= comb_5_0_address0[0];
    end
end

// int_comb_5_1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_5_1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_5_1_BASE && raddr <= ADDR_COMB_5_1_HIGH)
            int_comb_5_1_read <= 1'b1;
        else
            int_comb_5_1_read <= 1'b0;
    end
end

// int_comb_5_1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_5_1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_5_1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_5_1_HIGH)
            int_comb_5_1_write <= 1'b1;
        else if (WVALID)
            int_comb_5_1_write <= 1'b0;
    end
end

// int_comb_5_1_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_5_1_ce0)
            int_comb_5_1_shift <= comb_5_1_address0[0];
    end
end

// int_comb_6_0_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_6_0_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_6_0_BASE && raddr <= ADDR_COMB_6_0_HIGH)
            int_comb_6_0_read <= 1'b1;
        else
            int_comb_6_0_read <= 1'b0;
    end
end

// int_comb_6_0_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_6_0_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_6_0_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_6_0_HIGH)
            int_comb_6_0_write <= 1'b1;
        else if (WVALID)
            int_comb_6_0_write <= 1'b0;
    end
end

// int_comb_6_0_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_6_0_ce0)
            int_comb_6_0_shift <= comb_6_0_address0[0];
    end
end

// int_comb_6_1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_6_1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_6_1_BASE && raddr <= ADDR_COMB_6_1_HIGH)
            int_comb_6_1_read <= 1'b1;
        else
            int_comb_6_1_read <= 1'b0;
    end
end

// int_comb_6_1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_6_1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_6_1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_6_1_HIGH)
            int_comb_6_1_write <= 1'b1;
        else if (WVALID)
            int_comb_6_1_write <= 1'b0;
    end
end

// int_comb_6_1_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_6_1_ce0)
            int_comb_6_1_shift <= comb_6_1_address0[0];
    end
end

// int_comb_7_0_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_7_0_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_7_0_BASE && raddr <= ADDR_COMB_7_0_HIGH)
            int_comb_7_0_read <= 1'b1;
        else
            int_comb_7_0_read <= 1'b0;
    end
end

// int_comb_7_0_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_7_0_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_7_0_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_7_0_HIGH)
            int_comb_7_0_write <= 1'b1;
        else if (WVALID)
            int_comb_7_0_write <= 1'b0;
    end
end

// int_comb_7_0_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_7_0_ce0)
            int_comb_7_0_shift <= comb_7_0_address0[0];
    end
end

// int_comb_7_1_read
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_7_1_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_COMB_7_1_BASE && raddr <= ADDR_COMB_7_1_HIGH)
            int_comb_7_1_read <= 1'b1;
        else
            int_comb_7_1_read <= 1'b0;
    end
end

// int_comb_7_1_write
always @(posedge ACLK) begin
    if (ARESET)
        int_comb_7_1_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_COMB_7_1_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_COMB_7_1_HIGH)
            int_comb_7_1_write <= 1'b1;
        else if (WVALID)
            int_comb_7_1_write <= 1'b0;
    end
end

// int_comb_7_1_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (comb_7_1_ce0)
            int_comb_7_1_shift <= comb_7_1_address0[0];
    end
end


endmodule


`timescale 1ns/1ps

module dac_table_control_s_axi_ram
#(parameter
    BYTES  = 4,
    DEPTH  = 256,
    AWIDTH = log2(DEPTH)
) (
    input  wire               clk0,
    input  wire [AWIDTH-1:0]  address0,
    input  wire               ce0,
    input  wire               we0,
    input  wire [BYTES-1:0]   be0,
    input  wire [BYTES*8-1:0] d0,
    output reg  [BYTES*8-1:0] q0,
    input  wire               clk1,
    input  wire [AWIDTH-1:0]  address1,
    input  wire               ce1,
    input  wire               we1,
    input  wire [BYTES-1:0]   be1,
    input  wire [BYTES*8-1:0] d1,
    output reg  [BYTES*8-1:0] q1
);
//------------------------Local signal-------------------
reg  [BYTES*8-1:0] mem[0:DEPTH-1];
//------------------------Task and function--------------
function integer log2;
    input integer x;
    integer n, m;
begin
    n = 1;
    m = 2;
    while (m < x) begin
        n = n + 1;
        m = m * 2;
    end
    log2 = n;
end
endfunction
//------------------------Body---------------------------
// read port 0
always @(posedge clk0) begin
    if (ce0) q0 <= mem[address0];
end

// read port 1
always @(posedge clk1) begin
    if (ce1) q1 <= mem[address1];
end

genvar i;
generate
    for (i = 0; i < BYTES; i = i + 1) begin : gen_write
        // write port 0
        always @(posedge clk0) begin
            if (ce0 & we0 & be0[i]) begin
                mem[address0][8*i+7:8*i] <= d0[8*i+7:8*i];
            end
        end
        // write port 1
        always @(posedge clk1) begin
            if (ce1 & we1 & be1[i]) begin
                mem[address1][8*i+7:8*i] <= d1[8*i+7:8*i];
            end
        end
    end
endgenerate

endmodule

