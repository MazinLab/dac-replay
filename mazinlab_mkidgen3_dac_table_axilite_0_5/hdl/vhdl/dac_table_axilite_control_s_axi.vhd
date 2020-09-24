-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity dac_table_axilite_control_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 21;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    interrupt             :out  STD_LOGIC;
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC;
    comb_0_0_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_0_0_ce0          :in   STD_LOGIC;
    comb_0_0_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_0_1_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_0_1_ce0          :in   STD_LOGIC;
    comb_0_1_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_1_0_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_1_0_ce0          :in   STD_LOGIC;
    comb_1_0_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_1_1_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_1_1_ce0          :in   STD_LOGIC;
    comb_1_1_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_2_0_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_2_0_ce0          :in   STD_LOGIC;
    comb_2_0_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_2_1_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_2_1_ce0          :in   STD_LOGIC;
    comb_2_1_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_3_0_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_3_0_ce0          :in   STD_LOGIC;
    comb_3_0_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_3_1_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_3_1_ce0          :in   STD_LOGIC;
    comb_3_1_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_4_0_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_4_0_ce0          :in   STD_LOGIC;
    comb_4_0_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_4_1_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_4_1_ce0          :in   STD_LOGIC;
    comb_4_1_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_5_0_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_5_0_ce0          :in   STD_LOGIC;
    comb_5_0_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_5_1_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_5_1_ce0          :in   STD_LOGIC;
    comb_5_1_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_6_0_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_6_0_ce0          :in   STD_LOGIC;
    comb_6_0_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_6_1_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_6_1_ce0          :in   STD_LOGIC;
    comb_6_1_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_7_0_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_7_0_ce0          :in   STD_LOGIC;
    comb_7_0_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    comb_7_1_address0     :in   STD_LOGIC_VECTOR(14 downto 0);
    comb_7_1_ce0          :in   STD_LOGIC;
    comb_7_1_q0           :out  STD_LOGIC_VECTOR(15 downto 0);
    length_V              :out  STD_LOGIC_VECTOR(14 downto 0);
    tlast                 :out  STD_LOGIC_VECTOR(0 downto 0);
    replay_length_V       :out  STD_LOGIC_VECTOR(14 downto 0);
    run                   :out  STD_LOGIC_VECTOR(0 downto 0)
);
end entity dac_table_axilite_control_s_axi;

-- ------------------------Address Info-------------------
-- 0x000000 : Control signals
--            bit 0  - ap_start (Read/Write/COH)
--            bit 1  - ap_done (Read/COR)
--            bit 2  - ap_idle (Read)
--            bit 3  - ap_ready (Read)
--            bit 7  - auto_restart (Read/Write)
--            others - reserved
-- 0x000004 : Global Interrupt Enable Register
--            bit 0  - Global Interrupt Enable (Read/Write)
--            others - reserved
-- 0x000008 : IP Interrupt Enable Register (Read/Write)
--            bit 0  - Channel 0 (ap_done)
--            bit 1  - Channel 1 (ap_ready)
--            others - reserved
-- 0x00000c : IP Interrupt Status Register (Read/TOW)
--            bit 0  - Channel 0 (ap_done)
--            bit 1  - Channel 1 (ap_ready)
--            others - reserved
-- 0x110000 : Data signal of length_V
--            bit 14~0 - length_V[14:0] (Read/Write)
--            others   - reserved
-- 0x110004 : reserved
-- 0x110008 : Data signal of tlast
--            bit 0  - tlast[0] (Read/Write)
--            others - reserved
-- 0x11000c : reserved
-- 0x110010 : Data signal of replay_length_V
--            bit 14~0 - replay_length_V[14:0] (Read/Write)
--            others   - reserved
-- 0x110014 : reserved
-- 0x110018 : Data signal of run
--            bit 0  - run[0] (Read/Write)
--            others - reserved
-- 0x11001c : reserved
-- 0x010000 ~
-- 0x01ffff : Memory 'comb_0_0' (32768 * 16b)
--            Word n : bit [15: 0] - comb_0_0[2n]
--                     bit [31:16] - comb_0_0[2n+1]
-- 0x020000 ~
-- 0x02ffff : Memory 'comb_0_1' (32768 * 16b)
--            Word n : bit [15: 0] - comb_0_1[2n]
--                     bit [31:16] - comb_0_1[2n+1]
-- 0x030000 ~
-- 0x03ffff : Memory 'comb_1_0' (32768 * 16b)
--            Word n : bit [15: 0] - comb_1_0[2n]
--                     bit [31:16] - comb_1_0[2n+1]
-- 0x040000 ~
-- 0x04ffff : Memory 'comb_1_1' (32768 * 16b)
--            Word n : bit [15: 0] - comb_1_1[2n]
--                     bit [31:16] - comb_1_1[2n+1]
-- 0x050000 ~
-- 0x05ffff : Memory 'comb_2_0' (32768 * 16b)
--            Word n : bit [15: 0] - comb_2_0[2n]
--                     bit [31:16] - comb_2_0[2n+1]
-- 0x060000 ~
-- 0x06ffff : Memory 'comb_2_1' (32768 * 16b)
--            Word n : bit [15: 0] - comb_2_1[2n]
--                     bit [31:16] - comb_2_1[2n+1]
-- 0x070000 ~
-- 0x07ffff : Memory 'comb_3_0' (32768 * 16b)
--            Word n : bit [15: 0] - comb_3_0[2n]
--                     bit [31:16] - comb_3_0[2n+1]
-- 0x080000 ~
-- 0x08ffff : Memory 'comb_3_1' (32768 * 16b)
--            Word n : bit [15: 0] - comb_3_1[2n]
--                     bit [31:16] - comb_3_1[2n+1]
-- 0x090000 ~
-- 0x09ffff : Memory 'comb_4_0' (32768 * 16b)
--            Word n : bit [15: 0] - comb_4_0[2n]
--                     bit [31:16] - comb_4_0[2n+1]
-- 0x0a0000 ~
-- 0x0affff : Memory 'comb_4_1' (32768 * 16b)
--            Word n : bit [15: 0] - comb_4_1[2n]
--                     bit [31:16] - comb_4_1[2n+1]
-- 0x0b0000 ~
-- 0x0bffff : Memory 'comb_5_0' (32768 * 16b)
--            Word n : bit [15: 0] - comb_5_0[2n]
--                     bit [31:16] - comb_5_0[2n+1]
-- 0x0c0000 ~
-- 0x0cffff : Memory 'comb_5_1' (32768 * 16b)
--            Word n : bit [15: 0] - comb_5_1[2n]
--                     bit [31:16] - comb_5_1[2n+1]
-- 0x0d0000 ~
-- 0x0dffff : Memory 'comb_6_0' (32768 * 16b)
--            Word n : bit [15: 0] - comb_6_0[2n]
--                     bit [31:16] - comb_6_0[2n+1]
-- 0x0e0000 ~
-- 0x0effff : Memory 'comb_6_1' (32768 * 16b)
--            Word n : bit [15: 0] - comb_6_1[2n]
--                     bit [31:16] - comb_6_1[2n+1]
-- 0x0f0000 ~
-- 0x0fffff : Memory 'comb_7_0' (32768 * 16b)
--            Word n : bit [15: 0] - comb_7_0[2n]
--                     bit [31:16] - comb_7_0[2n+1]
-- 0x100000 ~
-- 0x10ffff : Memory 'comb_7_1' (32768 * 16b)
--            Word n : bit [15: 0] - comb_7_1[2n]
--                     bit [31:16] - comb_7_1[2n+1]
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of dac_table_axilite_control_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL                : INTEGER := 16#000000#;
    constant ADDR_GIE                    : INTEGER := 16#000004#;
    constant ADDR_IER                    : INTEGER := 16#000008#;
    constant ADDR_ISR                    : INTEGER := 16#00000c#;
    constant ADDR_LENGTH_V_DATA_0        : INTEGER := 16#110000#;
    constant ADDR_LENGTH_V_CTRL          : INTEGER := 16#110004#;
    constant ADDR_TLAST_DATA_0           : INTEGER := 16#110008#;
    constant ADDR_TLAST_CTRL             : INTEGER := 16#11000c#;
    constant ADDR_REPLAY_LENGTH_V_DATA_0 : INTEGER := 16#110010#;
    constant ADDR_REPLAY_LENGTH_V_CTRL   : INTEGER := 16#110014#;
    constant ADDR_RUN_DATA_0             : INTEGER := 16#110018#;
    constant ADDR_RUN_CTRL               : INTEGER := 16#11001c#;
    constant ADDR_COMB_0_0_BASE          : INTEGER := 16#010000#;
    constant ADDR_COMB_0_0_HIGH          : INTEGER := 16#01ffff#;
    constant ADDR_COMB_0_1_BASE          : INTEGER := 16#020000#;
    constant ADDR_COMB_0_1_HIGH          : INTEGER := 16#02ffff#;
    constant ADDR_COMB_1_0_BASE          : INTEGER := 16#030000#;
    constant ADDR_COMB_1_0_HIGH          : INTEGER := 16#03ffff#;
    constant ADDR_COMB_1_1_BASE          : INTEGER := 16#040000#;
    constant ADDR_COMB_1_1_HIGH          : INTEGER := 16#04ffff#;
    constant ADDR_COMB_2_0_BASE          : INTEGER := 16#050000#;
    constant ADDR_COMB_2_0_HIGH          : INTEGER := 16#05ffff#;
    constant ADDR_COMB_2_1_BASE          : INTEGER := 16#060000#;
    constant ADDR_COMB_2_1_HIGH          : INTEGER := 16#06ffff#;
    constant ADDR_COMB_3_0_BASE          : INTEGER := 16#070000#;
    constant ADDR_COMB_3_0_HIGH          : INTEGER := 16#07ffff#;
    constant ADDR_COMB_3_1_BASE          : INTEGER := 16#080000#;
    constant ADDR_COMB_3_1_HIGH          : INTEGER := 16#08ffff#;
    constant ADDR_COMB_4_0_BASE          : INTEGER := 16#090000#;
    constant ADDR_COMB_4_0_HIGH          : INTEGER := 16#09ffff#;
    constant ADDR_COMB_4_1_BASE          : INTEGER := 16#0a0000#;
    constant ADDR_COMB_4_1_HIGH          : INTEGER := 16#0affff#;
    constant ADDR_COMB_5_0_BASE          : INTEGER := 16#0b0000#;
    constant ADDR_COMB_5_0_HIGH          : INTEGER := 16#0bffff#;
    constant ADDR_COMB_5_1_BASE          : INTEGER := 16#0c0000#;
    constant ADDR_COMB_5_1_HIGH          : INTEGER := 16#0cffff#;
    constant ADDR_COMB_6_0_BASE          : INTEGER := 16#0d0000#;
    constant ADDR_COMB_6_0_HIGH          : INTEGER := 16#0dffff#;
    constant ADDR_COMB_6_1_BASE          : INTEGER := 16#0e0000#;
    constant ADDR_COMB_6_1_HIGH          : INTEGER := 16#0effff#;
    constant ADDR_COMB_7_0_BASE          : INTEGER := 16#0f0000#;
    constant ADDR_COMB_7_0_HIGH          : INTEGER := 16#0fffff#;
    constant ADDR_COMB_7_1_BASE          : INTEGER := 16#100000#;
    constant ADDR_COMB_7_1_HIGH          : INTEGER := 16#10ffff#;
    constant ADDR_BITS         : INTEGER := 21;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(31 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(31 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_ap_idle         : STD_LOGIC;
    signal int_ap_ready        : STD_LOGIC;
    signal int_ap_done         : STD_LOGIC := '0';
    signal int_ap_start        : STD_LOGIC := '0';
    signal int_auto_restart    : STD_LOGIC := '0';
    signal int_gie             : STD_LOGIC := '0';
    signal int_ier             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_isr             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_length_V        : UNSIGNED(14 downto 0) := (others => '0');
    signal int_tlast           : UNSIGNED(0 downto 0) := (others => '0');
    signal int_replay_length_V : UNSIGNED(14 downto 0) := (others => '0');
    signal int_run             : UNSIGNED(0 downto 0) := (others => '0');
    -- memory signals
    signal int_comb_0_0_address0 : UNSIGNED(13 downto 0);
    signal int_comb_0_0_ce0    : STD_LOGIC;
    signal int_comb_0_0_we0    : STD_LOGIC;
    signal int_comb_0_0_be0    : UNSIGNED(3 downto 0);
    signal int_comb_0_0_d0     : UNSIGNED(31 downto 0);
    signal int_comb_0_0_q0     : UNSIGNED(31 downto 0);
    signal int_comb_0_0_address1 : UNSIGNED(13 downto 0);
    signal int_comb_0_0_ce1    : STD_LOGIC;
    signal int_comb_0_0_we1    : STD_LOGIC;
    signal int_comb_0_0_be1    : UNSIGNED(3 downto 0);
    signal int_comb_0_0_d1     : UNSIGNED(31 downto 0);
    signal int_comb_0_0_q1     : UNSIGNED(31 downto 0);
    signal int_comb_0_0_read   : STD_LOGIC;
    signal int_comb_0_0_write  : STD_LOGIC;
    signal int_comb_0_0_shift  : UNSIGNED(0 downto 0);
    signal int_comb_0_1_address0 : UNSIGNED(13 downto 0);
    signal int_comb_0_1_ce0    : STD_LOGIC;
    signal int_comb_0_1_we0    : STD_LOGIC;
    signal int_comb_0_1_be0    : UNSIGNED(3 downto 0);
    signal int_comb_0_1_d0     : UNSIGNED(31 downto 0);
    signal int_comb_0_1_q0     : UNSIGNED(31 downto 0);
    signal int_comb_0_1_address1 : UNSIGNED(13 downto 0);
    signal int_comb_0_1_ce1    : STD_LOGIC;
    signal int_comb_0_1_we1    : STD_LOGIC;
    signal int_comb_0_1_be1    : UNSIGNED(3 downto 0);
    signal int_comb_0_1_d1     : UNSIGNED(31 downto 0);
    signal int_comb_0_1_q1     : UNSIGNED(31 downto 0);
    signal int_comb_0_1_read   : STD_LOGIC;
    signal int_comb_0_1_write  : STD_LOGIC;
    signal int_comb_0_1_shift  : UNSIGNED(0 downto 0);
    signal int_comb_1_0_address0 : UNSIGNED(13 downto 0);
    signal int_comb_1_0_ce0    : STD_LOGIC;
    signal int_comb_1_0_we0    : STD_LOGIC;
    signal int_comb_1_0_be0    : UNSIGNED(3 downto 0);
    signal int_comb_1_0_d0     : UNSIGNED(31 downto 0);
    signal int_comb_1_0_q0     : UNSIGNED(31 downto 0);
    signal int_comb_1_0_address1 : UNSIGNED(13 downto 0);
    signal int_comb_1_0_ce1    : STD_LOGIC;
    signal int_comb_1_0_we1    : STD_LOGIC;
    signal int_comb_1_0_be1    : UNSIGNED(3 downto 0);
    signal int_comb_1_0_d1     : UNSIGNED(31 downto 0);
    signal int_comb_1_0_q1     : UNSIGNED(31 downto 0);
    signal int_comb_1_0_read   : STD_LOGIC;
    signal int_comb_1_0_write  : STD_LOGIC;
    signal int_comb_1_0_shift  : UNSIGNED(0 downto 0);
    signal int_comb_1_1_address0 : UNSIGNED(13 downto 0);
    signal int_comb_1_1_ce0    : STD_LOGIC;
    signal int_comb_1_1_we0    : STD_LOGIC;
    signal int_comb_1_1_be0    : UNSIGNED(3 downto 0);
    signal int_comb_1_1_d0     : UNSIGNED(31 downto 0);
    signal int_comb_1_1_q0     : UNSIGNED(31 downto 0);
    signal int_comb_1_1_address1 : UNSIGNED(13 downto 0);
    signal int_comb_1_1_ce1    : STD_LOGIC;
    signal int_comb_1_1_we1    : STD_LOGIC;
    signal int_comb_1_1_be1    : UNSIGNED(3 downto 0);
    signal int_comb_1_1_d1     : UNSIGNED(31 downto 0);
    signal int_comb_1_1_q1     : UNSIGNED(31 downto 0);
    signal int_comb_1_1_read   : STD_LOGIC;
    signal int_comb_1_1_write  : STD_LOGIC;
    signal int_comb_1_1_shift  : UNSIGNED(0 downto 0);
    signal int_comb_2_0_address0 : UNSIGNED(13 downto 0);
    signal int_comb_2_0_ce0    : STD_LOGIC;
    signal int_comb_2_0_we0    : STD_LOGIC;
    signal int_comb_2_0_be0    : UNSIGNED(3 downto 0);
    signal int_comb_2_0_d0     : UNSIGNED(31 downto 0);
    signal int_comb_2_0_q0     : UNSIGNED(31 downto 0);
    signal int_comb_2_0_address1 : UNSIGNED(13 downto 0);
    signal int_comb_2_0_ce1    : STD_LOGIC;
    signal int_comb_2_0_we1    : STD_LOGIC;
    signal int_comb_2_0_be1    : UNSIGNED(3 downto 0);
    signal int_comb_2_0_d1     : UNSIGNED(31 downto 0);
    signal int_comb_2_0_q1     : UNSIGNED(31 downto 0);
    signal int_comb_2_0_read   : STD_LOGIC;
    signal int_comb_2_0_write  : STD_LOGIC;
    signal int_comb_2_0_shift  : UNSIGNED(0 downto 0);
    signal int_comb_2_1_address0 : UNSIGNED(13 downto 0);
    signal int_comb_2_1_ce0    : STD_LOGIC;
    signal int_comb_2_1_we0    : STD_LOGIC;
    signal int_comb_2_1_be0    : UNSIGNED(3 downto 0);
    signal int_comb_2_1_d0     : UNSIGNED(31 downto 0);
    signal int_comb_2_1_q0     : UNSIGNED(31 downto 0);
    signal int_comb_2_1_address1 : UNSIGNED(13 downto 0);
    signal int_comb_2_1_ce1    : STD_LOGIC;
    signal int_comb_2_1_we1    : STD_LOGIC;
    signal int_comb_2_1_be1    : UNSIGNED(3 downto 0);
    signal int_comb_2_1_d1     : UNSIGNED(31 downto 0);
    signal int_comb_2_1_q1     : UNSIGNED(31 downto 0);
    signal int_comb_2_1_read   : STD_LOGIC;
    signal int_comb_2_1_write  : STD_LOGIC;
    signal int_comb_2_1_shift  : UNSIGNED(0 downto 0);
    signal int_comb_3_0_address0 : UNSIGNED(13 downto 0);
    signal int_comb_3_0_ce0    : STD_LOGIC;
    signal int_comb_3_0_we0    : STD_LOGIC;
    signal int_comb_3_0_be0    : UNSIGNED(3 downto 0);
    signal int_comb_3_0_d0     : UNSIGNED(31 downto 0);
    signal int_comb_3_0_q0     : UNSIGNED(31 downto 0);
    signal int_comb_3_0_address1 : UNSIGNED(13 downto 0);
    signal int_comb_3_0_ce1    : STD_LOGIC;
    signal int_comb_3_0_we1    : STD_LOGIC;
    signal int_comb_3_0_be1    : UNSIGNED(3 downto 0);
    signal int_comb_3_0_d1     : UNSIGNED(31 downto 0);
    signal int_comb_3_0_q1     : UNSIGNED(31 downto 0);
    signal int_comb_3_0_read   : STD_LOGIC;
    signal int_comb_3_0_write  : STD_LOGIC;
    signal int_comb_3_0_shift  : UNSIGNED(0 downto 0);
    signal int_comb_3_1_address0 : UNSIGNED(13 downto 0);
    signal int_comb_3_1_ce0    : STD_LOGIC;
    signal int_comb_3_1_we0    : STD_LOGIC;
    signal int_comb_3_1_be0    : UNSIGNED(3 downto 0);
    signal int_comb_3_1_d0     : UNSIGNED(31 downto 0);
    signal int_comb_3_1_q0     : UNSIGNED(31 downto 0);
    signal int_comb_3_1_address1 : UNSIGNED(13 downto 0);
    signal int_comb_3_1_ce1    : STD_LOGIC;
    signal int_comb_3_1_we1    : STD_LOGIC;
    signal int_comb_3_1_be1    : UNSIGNED(3 downto 0);
    signal int_comb_3_1_d1     : UNSIGNED(31 downto 0);
    signal int_comb_3_1_q1     : UNSIGNED(31 downto 0);
    signal int_comb_3_1_read   : STD_LOGIC;
    signal int_comb_3_1_write  : STD_LOGIC;
    signal int_comb_3_1_shift  : UNSIGNED(0 downto 0);
    signal int_comb_4_0_address0 : UNSIGNED(13 downto 0);
    signal int_comb_4_0_ce0    : STD_LOGIC;
    signal int_comb_4_0_we0    : STD_LOGIC;
    signal int_comb_4_0_be0    : UNSIGNED(3 downto 0);
    signal int_comb_4_0_d0     : UNSIGNED(31 downto 0);
    signal int_comb_4_0_q0     : UNSIGNED(31 downto 0);
    signal int_comb_4_0_address1 : UNSIGNED(13 downto 0);
    signal int_comb_4_0_ce1    : STD_LOGIC;
    signal int_comb_4_0_we1    : STD_LOGIC;
    signal int_comb_4_0_be1    : UNSIGNED(3 downto 0);
    signal int_comb_4_0_d1     : UNSIGNED(31 downto 0);
    signal int_comb_4_0_q1     : UNSIGNED(31 downto 0);
    signal int_comb_4_0_read   : STD_LOGIC;
    signal int_comb_4_0_write  : STD_LOGIC;
    signal int_comb_4_0_shift  : UNSIGNED(0 downto 0);
    signal int_comb_4_1_address0 : UNSIGNED(13 downto 0);
    signal int_comb_4_1_ce0    : STD_LOGIC;
    signal int_comb_4_1_we0    : STD_LOGIC;
    signal int_comb_4_1_be0    : UNSIGNED(3 downto 0);
    signal int_comb_4_1_d0     : UNSIGNED(31 downto 0);
    signal int_comb_4_1_q0     : UNSIGNED(31 downto 0);
    signal int_comb_4_1_address1 : UNSIGNED(13 downto 0);
    signal int_comb_4_1_ce1    : STD_LOGIC;
    signal int_comb_4_1_we1    : STD_LOGIC;
    signal int_comb_4_1_be1    : UNSIGNED(3 downto 0);
    signal int_comb_4_1_d1     : UNSIGNED(31 downto 0);
    signal int_comb_4_1_q1     : UNSIGNED(31 downto 0);
    signal int_comb_4_1_read   : STD_LOGIC;
    signal int_comb_4_1_write  : STD_LOGIC;
    signal int_comb_4_1_shift  : UNSIGNED(0 downto 0);
    signal int_comb_5_0_address0 : UNSIGNED(13 downto 0);
    signal int_comb_5_0_ce0    : STD_LOGIC;
    signal int_comb_5_0_we0    : STD_LOGIC;
    signal int_comb_5_0_be0    : UNSIGNED(3 downto 0);
    signal int_comb_5_0_d0     : UNSIGNED(31 downto 0);
    signal int_comb_5_0_q0     : UNSIGNED(31 downto 0);
    signal int_comb_5_0_address1 : UNSIGNED(13 downto 0);
    signal int_comb_5_0_ce1    : STD_LOGIC;
    signal int_comb_5_0_we1    : STD_LOGIC;
    signal int_comb_5_0_be1    : UNSIGNED(3 downto 0);
    signal int_comb_5_0_d1     : UNSIGNED(31 downto 0);
    signal int_comb_5_0_q1     : UNSIGNED(31 downto 0);
    signal int_comb_5_0_read   : STD_LOGIC;
    signal int_comb_5_0_write  : STD_LOGIC;
    signal int_comb_5_0_shift  : UNSIGNED(0 downto 0);
    signal int_comb_5_1_address0 : UNSIGNED(13 downto 0);
    signal int_comb_5_1_ce0    : STD_LOGIC;
    signal int_comb_5_1_we0    : STD_LOGIC;
    signal int_comb_5_1_be0    : UNSIGNED(3 downto 0);
    signal int_comb_5_1_d0     : UNSIGNED(31 downto 0);
    signal int_comb_5_1_q0     : UNSIGNED(31 downto 0);
    signal int_comb_5_1_address1 : UNSIGNED(13 downto 0);
    signal int_comb_5_1_ce1    : STD_LOGIC;
    signal int_comb_5_1_we1    : STD_LOGIC;
    signal int_comb_5_1_be1    : UNSIGNED(3 downto 0);
    signal int_comb_5_1_d1     : UNSIGNED(31 downto 0);
    signal int_comb_5_1_q1     : UNSIGNED(31 downto 0);
    signal int_comb_5_1_read   : STD_LOGIC;
    signal int_comb_5_1_write  : STD_LOGIC;
    signal int_comb_5_1_shift  : UNSIGNED(0 downto 0);
    signal int_comb_6_0_address0 : UNSIGNED(13 downto 0);
    signal int_comb_6_0_ce0    : STD_LOGIC;
    signal int_comb_6_0_we0    : STD_LOGIC;
    signal int_comb_6_0_be0    : UNSIGNED(3 downto 0);
    signal int_comb_6_0_d0     : UNSIGNED(31 downto 0);
    signal int_comb_6_0_q0     : UNSIGNED(31 downto 0);
    signal int_comb_6_0_address1 : UNSIGNED(13 downto 0);
    signal int_comb_6_0_ce1    : STD_LOGIC;
    signal int_comb_6_0_we1    : STD_LOGIC;
    signal int_comb_6_0_be1    : UNSIGNED(3 downto 0);
    signal int_comb_6_0_d1     : UNSIGNED(31 downto 0);
    signal int_comb_6_0_q1     : UNSIGNED(31 downto 0);
    signal int_comb_6_0_read   : STD_LOGIC;
    signal int_comb_6_0_write  : STD_LOGIC;
    signal int_comb_6_0_shift  : UNSIGNED(0 downto 0);
    signal int_comb_6_1_address0 : UNSIGNED(13 downto 0);
    signal int_comb_6_1_ce0    : STD_LOGIC;
    signal int_comb_6_1_we0    : STD_LOGIC;
    signal int_comb_6_1_be0    : UNSIGNED(3 downto 0);
    signal int_comb_6_1_d0     : UNSIGNED(31 downto 0);
    signal int_comb_6_1_q0     : UNSIGNED(31 downto 0);
    signal int_comb_6_1_address1 : UNSIGNED(13 downto 0);
    signal int_comb_6_1_ce1    : STD_LOGIC;
    signal int_comb_6_1_we1    : STD_LOGIC;
    signal int_comb_6_1_be1    : UNSIGNED(3 downto 0);
    signal int_comb_6_1_d1     : UNSIGNED(31 downto 0);
    signal int_comb_6_1_q1     : UNSIGNED(31 downto 0);
    signal int_comb_6_1_read   : STD_LOGIC;
    signal int_comb_6_1_write  : STD_LOGIC;
    signal int_comb_6_1_shift  : UNSIGNED(0 downto 0);
    signal int_comb_7_0_address0 : UNSIGNED(13 downto 0);
    signal int_comb_7_0_ce0    : STD_LOGIC;
    signal int_comb_7_0_we0    : STD_LOGIC;
    signal int_comb_7_0_be0    : UNSIGNED(3 downto 0);
    signal int_comb_7_0_d0     : UNSIGNED(31 downto 0);
    signal int_comb_7_0_q0     : UNSIGNED(31 downto 0);
    signal int_comb_7_0_address1 : UNSIGNED(13 downto 0);
    signal int_comb_7_0_ce1    : STD_LOGIC;
    signal int_comb_7_0_we1    : STD_LOGIC;
    signal int_comb_7_0_be1    : UNSIGNED(3 downto 0);
    signal int_comb_7_0_d1     : UNSIGNED(31 downto 0);
    signal int_comb_7_0_q1     : UNSIGNED(31 downto 0);
    signal int_comb_7_0_read   : STD_LOGIC;
    signal int_comb_7_0_write  : STD_LOGIC;
    signal int_comb_7_0_shift  : UNSIGNED(0 downto 0);
    signal int_comb_7_1_address0 : UNSIGNED(13 downto 0);
    signal int_comb_7_1_ce0    : STD_LOGIC;
    signal int_comb_7_1_we0    : STD_LOGIC;
    signal int_comb_7_1_be0    : UNSIGNED(3 downto 0);
    signal int_comb_7_1_d0     : UNSIGNED(31 downto 0);
    signal int_comb_7_1_q0     : UNSIGNED(31 downto 0);
    signal int_comb_7_1_address1 : UNSIGNED(13 downto 0);
    signal int_comb_7_1_ce1    : STD_LOGIC;
    signal int_comb_7_1_we1    : STD_LOGIC;
    signal int_comb_7_1_be1    : UNSIGNED(3 downto 0);
    signal int_comb_7_1_d1     : UNSIGNED(31 downto 0);
    signal int_comb_7_1_q1     : UNSIGNED(31 downto 0);
    signal int_comb_7_1_read   : STD_LOGIC;
    signal int_comb_7_1_write  : STD_LOGIC;
    signal int_comb_7_1_shift  : UNSIGNED(0 downto 0);

    component dac_table_axilite_control_s_axi_ram is
        generic (
            BYTES   : INTEGER :=4;
            DEPTH   : INTEGER :=256;
            AWIDTH  : INTEGER :=8);
        port (
            clk0    : in  STD_LOGIC;
            address0: in  UNSIGNED(AWIDTH-1 downto 0);
            ce0     : in  STD_LOGIC;
            we0     : in  STD_LOGIC;
            be0     : in  UNSIGNED(BYTES-1 downto 0);
            d0      : in  UNSIGNED(BYTES*8-1 downto 0);
            q0      : out UNSIGNED(BYTES*8-1 downto 0);
            clk1    : in  STD_LOGIC;
            address1: in  UNSIGNED(AWIDTH-1 downto 0);
            ce1     : in  STD_LOGIC;
            we1     : in  STD_LOGIC;
            be1     : in  UNSIGNED(BYTES-1 downto 0);
            d1      : in  UNSIGNED(BYTES*8-1 downto 0);
            q1      : out UNSIGNED(BYTES*8-1 downto 0));
    end component dac_table_axilite_control_s_axi_ram;

    function log2 (x : INTEGER) return INTEGER is
        variable n, m : INTEGER;
    begin
        n := 1;
        m := 2;
        while m < x loop
            n := n + 1;
            m := m * 2;
        end loop;
        return n;
    end function log2;

begin
-- ----------------------- Instantiation------------------
-- int_comb_0_0
int_comb_0_0 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_0_0_address0,
     ce0      => int_comb_0_0_ce0,
     we0      => int_comb_0_0_we0,
     be0      => int_comb_0_0_be0,
     d0       => int_comb_0_0_d0,
     q0       => int_comb_0_0_q0,
     clk1     => ACLK,
     address1 => int_comb_0_0_address1,
     ce1      => int_comb_0_0_ce1,
     we1      => int_comb_0_0_we1,
     be1      => int_comb_0_0_be1,
     d1       => int_comb_0_0_d1,
     q1       => int_comb_0_0_q1);
-- int_comb_0_1
int_comb_0_1 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_0_1_address0,
     ce0      => int_comb_0_1_ce0,
     we0      => int_comb_0_1_we0,
     be0      => int_comb_0_1_be0,
     d0       => int_comb_0_1_d0,
     q0       => int_comb_0_1_q0,
     clk1     => ACLK,
     address1 => int_comb_0_1_address1,
     ce1      => int_comb_0_1_ce1,
     we1      => int_comb_0_1_we1,
     be1      => int_comb_0_1_be1,
     d1       => int_comb_0_1_d1,
     q1       => int_comb_0_1_q1);
-- int_comb_1_0
int_comb_1_0 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_1_0_address0,
     ce0      => int_comb_1_0_ce0,
     we0      => int_comb_1_0_we0,
     be0      => int_comb_1_0_be0,
     d0       => int_comb_1_0_d0,
     q0       => int_comb_1_0_q0,
     clk1     => ACLK,
     address1 => int_comb_1_0_address1,
     ce1      => int_comb_1_0_ce1,
     we1      => int_comb_1_0_we1,
     be1      => int_comb_1_0_be1,
     d1       => int_comb_1_0_d1,
     q1       => int_comb_1_0_q1);
-- int_comb_1_1
int_comb_1_1 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_1_1_address0,
     ce0      => int_comb_1_1_ce0,
     we0      => int_comb_1_1_we0,
     be0      => int_comb_1_1_be0,
     d0       => int_comb_1_1_d0,
     q0       => int_comb_1_1_q0,
     clk1     => ACLK,
     address1 => int_comb_1_1_address1,
     ce1      => int_comb_1_1_ce1,
     we1      => int_comb_1_1_we1,
     be1      => int_comb_1_1_be1,
     d1       => int_comb_1_1_d1,
     q1       => int_comb_1_1_q1);
-- int_comb_2_0
int_comb_2_0 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_2_0_address0,
     ce0      => int_comb_2_0_ce0,
     we0      => int_comb_2_0_we0,
     be0      => int_comb_2_0_be0,
     d0       => int_comb_2_0_d0,
     q0       => int_comb_2_0_q0,
     clk1     => ACLK,
     address1 => int_comb_2_0_address1,
     ce1      => int_comb_2_0_ce1,
     we1      => int_comb_2_0_we1,
     be1      => int_comb_2_0_be1,
     d1       => int_comb_2_0_d1,
     q1       => int_comb_2_0_q1);
-- int_comb_2_1
int_comb_2_1 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_2_1_address0,
     ce0      => int_comb_2_1_ce0,
     we0      => int_comb_2_1_we0,
     be0      => int_comb_2_1_be0,
     d0       => int_comb_2_1_d0,
     q0       => int_comb_2_1_q0,
     clk1     => ACLK,
     address1 => int_comb_2_1_address1,
     ce1      => int_comb_2_1_ce1,
     we1      => int_comb_2_1_we1,
     be1      => int_comb_2_1_be1,
     d1       => int_comb_2_1_d1,
     q1       => int_comb_2_1_q1);
-- int_comb_3_0
int_comb_3_0 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_3_0_address0,
     ce0      => int_comb_3_0_ce0,
     we0      => int_comb_3_0_we0,
     be0      => int_comb_3_0_be0,
     d0       => int_comb_3_0_d0,
     q0       => int_comb_3_0_q0,
     clk1     => ACLK,
     address1 => int_comb_3_0_address1,
     ce1      => int_comb_3_0_ce1,
     we1      => int_comb_3_0_we1,
     be1      => int_comb_3_0_be1,
     d1       => int_comb_3_0_d1,
     q1       => int_comb_3_0_q1);
-- int_comb_3_1
int_comb_3_1 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_3_1_address0,
     ce0      => int_comb_3_1_ce0,
     we0      => int_comb_3_1_we0,
     be0      => int_comb_3_1_be0,
     d0       => int_comb_3_1_d0,
     q0       => int_comb_3_1_q0,
     clk1     => ACLK,
     address1 => int_comb_3_1_address1,
     ce1      => int_comb_3_1_ce1,
     we1      => int_comb_3_1_we1,
     be1      => int_comb_3_1_be1,
     d1       => int_comb_3_1_d1,
     q1       => int_comb_3_1_q1);
-- int_comb_4_0
int_comb_4_0 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_4_0_address0,
     ce0      => int_comb_4_0_ce0,
     we0      => int_comb_4_0_we0,
     be0      => int_comb_4_0_be0,
     d0       => int_comb_4_0_d0,
     q0       => int_comb_4_0_q0,
     clk1     => ACLK,
     address1 => int_comb_4_0_address1,
     ce1      => int_comb_4_0_ce1,
     we1      => int_comb_4_0_we1,
     be1      => int_comb_4_0_be1,
     d1       => int_comb_4_0_d1,
     q1       => int_comb_4_0_q1);
-- int_comb_4_1
int_comb_4_1 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_4_1_address0,
     ce0      => int_comb_4_1_ce0,
     we0      => int_comb_4_1_we0,
     be0      => int_comb_4_1_be0,
     d0       => int_comb_4_1_d0,
     q0       => int_comb_4_1_q0,
     clk1     => ACLK,
     address1 => int_comb_4_1_address1,
     ce1      => int_comb_4_1_ce1,
     we1      => int_comb_4_1_we1,
     be1      => int_comb_4_1_be1,
     d1       => int_comb_4_1_d1,
     q1       => int_comb_4_1_q1);
-- int_comb_5_0
int_comb_5_0 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_5_0_address0,
     ce0      => int_comb_5_0_ce0,
     we0      => int_comb_5_0_we0,
     be0      => int_comb_5_0_be0,
     d0       => int_comb_5_0_d0,
     q0       => int_comb_5_0_q0,
     clk1     => ACLK,
     address1 => int_comb_5_0_address1,
     ce1      => int_comb_5_0_ce1,
     we1      => int_comb_5_0_we1,
     be1      => int_comb_5_0_be1,
     d1       => int_comb_5_0_d1,
     q1       => int_comb_5_0_q1);
-- int_comb_5_1
int_comb_5_1 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_5_1_address0,
     ce0      => int_comb_5_1_ce0,
     we0      => int_comb_5_1_we0,
     be0      => int_comb_5_1_be0,
     d0       => int_comb_5_1_d0,
     q0       => int_comb_5_1_q0,
     clk1     => ACLK,
     address1 => int_comb_5_1_address1,
     ce1      => int_comb_5_1_ce1,
     we1      => int_comb_5_1_we1,
     be1      => int_comb_5_1_be1,
     d1       => int_comb_5_1_d1,
     q1       => int_comb_5_1_q1);
-- int_comb_6_0
int_comb_6_0 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_6_0_address0,
     ce0      => int_comb_6_0_ce0,
     we0      => int_comb_6_0_we0,
     be0      => int_comb_6_0_be0,
     d0       => int_comb_6_0_d0,
     q0       => int_comb_6_0_q0,
     clk1     => ACLK,
     address1 => int_comb_6_0_address1,
     ce1      => int_comb_6_0_ce1,
     we1      => int_comb_6_0_we1,
     be1      => int_comb_6_0_be1,
     d1       => int_comb_6_0_d1,
     q1       => int_comb_6_0_q1);
-- int_comb_6_1
int_comb_6_1 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_6_1_address0,
     ce0      => int_comb_6_1_ce0,
     we0      => int_comb_6_1_we0,
     be0      => int_comb_6_1_be0,
     d0       => int_comb_6_1_d0,
     q0       => int_comb_6_1_q0,
     clk1     => ACLK,
     address1 => int_comb_6_1_address1,
     ce1      => int_comb_6_1_ce1,
     we1      => int_comb_6_1_we1,
     be1      => int_comb_6_1_be1,
     d1       => int_comb_6_1_d1,
     q1       => int_comb_6_1_q1);
-- int_comb_7_0
int_comb_7_0 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_7_0_address0,
     ce0      => int_comb_7_0_ce0,
     we0      => int_comb_7_0_we0,
     be0      => int_comb_7_0_be0,
     d0       => int_comb_7_0_d0,
     q0       => int_comb_7_0_q0,
     clk1     => ACLK,
     address1 => int_comb_7_0_address1,
     ce1      => int_comb_7_0_ce1,
     we1      => int_comb_7_0_we1,
     be1      => int_comb_7_0_be1,
     d1       => int_comb_7_0_d1,
     q1       => int_comb_7_0_q1);
-- int_comb_7_1
int_comb_7_1 : dac_table_axilite_control_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 16384,
     AWIDTH   => log2(16384))
port map (
     clk0     => ACLK,
     address0 => int_comb_7_1_address0,
     ce0      => int_comb_7_1_ce0,
     we0      => int_comb_7_1_we0,
     be0      => int_comb_7_1_be0,
     d0       => int_comb_7_1_d0,
     q0       => int_comb_7_1_q0,
     clk1     => ACLK,
     address1 => int_comb_7_1_address1,
     ce1      => int_comb_7_1_ce1,
     we1      => int_comb_7_1_we1,
     be1      => int_comb_7_1_be1,
     d1       => int_comb_7_1_d1,
     q1       => int_comb_7_1_q1);

-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) and (int_comb_0_0_read = '0') and (int_comb_0_1_read = '0') and (int_comb_1_0_read = '0') and (int_comb_1_1_read = '0') and (int_comb_2_0_read = '0') and (int_comb_2_1_read = '0') and (int_comb_3_0_read = '0') and (int_comb_3_1_read = '0') and (int_comb_4_0_read = '0') and (int_comb_4_1_read = '0') and (int_comb_5_0_read = '0') and (int_comb_5_1_read = '0') and (int_comb_6_0_read = '0') and (int_comb_6_1_read = '0') and (int_comb_7_0_read = '0') and (int_comb_7_1_read = '0') else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    case (TO_INTEGER(raddr)) is
                    when ADDR_AP_CTRL =>
                        rdata_data <= (7 => int_auto_restart, 3 => int_ap_ready, 2 => int_ap_idle, 1 => int_ap_done, 0 => int_ap_start, others => '0');
                    when ADDR_GIE =>
                        rdata_data <= (0 => int_gie, others => '0');
                    when ADDR_IER =>
                        rdata_data <= (1 => int_ier(1), 0 => int_ier(0), others => '0');
                    when ADDR_ISR =>
                        rdata_data <= (1 => int_isr(1), 0 => int_isr(0), others => '0');
                    when ADDR_LENGTH_V_DATA_0 =>
                        rdata_data <= RESIZE(int_length_V(14 downto 0), 32);
                    when ADDR_TLAST_DATA_0 =>
                        rdata_data <= RESIZE(int_tlast(0 downto 0), 32);
                    when ADDR_REPLAY_LENGTH_V_DATA_0 =>
                        rdata_data <= RESIZE(int_replay_length_V(14 downto 0), 32);
                    when ADDR_RUN_DATA_0 =>
                        rdata_data <= RESIZE(int_run(0 downto 0), 32);
                    when others =>
                        rdata_data <= (others => '0');
                    end case;
                elsif (int_comb_0_0_read = '1') then
                    rdata_data <= int_comb_0_0_q1;
                elsif (int_comb_0_1_read = '1') then
                    rdata_data <= int_comb_0_1_q1;
                elsif (int_comb_1_0_read = '1') then
                    rdata_data <= int_comb_1_0_q1;
                elsif (int_comb_1_1_read = '1') then
                    rdata_data <= int_comb_1_1_q1;
                elsif (int_comb_2_0_read = '1') then
                    rdata_data <= int_comb_2_0_q1;
                elsif (int_comb_2_1_read = '1') then
                    rdata_data <= int_comb_2_1_q1;
                elsif (int_comb_3_0_read = '1') then
                    rdata_data <= int_comb_3_0_q1;
                elsif (int_comb_3_1_read = '1') then
                    rdata_data <= int_comb_3_1_q1;
                elsif (int_comb_4_0_read = '1') then
                    rdata_data <= int_comb_4_0_q1;
                elsif (int_comb_4_1_read = '1') then
                    rdata_data <= int_comb_4_1_q1;
                elsif (int_comb_5_0_read = '1') then
                    rdata_data <= int_comb_5_0_q1;
                elsif (int_comb_5_1_read = '1') then
                    rdata_data <= int_comb_5_1_q1;
                elsif (int_comb_6_0_read = '1') then
                    rdata_data <= int_comb_6_0_q1;
                elsif (int_comb_6_1_read = '1') then
                    rdata_data <= int_comb_6_1_q1;
                elsif (int_comb_7_0_read = '1') then
                    rdata_data <= int_comb_7_0_q1;
                elsif (int_comb_7_1_read = '1') then
                    rdata_data <= int_comb_7_1_q1;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    interrupt            <= int_gie and (int_isr(0) or int_isr(1));
    ap_start             <= int_ap_start;
    length_V             <= STD_LOGIC_VECTOR(int_length_V);
    tlast                <= STD_LOGIC_VECTOR(int_tlast);
    replay_length_V      <= STD_LOGIC_VECTOR(int_replay_length_V);
    run                  <= STD_LOGIC_VECTOR(int_run);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_start <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(0) = '1') then
                    int_ap_start <= '1';
                elsif (ap_ready = '1') then
                    int_ap_start <= int_auto_restart; -- clear on handshake/auto restart
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (ap_done = '1') then
                    int_ap_done <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_ap_done <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_idle <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_idle <= ap_idle;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_ready <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_ready <= ap_ready;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_auto_restart <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1') then
                    int_auto_restart <= WDATA(7);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_gie <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GIE and WSTRB(0) = '1') then
                    int_gie <= WDATA(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ier <= "00";
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IER and WSTRB(0) = '1') then
                    int_ier <= UNSIGNED(WDATA(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(0) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(0) = '1' and ap_done = '1') then
                    int_isr(0) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(0) <= int_isr(0) xor WDATA(0); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(1) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(1) = '1' and ap_ready = '1') then
                    int_isr(1) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(1) <= int_isr(1) xor WDATA(1); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_LENGTH_V_DATA_0) then
                    int_length_V(14 downto 0) <= (UNSIGNED(WDATA(14 downto 0)) and wmask(14 downto 0)) or ((not wmask(14 downto 0)) and int_length_V(14 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_TLAST_DATA_0) then
                    int_tlast(0 downto 0) <= (UNSIGNED(WDATA(0 downto 0)) and wmask(0 downto 0)) or ((not wmask(0 downto 0)) and int_tlast(0 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_REPLAY_LENGTH_V_DATA_0) then
                    int_replay_length_V(14 downto 0) <= (UNSIGNED(WDATA(14 downto 0)) and wmask(14 downto 0)) or ((not wmask(14 downto 0)) and int_replay_length_V(14 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_RUN_DATA_0) then
                    int_run(0 downto 0) <= (UNSIGNED(WDATA(0 downto 0)) and wmask(0 downto 0)) or ((not wmask(0 downto 0)) and int_run(0 downto 0));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------
    -- comb_0_0
    int_comb_0_0_address0 <= SHIFT_RIGHT(UNSIGNED(comb_0_0_address0), 1)(13 downto 0);
    int_comb_0_0_ce0     <= comb_0_0_ce0;
    int_comb_0_0_we0     <= '0';
    int_comb_0_0_be0     <= (others => '0');
    int_comb_0_0_d0      <= (others => '0');
    comb_0_0_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_0_0_q0, TO_INTEGER(int_comb_0_0_shift) * 16)(15 downto 0));
    int_comb_0_0_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_0_0_ce1     <= '1' when ar_hs = '1' or (int_comb_0_0_write = '1' and WVALID  = '1') else '0';
    int_comb_0_0_we1     <= '1' when int_comb_0_0_write = '1' and WVALID = '1' else '0';
    int_comb_0_0_be1     <= UNSIGNED(WSTRB);
    int_comb_0_0_d1      <= UNSIGNED(WDATA);
    -- comb_0_1
    int_comb_0_1_address0 <= SHIFT_RIGHT(UNSIGNED(comb_0_1_address0), 1)(13 downto 0);
    int_comb_0_1_ce0     <= comb_0_1_ce0;
    int_comb_0_1_we0     <= '0';
    int_comb_0_1_be0     <= (others => '0');
    int_comb_0_1_d0      <= (others => '0');
    comb_0_1_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_0_1_q0, TO_INTEGER(int_comb_0_1_shift) * 16)(15 downto 0));
    int_comb_0_1_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_0_1_ce1     <= '1' when ar_hs = '1' or (int_comb_0_1_write = '1' and WVALID  = '1') else '0';
    int_comb_0_1_we1     <= '1' when int_comb_0_1_write = '1' and WVALID = '1' else '0';
    int_comb_0_1_be1     <= UNSIGNED(WSTRB);
    int_comb_0_1_d1      <= UNSIGNED(WDATA);
    -- comb_1_0
    int_comb_1_0_address0 <= SHIFT_RIGHT(UNSIGNED(comb_1_0_address0), 1)(13 downto 0);
    int_comb_1_0_ce0     <= comb_1_0_ce0;
    int_comb_1_0_we0     <= '0';
    int_comb_1_0_be0     <= (others => '0');
    int_comb_1_0_d0      <= (others => '0');
    comb_1_0_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_1_0_q0, TO_INTEGER(int_comb_1_0_shift) * 16)(15 downto 0));
    int_comb_1_0_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_1_0_ce1     <= '1' when ar_hs = '1' or (int_comb_1_0_write = '1' and WVALID  = '1') else '0';
    int_comb_1_0_we1     <= '1' when int_comb_1_0_write = '1' and WVALID = '1' else '0';
    int_comb_1_0_be1     <= UNSIGNED(WSTRB);
    int_comb_1_0_d1      <= UNSIGNED(WDATA);
    -- comb_1_1
    int_comb_1_1_address0 <= SHIFT_RIGHT(UNSIGNED(comb_1_1_address0), 1)(13 downto 0);
    int_comb_1_1_ce0     <= comb_1_1_ce0;
    int_comb_1_1_we0     <= '0';
    int_comb_1_1_be0     <= (others => '0');
    int_comb_1_1_d0      <= (others => '0');
    comb_1_1_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_1_1_q0, TO_INTEGER(int_comb_1_1_shift) * 16)(15 downto 0));
    int_comb_1_1_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_1_1_ce1     <= '1' when ar_hs = '1' or (int_comb_1_1_write = '1' and WVALID  = '1') else '0';
    int_comb_1_1_we1     <= '1' when int_comb_1_1_write = '1' and WVALID = '1' else '0';
    int_comb_1_1_be1     <= UNSIGNED(WSTRB);
    int_comb_1_1_d1      <= UNSIGNED(WDATA);
    -- comb_2_0
    int_comb_2_0_address0 <= SHIFT_RIGHT(UNSIGNED(comb_2_0_address0), 1)(13 downto 0);
    int_comb_2_0_ce0     <= comb_2_0_ce0;
    int_comb_2_0_we0     <= '0';
    int_comb_2_0_be0     <= (others => '0');
    int_comb_2_0_d0      <= (others => '0');
    comb_2_0_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_2_0_q0, TO_INTEGER(int_comb_2_0_shift) * 16)(15 downto 0));
    int_comb_2_0_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_2_0_ce1     <= '1' when ar_hs = '1' or (int_comb_2_0_write = '1' and WVALID  = '1') else '0';
    int_comb_2_0_we1     <= '1' when int_comb_2_0_write = '1' and WVALID = '1' else '0';
    int_comb_2_0_be1     <= UNSIGNED(WSTRB);
    int_comb_2_0_d1      <= UNSIGNED(WDATA);
    -- comb_2_1
    int_comb_2_1_address0 <= SHIFT_RIGHT(UNSIGNED(comb_2_1_address0), 1)(13 downto 0);
    int_comb_2_1_ce0     <= comb_2_1_ce0;
    int_comb_2_1_we0     <= '0';
    int_comb_2_1_be0     <= (others => '0');
    int_comb_2_1_d0      <= (others => '0');
    comb_2_1_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_2_1_q0, TO_INTEGER(int_comb_2_1_shift) * 16)(15 downto 0));
    int_comb_2_1_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_2_1_ce1     <= '1' when ar_hs = '1' or (int_comb_2_1_write = '1' and WVALID  = '1') else '0';
    int_comb_2_1_we1     <= '1' when int_comb_2_1_write = '1' and WVALID = '1' else '0';
    int_comb_2_1_be1     <= UNSIGNED(WSTRB);
    int_comb_2_1_d1      <= UNSIGNED(WDATA);
    -- comb_3_0
    int_comb_3_0_address0 <= SHIFT_RIGHT(UNSIGNED(comb_3_0_address0), 1)(13 downto 0);
    int_comb_3_0_ce0     <= comb_3_0_ce0;
    int_comb_3_0_we0     <= '0';
    int_comb_3_0_be0     <= (others => '0');
    int_comb_3_0_d0      <= (others => '0');
    comb_3_0_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_3_0_q0, TO_INTEGER(int_comb_3_0_shift) * 16)(15 downto 0));
    int_comb_3_0_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_3_0_ce1     <= '1' when ar_hs = '1' or (int_comb_3_0_write = '1' and WVALID  = '1') else '0';
    int_comb_3_0_we1     <= '1' when int_comb_3_0_write = '1' and WVALID = '1' else '0';
    int_comb_3_0_be1     <= UNSIGNED(WSTRB);
    int_comb_3_0_d1      <= UNSIGNED(WDATA);
    -- comb_3_1
    int_comb_3_1_address0 <= SHIFT_RIGHT(UNSIGNED(comb_3_1_address0), 1)(13 downto 0);
    int_comb_3_1_ce0     <= comb_3_1_ce0;
    int_comb_3_1_we0     <= '0';
    int_comb_3_1_be0     <= (others => '0');
    int_comb_3_1_d0      <= (others => '0');
    comb_3_1_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_3_1_q0, TO_INTEGER(int_comb_3_1_shift) * 16)(15 downto 0));
    int_comb_3_1_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_3_1_ce1     <= '1' when ar_hs = '1' or (int_comb_3_1_write = '1' and WVALID  = '1') else '0';
    int_comb_3_1_we1     <= '1' when int_comb_3_1_write = '1' and WVALID = '1' else '0';
    int_comb_3_1_be1     <= UNSIGNED(WSTRB);
    int_comb_3_1_d1      <= UNSIGNED(WDATA);
    -- comb_4_0
    int_comb_4_0_address0 <= SHIFT_RIGHT(UNSIGNED(comb_4_0_address0), 1)(13 downto 0);
    int_comb_4_0_ce0     <= comb_4_0_ce0;
    int_comb_4_0_we0     <= '0';
    int_comb_4_0_be0     <= (others => '0');
    int_comb_4_0_d0      <= (others => '0');
    comb_4_0_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_4_0_q0, TO_INTEGER(int_comb_4_0_shift) * 16)(15 downto 0));
    int_comb_4_0_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_4_0_ce1     <= '1' when ar_hs = '1' or (int_comb_4_0_write = '1' and WVALID  = '1') else '0';
    int_comb_4_0_we1     <= '1' when int_comb_4_0_write = '1' and WVALID = '1' else '0';
    int_comb_4_0_be1     <= UNSIGNED(WSTRB);
    int_comb_4_0_d1      <= UNSIGNED(WDATA);
    -- comb_4_1
    int_comb_4_1_address0 <= SHIFT_RIGHT(UNSIGNED(comb_4_1_address0), 1)(13 downto 0);
    int_comb_4_1_ce0     <= comb_4_1_ce0;
    int_comb_4_1_we0     <= '0';
    int_comb_4_1_be0     <= (others => '0');
    int_comb_4_1_d0      <= (others => '0');
    comb_4_1_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_4_1_q0, TO_INTEGER(int_comb_4_1_shift) * 16)(15 downto 0));
    int_comb_4_1_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_4_1_ce1     <= '1' when ar_hs = '1' or (int_comb_4_1_write = '1' and WVALID  = '1') else '0';
    int_comb_4_1_we1     <= '1' when int_comb_4_1_write = '1' and WVALID = '1' else '0';
    int_comb_4_1_be1     <= UNSIGNED(WSTRB);
    int_comb_4_1_d1      <= UNSIGNED(WDATA);
    -- comb_5_0
    int_comb_5_0_address0 <= SHIFT_RIGHT(UNSIGNED(comb_5_0_address0), 1)(13 downto 0);
    int_comb_5_0_ce0     <= comb_5_0_ce0;
    int_comb_5_0_we0     <= '0';
    int_comb_5_0_be0     <= (others => '0');
    int_comb_5_0_d0      <= (others => '0');
    comb_5_0_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_5_0_q0, TO_INTEGER(int_comb_5_0_shift) * 16)(15 downto 0));
    int_comb_5_0_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_5_0_ce1     <= '1' when ar_hs = '1' or (int_comb_5_0_write = '1' and WVALID  = '1') else '0';
    int_comb_5_0_we1     <= '1' when int_comb_5_0_write = '1' and WVALID = '1' else '0';
    int_comb_5_0_be1     <= UNSIGNED(WSTRB);
    int_comb_5_0_d1      <= UNSIGNED(WDATA);
    -- comb_5_1
    int_comb_5_1_address0 <= SHIFT_RIGHT(UNSIGNED(comb_5_1_address0), 1)(13 downto 0);
    int_comb_5_1_ce0     <= comb_5_1_ce0;
    int_comb_5_1_we0     <= '0';
    int_comb_5_1_be0     <= (others => '0');
    int_comb_5_1_d0      <= (others => '0');
    comb_5_1_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_5_1_q0, TO_INTEGER(int_comb_5_1_shift) * 16)(15 downto 0));
    int_comb_5_1_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_5_1_ce1     <= '1' when ar_hs = '1' or (int_comb_5_1_write = '1' and WVALID  = '1') else '0';
    int_comb_5_1_we1     <= '1' when int_comb_5_1_write = '1' and WVALID = '1' else '0';
    int_comb_5_1_be1     <= UNSIGNED(WSTRB);
    int_comb_5_1_d1      <= UNSIGNED(WDATA);
    -- comb_6_0
    int_comb_6_0_address0 <= SHIFT_RIGHT(UNSIGNED(comb_6_0_address0), 1)(13 downto 0);
    int_comb_6_0_ce0     <= comb_6_0_ce0;
    int_comb_6_0_we0     <= '0';
    int_comb_6_0_be0     <= (others => '0');
    int_comb_6_0_d0      <= (others => '0');
    comb_6_0_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_6_0_q0, TO_INTEGER(int_comb_6_0_shift) * 16)(15 downto 0));
    int_comb_6_0_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_6_0_ce1     <= '1' when ar_hs = '1' or (int_comb_6_0_write = '1' and WVALID  = '1') else '0';
    int_comb_6_0_we1     <= '1' when int_comb_6_0_write = '1' and WVALID = '1' else '0';
    int_comb_6_0_be1     <= UNSIGNED(WSTRB);
    int_comb_6_0_d1      <= UNSIGNED(WDATA);
    -- comb_6_1
    int_comb_6_1_address0 <= SHIFT_RIGHT(UNSIGNED(comb_6_1_address0), 1)(13 downto 0);
    int_comb_6_1_ce0     <= comb_6_1_ce0;
    int_comb_6_1_we0     <= '0';
    int_comb_6_1_be0     <= (others => '0');
    int_comb_6_1_d0      <= (others => '0');
    comb_6_1_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_6_1_q0, TO_INTEGER(int_comb_6_1_shift) * 16)(15 downto 0));
    int_comb_6_1_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_6_1_ce1     <= '1' when ar_hs = '1' or (int_comb_6_1_write = '1' and WVALID  = '1') else '0';
    int_comb_6_1_we1     <= '1' when int_comb_6_1_write = '1' and WVALID = '1' else '0';
    int_comb_6_1_be1     <= UNSIGNED(WSTRB);
    int_comb_6_1_d1      <= UNSIGNED(WDATA);
    -- comb_7_0
    int_comb_7_0_address0 <= SHIFT_RIGHT(UNSIGNED(comb_7_0_address0), 1)(13 downto 0);
    int_comb_7_0_ce0     <= comb_7_0_ce0;
    int_comb_7_0_we0     <= '0';
    int_comb_7_0_be0     <= (others => '0');
    int_comb_7_0_d0      <= (others => '0');
    comb_7_0_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_7_0_q0, TO_INTEGER(int_comb_7_0_shift) * 16)(15 downto 0));
    int_comb_7_0_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_7_0_ce1     <= '1' when ar_hs = '1' or (int_comb_7_0_write = '1' and WVALID  = '1') else '0';
    int_comb_7_0_we1     <= '1' when int_comb_7_0_write = '1' and WVALID = '1' else '0';
    int_comb_7_0_be1     <= UNSIGNED(WSTRB);
    int_comb_7_0_d1      <= UNSIGNED(WDATA);
    -- comb_7_1
    int_comb_7_1_address0 <= SHIFT_RIGHT(UNSIGNED(comb_7_1_address0), 1)(13 downto 0);
    int_comb_7_1_ce0     <= comb_7_1_ce0;
    int_comb_7_1_we0     <= '0';
    int_comb_7_1_be0     <= (others => '0');
    int_comb_7_1_d0      <= (others => '0');
    comb_7_1_q0          <= STD_LOGIC_VECTOR(SHIFT_RIGHT(int_comb_7_1_q0, TO_INTEGER(int_comb_7_1_shift) * 16)(15 downto 0));
    int_comb_7_1_address1 <= raddr(15 downto 2) when ar_hs = '1' else waddr(15 downto 2);
    int_comb_7_1_ce1     <= '1' when ar_hs = '1' or (int_comb_7_1_write = '1' and WVALID  = '1') else '0';
    int_comb_7_1_we1     <= '1' when int_comb_7_1_write = '1' and WVALID = '1' else '0';
    int_comb_7_1_be1     <= UNSIGNED(WSTRB);
    int_comb_7_1_d1      <= UNSIGNED(WDATA);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_0_0_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_0_0_BASE and raddr <= ADDR_COMB_0_0_HIGH) then
                    int_comb_0_0_read <= '1';
                else
                    int_comb_0_0_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_0_0_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_0_0_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_0_0_HIGH) then
                    int_comb_0_0_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_0_0_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_0_0_ce0 = '1') then
                    int_comb_0_0_shift(0) <= comb_0_0_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_0_1_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_0_1_BASE and raddr <= ADDR_COMB_0_1_HIGH) then
                    int_comb_0_1_read <= '1';
                else
                    int_comb_0_1_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_0_1_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_0_1_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_0_1_HIGH) then
                    int_comb_0_1_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_0_1_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_0_1_ce0 = '1') then
                    int_comb_0_1_shift(0) <= comb_0_1_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_1_0_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_1_0_BASE and raddr <= ADDR_COMB_1_0_HIGH) then
                    int_comb_1_0_read <= '1';
                else
                    int_comb_1_0_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_1_0_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_1_0_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_1_0_HIGH) then
                    int_comb_1_0_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_1_0_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_1_0_ce0 = '1') then
                    int_comb_1_0_shift(0) <= comb_1_0_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_1_1_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_1_1_BASE and raddr <= ADDR_COMB_1_1_HIGH) then
                    int_comb_1_1_read <= '1';
                else
                    int_comb_1_1_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_1_1_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_1_1_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_1_1_HIGH) then
                    int_comb_1_1_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_1_1_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_1_1_ce0 = '1') then
                    int_comb_1_1_shift(0) <= comb_1_1_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_2_0_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_2_0_BASE and raddr <= ADDR_COMB_2_0_HIGH) then
                    int_comb_2_0_read <= '1';
                else
                    int_comb_2_0_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_2_0_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_2_0_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_2_0_HIGH) then
                    int_comb_2_0_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_2_0_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_2_0_ce0 = '1') then
                    int_comb_2_0_shift(0) <= comb_2_0_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_2_1_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_2_1_BASE and raddr <= ADDR_COMB_2_1_HIGH) then
                    int_comb_2_1_read <= '1';
                else
                    int_comb_2_1_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_2_1_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_2_1_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_2_1_HIGH) then
                    int_comb_2_1_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_2_1_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_2_1_ce0 = '1') then
                    int_comb_2_1_shift(0) <= comb_2_1_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_3_0_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_3_0_BASE and raddr <= ADDR_COMB_3_0_HIGH) then
                    int_comb_3_0_read <= '1';
                else
                    int_comb_3_0_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_3_0_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_3_0_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_3_0_HIGH) then
                    int_comb_3_0_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_3_0_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_3_0_ce0 = '1') then
                    int_comb_3_0_shift(0) <= comb_3_0_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_3_1_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_3_1_BASE and raddr <= ADDR_COMB_3_1_HIGH) then
                    int_comb_3_1_read <= '1';
                else
                    int_comb_3_1_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_3_1_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_3_1_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_3_1_HIGH) then
                    int_comb_3_1_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_3_1_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_3_1_ce0 = '1') then
                    int_comb_3_1_shift(0) <= comb_3_1_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_4_0_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_4_0_BASE and raddr <= ADDR_COMB_4_0_HIGH) then
                    int_comb_4_0_read <= '1';
                else
                    int_comb_4_0_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_4_0_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_4_0_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_4_0_HIGH) then
                    int_comb_4_0_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_4_0_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_4_0_ce0 = '1') then
                    int_comb_4_0_shift(0) <= comb_4_0_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_4_1_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_4_1_BASE and raddr <= ADDR_COMB_4_1_HIGH) then
                    int_comb_4_1_read <= '1';
                else
                    int_comb_4_1_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_4_1_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_4_1_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_4_1_HIGH) then
                    int_comb_4_1_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_4_1_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_4_1_ce0 = '1') then
                    int_comb_4_1_shift(0) <= comb_4_1_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_5_0_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_5_0_BASE and raddr <= ADDR_COMB_5_0_HIGH) then
                    int_comb_5_0_read <= '1';
                else
                    int_comb_5_0_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_5_0_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_5_0_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_5_0_HIGH) then
                    int_comb_5_0_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_5_0_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_5_0_ce0 = '1') then
                    int_comb_5_0_shift(0) <= comb_5_0_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_5_1_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_5_1_BASE and raddr <= ADDR_COMB_5_1_HIGH) then
                    int_comb_5_1_read <= '1';
                else
                    int_comb_5_1_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_5_1_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_5_1_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_5_1_HIGH) then
                    int_comb_5_1_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_5_1_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_5_1_ce0 = '1') then
                    int_comb_5_1_shift(0) <= comb_5_1_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_6_0_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_6_0_BASE and raddr <= ADDR_COMB_6_0_HIGH) then
                    int_comb_6_0_read <= '1';
                else
                    int_comb_6_0_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_6_0_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_6_0_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_6_0_HIGH) then
                    int_comb_6_0_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_6_0_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_6_0_ce0 = '1') then
                    int_comb_6_0_shift(0) <= comb_6_0_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_6_1_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_6_1_BASE and raddr <= ADDR_COMB_6_1_HIGH) then
                    int_comb_6_1_read <= '1';
                else
                    int_comb_6_1_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_6_1_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_6_1_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_6_1_HIGH) then
                    int_comb_6_1_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_6_1_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_6_1_ce0 = '1') then
                    int_comb_6_1_shift(0) <= comb_6_1_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_7_0_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_7_0_BASE and raddr <= ADDR_COMB_7_0_HIGH) then
                    int_comb_7_0_read <= '1';
                else
                    int_comb_7_0_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_7_0_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_7_0_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_7_0_HIGH) then
                    int_comb_7_0_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_7_0_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_7_0_ce0 = '1') then
                    int_comb_7_0_shift(0) <= comb_7_0_address0(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_7_1_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_COMB_7_1_BASE and raddr <= ADDR_COMB_7_1_HIGH) then
                    int_comb_7_1_read <= '1';
                else
                    int_comb_7_1_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_comb_7_1_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_COMB_7_1_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_COMB_7_1_HIGH) then
                    int_comb_7_1_write <= '1';
                elsif (WVALID = '1') then
                    int_comb_7_1_write <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (comb_7_1_ce0 = '1') then
                    int_comb_7_1_shift(0) <= comb_7_1_address0(0);
                end if;
            end if;
        end if;
    end process;


end architecture behave;

library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity dac_table_axilite_control_s_axi_ram is
    generic (
        BYTES   : INTEGER :=4;
        DEPTH   : INTEGER :=256;
        AWIDTH  : INTEGER :=8);
    port (
        clk0    : in  STD_LOGIC;
        address0: in  UNSIGNED(AWIDTH-1 downto 0);
        ce0     : in  STD_LOGIC;
        we0     : in  STD_LOGIC;
        be0     : in  UNSIGNED(BYTES-1 downto 0);
        d0      : in  UNSIGNED(BYTES*8-1 downto 0);
        q0      : out UNSIGNED(BYTES*8-1 downto 0);
        clk1    : in  STD_LOGIC;
        address1: in  UNSIGNED(AWIDTH-1 downto 0);
        ce1     : in  STD_LOGIC;
        we1     : in  STD_LOGIC;
        be1     : in  UNSIGNED(BYTES-1 downto 0);
        d1      : in  UNSIGNED(BYTES*8-1 downto 0);
        q1      : out UNSIGNED(BYTES*8-1 downto 0));

end entity dac_table_axilite_control_s_axi_ram;

architecture behave of dac_table_axilite_control_s_axi_ram is
    signal address0_tmp : UNSIGNED(AWIDTH-1 downto 0);
    signal address1_tmp : UNSIGNED(AWIDTH-1 downto 0);
    type RAM_T is array (0 to DEPTH - 1) of UNSIGNED(BYTES*8 - 1 downto 0);
    shared variable mem : RAM_T := (others => (others => '0'));
begin

    process (address0)
    begin
    address0_tmp <= address0;
    --synthesis translate_off
          if (address0 > DEPTH-1) then
              address0_tmp <= (others => '0');
          else
              address0_tmp <= address0;
          end if;
    --synthesis translate_on
    end process;

    process (address1)
    begin
    address1_tmp <= address1;
    --synthesis translate_off
          if (address1 > DEPTH-1) then
              address1_tmp <= (others => '0');
          else
              address1_tmp <= address1;
          end if;
    --synthesis translate_on
    end process;

    --read port 0
    process (clk0) begin
        if (clk0'event and clk0 = '1') then
            if (ce0 = '1') then
                q0 <= mem(to_integer(address0_tmp));
            end if;
        end if;
    end process;

    --read port 1
    process (clk1) begin
        if (clk1'event and clk1 = '1') then
            if (ce1 = '1') then
                q1 <= mem(to_integer(address1_tmp));
            end if;
        end if;
    end process;

    gen_write : for i in 0 to BYTES - 1 generate
    begin
        --write port 0
        process (clk0)
        begin
            if (clk0'event and clk0 = '1') then
                if (ce0 = '1' and we0 = '1' and be0(i) = '1') then
                    mem(to_integer(address0_tmp))(8*i+7 downto 8*i) := d0(8*i+7 downto 8*i);
                end if;
            end if;
        end process;

        --write port 1
        process (clk1)
        begin
            if (clk1'event and clk1 = '1') then
                if (ce1 = '1' and we1 = '1' and be1(i) = '1') then
                    mem(to_integer(address1_tmp))(8*i+7 downto 8*i) := d1(8*i+7 downto 8*i);
                end if;
            end if;
        end process;

    end generate;

end architecture behave;


