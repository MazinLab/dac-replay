// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="dac_table_8x_dac_table_8x,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=1.818000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.280000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=226,HLS_SYN_LUT=204,HLS_VERSION=2022_1}" *)

module dac_table_8x (
        ap_clk,
        ap_rst_n,
        iout_TREADY,
        qout_TREADY,
        iqout_TREADY,
        table_r_address0,
        table_r_ce0,
        table_r_q0,
        iout_TDATA,
        iout_TVALID,
        iout_TKEEP,
        iout_TSTRB,
        iout_TLAST,
        qout_TDATA,
        qout_TVALID,
        qout_TKEEP,
        qout_TSTRB,
        qout_TLAST,
        iqout_TDATA,
        iqout_TVALID,
        iqout_TKEEP,
        iqout_TSTRB,
        iqout_TUSER,
        iqout_TLAST,
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP,
        interrupt
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;
parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 5;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
input   iout_TREADY;
input   qout_TREADY;
input   iqout_TREADY;
output  [15:0] table_r_address0;
output   table_r_ce0;
input  [255:0] table_r_q0;
output  [127:0] iout_TDATA;
output   iout_TVALID;
output  [15:0] iout_TKEEP;
output  [15:0] iout_TSTRB;
output  [0:0] iout_TLAST;
output  [127:0] qout_TDATA;
output   qout_TVALID;
output  [15:0] qout_TKEEP;
output  [15:0] qout_TSTRB;
output  [0:0] qout_TLAST;
output  [255:0] iqout_TDATA;
output   iqout_TVALID;
output  [31:0] iqout_TKEEP;
output  [31:0] iqout_TSTRB;
output  [7:0] iqout_TUSER;
output  [0:0] iqout_TLAST;
input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;
output   interrupt;

reg table_r_ce0;

 reg    ap_rst_n_inv;
wire    ap_start;
wire    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_enable_reg_pp0_iter10;
reg    ap_enable_reg_pp0_iter11;
reg    ap_enable_reg_pp0_iter12;
reg    ap_enable_reg_pp0_iter13;
reg    ap_enable_reg_pp0_iter14;
reg    ap_idle_pp0;
wire    ap_ready;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_state7_pp0_stage0_iter6;
wire    ap_block_state8_pp0_stage0_iter7;
wire    ap_block_state9_pp0_stage0_iter8;
wire    ap_block_state10_pp0_stage0_iter9;
wire    ap_block_state11_pp0_stage0_iter10;
wire    ap_block_state12_pp0_stage0_iter11;
wire    ap_block_state13_pp0_stage0_iter12;
wire    regslice_both_iout_V_data_V_U_apdone_blk;
wire    regslice_both_qout_V_data_V_U_apdone_blk;
wire    regslice_both_iqout_V_data_V_U_apdone_blk;
reg    ap_block_state14_pp0_stage0_iter13;
reg    ap_block_state14_io;
reg    ap_block_state15_pp0_stage0_iter14;
reg    ap_block_state15_io;
wire    ap_loop_exit_ready;
reg    ap_loop_exit_ready_pp0_iter13_reg;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] run_read_read_fu_158_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
reg    ap_ready_int;
wire    run;
reg    iout_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    qout_TDATA_blk_n;
reg    iqout_TDATA_blk_n;
reg   [0:0] run_read_reg_486;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] set_tlast_fu_252_p2;
reg   [0:0] set_tlast_reg_490;
reg   [0:0] set_tlast_reg_490_pp0_iter2_reg;
reg   [0:0] set_tlast_reg_490_pp0_iter3_reg;
reg   [0:0] set_tlast_reg_490_pp0_iter4_reg;
reg   [0:0] set_tlast_reg_490_pp0_iter5_reg;
reg   [0:0] set_tlast_reg_490_pp0_iter6_reg;
reg   [0:0] set_tlast_reg_490_pp0_iter7_reg;
reg   [0:0] set_tlast_reg_490_pp0_iter8_reg;
reg   [0:0] set_tlast_reg_490_pp0_iter9_reg;
reg   [0:0] set_tlast_reg_490_pp0_iter10_reg;
reg   [0:0] set_tlast_reg_490_pp0_iter11_reg;
reg   [0:0] set_tlast_reg_490_pp0_iter12_reg;
wire   [7:0] iqtmp_user_V_fu_263_p1;
reg   [7:0] iqtmp_user_V_reg_502;
reg   [7:0] iqtmp_user_V_reg_502_pp0_iter2_reg;
reg   [7:0] iqtmp_user_V_reg_502_pp0_iter3_reg;
reg   [7:0] iqtmp_user_V_reg_502_pp0_iter4_reg;
reg   [7:0] iqtmp_user_V_reg_502_pp0_iter5_reg;
reg   [7:0] iqtmp_user_V_reg_502_pp0_iter6_reg;
reg   [7:0] iqtmp_user_V_reg_502_pp0_iter7_reg;
reg   [7:0] iqtmp_user_V_reg_502_pp0_iter8_reg;
reg   [7:0] iqtmp_user_V_reg_502_pp0_iter9_reg;
reg   [7:0] iqtmp_user_V_reg_502_pp0_iter10_reg;
reg   [7:0] iqtmp_user_V_reg_502_pp0_iter11_reg;
reg   [7:0] iqtmp_user_V_reg_502_pp0_iter12_reg;
reg    ap_condition_exit_pp0_iter1_stage0;
wire   [63:0] zext_ln587_fu_258_p1;
reg   [15:0] p_Val2_s_fu_154;
wire   [15:0] sample_group_V_fu_242_p2;
wire    ap_loop_init;
reg    ap_block_pp0_stage0_01001;
wire   [7:0] trunc_ln674_fu_248_p1;
wire   [15:0] tmp_14_fu_432_p4;
wire   [15:0] tmp_13_fu_422_p4;
wire   [15:0] tmp_12_fu_412_p4;
wire   [15:0] tmp_11_fu_402_p4;
wire   [15:0] tmp_10_fu_392_p4;
wire   [15:0] tmp_1_fu_382_p4;
wire   [15:0] tmp_9_fu_372_p4;
wire   [15:0] tmp_6_fu_362_p4;
wire   [15:0] tmp_3_fu_352_p4;
wire   [15:0] tmp_s_fu_342_p4;
wire   [15:0] tmp_8_fu_332_p4;
wire   [15:0] tmp_7_fu_322_p4;
wire   [15:0] tmp_5_fu_312_p4;
wire   [15:0] tmp_4_fu_302_p4;
wire   [15:0] tmp_2_fu_292_p4;
wire   [15:0] trunc_ln674_2_fu_288_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg    ap_loop_exit_ready_pp0_iter6_reg;
reg    ap_loop_exit_ready_pp0_iter7_reg;
reg    ap_loop_exit_ready_pp0_iter8_reg;
reg    ap_loop_exit_ready_pp0_iter9_reg;
reg    ap_loop_exit_ready_pp0_iter10_reg;
reg    ap_loop_exit_ready_pp0_iter11_reg;
reg    ap_loop_exit_ready_pp0_iter12_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire   [127:0] iout_TDATA_int_regslice;
reg    iout_TVALID_int_regslice;
wire    iout_TREADY_int_regslice;
wire    regslice_both_iout_V_data_V_U_vld_out;
wire    regslice_both_iout_V_keep_V_U_apdone_blk;
wire    regslice_both_iout_V_keep_V_U_ack_in_dummy;
wire    regslice_both_iout_V_keep_V_U_vld_out;
wire    regslice_both_iout_V_strb_V_U_apdone_blk;
wire    regslice_both_iout_V_strb_V_U_ack_in_dummy;
wire    regslice_both_iout_V_strb_V_U_vld_out;
wire    regslice_both_iout_V_last_V_U_apdone_blk;
wire    regslice_both_iout_V_last_V_U_ack_in_dummy;
wire    regslice_both_iout_V_last_V_U_vld_out;
wire   [127:0] qout_TDATA_int_regslice;
reg    qout_TVALID_int_regslice;
wire    qout_TREADY_int_regslice;
wire    regslice_both_qout_V_data_V_U_vld_out;
wire    regslice_both_qout_V_keep_V_U_apdone_blk;
wire    regslice_both_qout_V_keep_V_U_ack_in_dummy;
wire    regslice_both_qout_V_keep_V_U_vld_out;
wire    regslice_both_qout_V_strb_V_U_apdone_blk;
wire    regslice_both_qout_V_strb_V_U_ack_in_dummy;
wire    regslice_both_qout_V_strb_V_U_vld_out;
wire    regslice_both_qout_V_last_V_U_apdone_blk;
wire    regslice_both_qout_V_last_V_U_ack_in_dummy;
wire    regslice_both_qout_V_last_V_U_vld_out;
wire   [255:0] iqout_TDATA_int_regslice;
reg    iqout_TVALID_int_regslice;
wire    iqout_TREADY_int_regslice;
wire    regslice_both_iqout_V_data_V_U_vld_out;
wire    regslice_both_iqout_V_keep_V_U_apdone_blk;
wire    regslice_both_iqout_V_keep_V_U_ack_in_dummy;
wire    regslice_both_iqout_V_keep_V_U_vld_out;
wire    regslice_both_iqout_V_strb_V_U_apdone_blk;
wire    regslice_both_iqout_V_strb_V_U_ack_in_dummy;
wire    regslice_both_iqout_V_strb_V_U_vld_out;
wire    regslice_both_iqout_V_user_V_U_apdone_blk;
wire    regslice_both_iqout_V_user_V_U_ack_in_dummy;
wire    regslice_both_iqout_V_user_V_U_vld_out;
wire    regslice_both_iqout_V_last_V_U_apdone_blk;
wire    regslice_both_iqout_V_last_V_U_ack_in_dummy;
wire    regslice_both_iqout_V_last_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter11 = 1'b0;
#0 ap_enable_reg_pp0_iter12 = 1'b0;
#0 ap_enable_reg_pp0_iter13 = 1'b0;
#0 ap_enable_reg_pp0_iter14 = 1'b0;
#0 ap_done_reg = 1'b0;
end

dac_table_8x_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .run(run),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

dac_table_8x_flow_control_loop_pipe flow_control_loop_pipe_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int),
    .ap_continue(1'b1)
);

dac_table_8x_regslice_both #(
    .DataWidth( 128 ))
regslice_both_iout_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(iout_TDATA_int_regslice),
    .vld_in(iout_TVALID_int_regslice),
    .ack_in(iout_TREADY_int_regslice),
    .data_out(iout_TDATA),
    .vld_out(regslice_both_iout_V_data_V_U_vld_out),
    .ack_out(iout_TREADY),
    .apdone_blk(regslice_both_iout_V_data_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 16 ))
regslice_both_iout_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(16'd0),
    .vld_in(iout_TVALID_int_regslice),
    .ack_in(regslice_both_iout_V_keep_V_U_ack_in_dummy),
    .data_out(iout_TKEEP),
    .vld_out(regslice_both_iout_V_keep_V_U_vld_out),
    .ack_out(iout_TREADY),
    .apdone_blk(regslice_both_iout_V_keep_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 16 ))
regslice_both_iout_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(16'd0),
    .vld_in(iout_TVALID_int_regslice),
    .ack_in(regslice_both_iout_V_strb_V_U_ack_in_dummy),
    .data_out(iout_TSTRB),
    .vld_out(regslice_both_iout_V_strb_V_U_vld_out),
    .ack_out(iout_TREADY),
    .apdone_blk(regslice_both_iout_V_strb_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 1 ))
regslice_both_iout_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(set_tlast_reg_490_pp0_iter12_reg),
    .vld_in(iout_TVALID_int_regslice),
    .ack_in(regslice_both_iout_V_last_V_U_ack_in_dummy),
    .data_out(iout_TLAST),
    .vld_out(regslice_both_iout_V_last_V_U_vld_out),
    .ack_out(iout_TREADY),
    .apdone_blk(regslice_both_iout_V_last_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 128 ))
regslice_both_qout_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(qout_TDATA_int_regslice),
    .vld_in(qout_TVALID_int_regslice),
    .ack_in(qout_TREADY_int_regslice),
    .data_out(qout_TDATA),
    .vld_out(regslice_both_qout_V_data_V_U_vld_out),
    .ack_out(qout_TREADY),
    .apdone_blk(regslice_both_qout_V_data_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 16 ))
regslice_both_qout_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(16'd0),
    .vld_in(qout_TVALID_int_regslice),
    .ack_in(regslice_both_qout_V_keep_V_U_ack_in_dummy),
    .data_out(qout_TKEEP),
    .vld_out(regslice_both_qout_V_keep_V_U_vld_out),
    .ack_out(qout_TREADY),
    .apdone_blk(regslice_both_qout_V_keep_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 16 ))
regslice_both_qout_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(16'd0),
    .vld_in(qout_TVALID_int_regslice),
    .ack_in(regslice_both_qout_V_strb_V_U_ack_in_dummy),
    .data_out(qout_TSTRB),
    .vld_out(regslice_both_qout_V_strb_V_U_vld_out),
    .ack_out(qout_TREADY),
    .apdone_blk(regslice_both_qout_V_strb_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 1 ))
regslice_both_qout_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(set_tlast_reg_490_pp0_iter12_reg),
    .vld_in(qout_TVALID_int_regslice),
    .ack_in(regslice_both_qout_V_last_V_U_ack_in_dummy),
    .data_out(qout_TLAST),
    .vld_out(regslice_both_qout_V_last_V_U_vld_out),
    .ack_out(qout_TREADY),
    .apdone_blk(regslice_both_qout_V_last_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 256 ))
regslice_both_iqout_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(iqout_TDATA_int_regslice),
    .vld_in(iqout_TVALID_int_regslice),
    .ack_in(iqout_TREADY_int_regslice),
    .data_out(iqout_TDATA),
    .vld_out(regslice_both_iqout_V_data_V_U_vld_out),
    .ack_out(iqout_TREADY),
    .apdone_blk(regslice_both_iqout_V_data_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 32 ))
regslice_both_iqout_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(32'd0),
    .vld_in(iqout_TVALID_int_regslice),
    .ack_in(regslice_both_iqout_V_keep_V_U_ack_in_dummy),
    .data_out(iqout_TKEEP),
    .vld_out(regslice_both_iqout_V_keep_V_U_vld_out),
    .ack_out(iqout_TREADY),
    .apdone_blk(regslice_both_iqout_V_keep_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 32 ))
regslice_both_iqout_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(32'd0),
    .vld_in(iqout_TVALID_int_regslice),
    .ack_in(regslice_both_iqout_V_strb_V_U_ack_in_dummy),
    .data_out(iqout_TSTRB),
    .vld_out(regslice_both_iqout_V_strb_V_U_vld_out),
    .ack_out(iqout_TREADY),
    .apdone_blk(regslice_both_iqout_V_strb_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 8 ))
regslice_both_iqout_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(iqtmp_user_V_reg_502_pp0_iter12_reg),
    .vld_in(iqout_TVALID_int_regslice),
    .ack_in(regslice_both_iqout_V_user_V_U_ack_in_dummy),
    .data_out(iqout_TUSER),
    .vld_out(regslice_both_iqout_V_user_V_U_vld_out),
    .ack_out(iqout_TREADY),
    .apdone_blk(regslice_both_iqout_V_user_V_U_apdone_blk)
);

dac_table_8x_regslice_both #(
    .DataWidth( 1 ))
regslice_both_iqout_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(set_tlast_reg_490_pp0_iter12_reg),
    .vld_in(iqout_TVALID_int_regslice),
    .ack_in(regslice_both_iqout_V_last_V_U_ack_in_dummy),
    .data_out(iqout_TLAST),
    .vld_out(regslice_both_iqout_V_last_V_U_vld_out),
    .ack_out(iqout_TREADY),
    .apdone_blk(regslice_both_iqout_V_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter13_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter11 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter12 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter13 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter14 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter14 <= ap_enable_reg_pp0_iter13;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter8 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter9 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_loop_init == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            p_Val2_s_fu_154 <= 16'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (run_read_reg_486 == 1'd1))) begin
            p_Val2_s_fu_154 <= sample_group_V_fu_242_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter10_reg <= ap_loop_exit_ready_pp0_iter9_reg;
        ap_loop_exit_ready_pp0_iter11_reg <= ap_loop_exit_ready_pp0_iter10_reg;
        ap_loop_exit_ready_pp0_iter12_reg <= ap_loop_exit_ready_pp0_iter11_reg;
        ap_loop_exit_ready_pp0_iter13_reg <= ap_loop_exit_ready_pp0_iter12_reg;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
        ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
        ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
        ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
        iqtmp_user_V_reg_502_pp0_iter10_reg <= iqtmp_user_V_reg_502_pp0_iter9_reg;
        iqtmp_user_V_reg_502_pp0_iter11_reg <= iqtmp_user_V_reg_502_pp0_iter10_reg;
        iqtmp_user_V_reg_502_pp0_iter12_reg <= iqtmp_user_V_reg_502_pp0_iter11_reg;
        iqtmp_user_V_reg_502_pp0_iter2_reg <= iqtmp_user_V_reg_502;
        iqtmp_user_V_reg_502_pp0_iter3_reg <= iqtmp_user_V_reg_502_pp0_iter2_reg;
        iqtmp_user_V_reg_502_pp0_iter4_reg <= iqtmp_user_V_reg_502_pp0_iter3_reg;
        iqtmp_user_V_reg_502_pp0_iter5_reg <= iqtmp_user_V_reg_502_pp0_iter4_reg;
        iqtmp_user_V_reg_502_pp0_iter6_reg <= iqtmp_user_V_reg_502_pp0_iter5_reg;
        iqtmp_user_V_reg_502_pp0_iter7_reg <= iqtmp_user_V_reg_502_pp0_iter6_reg;
        iqtmp_user_V_reg_502_pp0_iter8_reg <= iqtmp_user_V_reg_502_pp0_iter7_reg;
        iqtmp_user_V_reg_502_pp0_iter9_reg <= iqtmp_user_V_reg_502_pp0_iter8_reg;
        set_tlast_reg_490_pp0_iter10_reg <= set_tlast_reg_490_pp0_iter9_reg;
        set_tlast_reg_490_pp0_iter11_reg <= set_tlast_reg_490_pp0_iter10_reg;
        set_tlast_reg_490_pp0_iter12_reg <= set_tlast_reg_490_pp0_iter11_reg;
        set_tlast_reg_490_pp0_iter2_reg <= set_tlast_reg_490;
        set_tlast_reg_490_pp0_iter3_reg <= set_tlast_reg_490_pp0_iter2_reg;
        set_tlast_reg_490_pp0_iter4_reg <= set_tlast_reg_490_pp0_iter3_reg;
        set_tlast_reg_490_pp0_iter5_reg <= set_tlast_reg_490_pp0_iter4_reg;
        set_tlast_reg_490_pp0_iter6_reg <= set_tlast_reg_490_pp0_iter5_reg;
        set_tlast_reg_490_pp0_iter7_reg <= set_tlast_reg_490_pp0_iter6_reg;
        set_tlast_reg_490_pp0_iter8_reg <= set_tlast_reg_490_pp0_iter7_reg;
        set_tlast_reg_490_pp0_iter9_reg <= set_tlast_reg_490_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        run_read_reg_486 <= run;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (run_read_reg_486 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        iqtmp_user_V_reg_502 <= iqtmp_user_V_fu_263_p1;
        set_tlast_reg_490 <= set_tlast_fu_252_p2;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (run_read_read_fu_158_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (run_read_reg_486 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter13_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter14 == 1'b0) & (ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter14 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter13 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        iout_TDATA_blk_n = iout_TREADY_int_regslice;
    end else begin
        iout_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter13 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        iout_TVALID_int_regslice = 1'b1;
    end else begin
        iout_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter14 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter13 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        iqout_TDATA_blk_n = iqout_TREADY_int_regslice;
    end else begin
        iqout_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter13 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        iqout_TVALID_int_regslice = 1'b1;
    end else begin
        iqout_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter14 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter13 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        qout_TDATA_blk_n = qout_TREADY_int_regslice;
    end else begin
        qout_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter13 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        qout_TVALID_int_regslice = 1'b1;
    end else begin
        qout_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter12 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter11 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter10 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter6 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter5 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter13 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        table_r_ce0 = 1'b1;
    end else begin
        table_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_loop_exit_ready_pp0_iter13_reg == 1'b1) & ((regslice_both_iqout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_qout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_iout_V_data_V_U_apdone_blk == 1'b1))) | ((ap_enable_reg_pp0_iter14 == 1'b1) & ((iqout_TREADY_int_regslice == 1'b0) | (qout_TREADY_int_regslice == 1'b0) | (iout_TREADY_int_regslice == 1'b0))) | ((ap_enable_reg_pp0_iter13 == 1'b1) & ((regslice_both_iqout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_qout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_iout_V_data_V_U_apdone_blk == 1'b1) | (iqout_TREADY_int_regslice == 1'b0) | (qout_TREADY_int_regslice == 1'b0) | (iout_TREADY_int_regslice == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_loop_exit_ready_pp0_iter13_reg == 1'b1) & ((regslice_both_iqout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_qout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_iout_V_data_V_U_apdone_blk == 1'b1))) | ((ap_enable_reg_pp0_iter14 == 1'b1) & ((iqout_TREADY_int_regslice == 1'b0) | (qout_TREADY_int_regslice == 1'b0) | (iout_TREADY_int_regslice == 1'b0) | (1'b1 == ap_block_state15_io))) | ((ap_enable_reg_pp0_iter13 == 1'b1) & ((regslice_both_iqout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_qout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_iout_V_data_V_U_apdone_blk == 1'b1) | (iqout_TREADY_int_regslice == 1'b0) | (qout_TREADY_int_regslice == 1'b0) | (iout_TREADY_int_regslice == 1'b0) | (1'b1 == ap_block_state14_io))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_loop_exit_ready_pp0_iter13_reg == 1'b1) & ((regslice_both_iqout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_qout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_iout_V_data_V_U_apdone_blk == 1'b1))) | ((ap_enable_reg_pp0_iter14 == 1'b1) & ((iqout_TREADY_int_regslice == 1'b0) | (qout_TREADY_int_regslice == 1'b0) | (iout_TREADY_int_regslice == 1'b0) | (1'b1 == ap_block_state15_io))) | ((ap_enable_reg_pp0_iter13 == 1'b1) & ((regslice_both_iqout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_qout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_iout_V_data_V_U_apdone_blk == 1'b1) | (iqout_TREADY_int_regslice == 1'b0) | (qout_TREADY_int_regslice == 1'b0) | (iout_TREADY_int_regslice == 1'b0) | (1'b1 == ap_block_state14_io))));
end

assign ap_block_state10_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter11 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage0_iter12 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state14_io = ((iqout_TREADY_int_regslice == 1'b0) | (qout_TREADY_int_regslice == 1'b0) | (iout_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state14_pp0_stage0_iter13 = ((regslice_both_iqout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_qout_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_iout_V_data_V_U_apdone_blk == 1'b1) | (iqout_TREADY_int_regslice == 1'b0) | (qout_TREADY_int_regslice == 1'b0) | (iout_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state15_io = ((iqout_TREADY_int_regslice == 1'b0) | (qout_TREADY_int_regslice == 1'b0) | (iout_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state15_pp0_stage0_iter14 = ((iqout_TREADY_int_regslice == 1'b0) | (qout_TREADY_int_regslice == 1'b0) | (iout_TREADY_int_regslice == 1'b0));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign iout_TDATA_int_regslice = table_r_q0[127:0];

assign iout_TVALID = regslice_both_iout_V_data_V_U_vld_out;

assign iqout_TDATA_int_regslice = {{{{{{{{{{{{{{{{tmp_14_fu_432_p4}, {tmp_13_fu_422_p4}}, {tmp_12_fu_412_p4}}, {tmp_11_fu_402_p4}}, {tmp_10_fu_392_p4}}, {tmp_1_fu_382_p4}}, {tmp_9_fu_372_p4}}, {tmp_6_fu_362_p4}}, {tmp_3_fu_352_p4}}, {tmp_s_fu_342_p4}}, {tmp_8_fu_332_p4}}, {tmp_7_fu_322_p4}}, {tmp_5_fu_312_p4}}, {tmp_4_fu_302_p4}}, {tmp_2_fu_292_p4}}, {trunc_ln674_2_fu_288_p1}};

assign iqout_TVALID = regslice_both_iqout_V_data_V_U_vld_out;

assign iqtmp_user_V_fu_263_p1 = p_Val2_s_fu_154[7:0];

assign qout_TDATA_int_regslice = {{table_r_q0[255:128]}};

assign qout_TVALID = regslice_both_qout_V_data_V_U_vld_out;

assign run_read_read_fu_158_p2 = run;

assign sample_group_V_fu_242_p2 = (p_Val2_s_fu_154 + 16'd1);

assign set_tlast_fu_252_p2 = ((trunc_ln674_fu_248_p1 == 8'd255) ? 1'b1 : 1'b0);

assign table_r_address0 = zext_ln587_fu_258_p1;

assign tmp_10_fu_392_p4 = {{table_r_q0[223:208]}};

assign tmp_11_fu_402_p4 = {{table_r_q0[111:96]}};

assign tmp_12_fu_412_p4 = {{table_r_q0[239:224]}};

assign tmp_13_fu_422_p4 = {{table_r_q0[127:112]}};

assign tmp_14_fu_432_p4 = {{table_r_q0[255:240]}};

assign tmp_1_fu_382_p4 = {{table_r_q0[95:80]}};

assign tmp_2_fu_292_p4 = {{table_r_q0[143:128]}};

assign tmp_3_fu_352_p4 = {{table_r_q0[191:176]}};

assign tmp_4_fu_302_p4 = {{table_r_q0[31:16]}};

assign tmp_5_fu_312_p4 = {{table_r_q0[159:144]}};

assign tmp_6_fu_362_p4 = {{table_r_q0[79:64]}};

assign tmp_7_fu_322_p4 = {{table_r_q0[47:32]}};

assign tmp_8_fu_332_p4 = {{table_r_q0[175:160]}};

assign tmp_9_fu_372_p4 = {{table_r_q0[207:192]}};

assign tmp_s_fu_342_p4 = {{table_r_q0[63:48]}};

assign trunc_ln674_2_fu_288_p1 = table_r_q0[15:0];

assign trunc_ln674_fu_248_p1 = p_Val2_s_fu_154[7:0];

assign zext_ln587_fu_258_p1 = p_Val2_s_fu_154;


reg find_kernel_block = 0;
// synthesis translate_off
`include "dac_table_8x_hls_deadlock_kernel_monitor_top.vh"
// synthesis translate_on

endmodule //dac_table_8x

