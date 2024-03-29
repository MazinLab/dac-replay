// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dac_table_axim_dac_table_axim_Pipeline_runloop (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        iout_TREADY,
        qout_TREADY,
        iqout_TREADY,
        replay_length,
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
        length_r,
        comb2wide_V_address0,
        comb2wide_V_ce0,
        comb2wide_V_q0,
        run,
        tlast
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   iout_TREADY;
input   qout_TREADY;
input   iqout_TREADY;
input  [14:0] replay_length;
output  [255:0] iout_TDATA;
output   iout_TVALID;
output  [31:0] iout_TKEEP;
output  [31:0] iout_TSTRB;
output  [0:0] iout_TLAST;
output  [255:0] qout_TDATA;
output   qout_TVALID;
output  [31:0] qout_TKEEP;
output  [31:0] qout_TSTRB;
output  [0:0] qout_TLAST;
output  [511:0] iqout_TDATA;
output   iqout_TVALID;
output  [63:0] iqout_TKEEP;
output  [63:0] iqout_TSTRB;
output  [7:0] iqout_TUSER;
output  [0:0] iqout_TLAST;
input  [14:0] length_r;
output  [13:0] comb2wide_V_address0;
output   comb2wide_V_ce0;
input  [1023:0] comb2wide_V_q0;
input  [0:0] run;
input  [0:0] tlast;

reg ap_idle;
reg iout_TVALID;
reg qout_TVALID;
reg iqout_TVALID;
reg comb2wide_V_ce0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] p_run_reg_462;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state2_io;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] ap_phi_mux_p_run_phi_fu_465_p4;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    iout_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    qout_TDATA_blk_n;
reg    iqout_TDATA_blk_n;
reg   [0:0] p_run_3_reg_1472;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] trunc_ln46_fu_539_p1;
reg   [0:0] trunc_ln46_reg_1477;
wire   [0:0] itmp_last_V_fu_563_p2;
reg   [0:0] itmp_last_V_reg_1481;
wire   [7:0] iqtmp_user_V_fu_592_p1;
reg   [7:0] iqtmp_user_V_reg_1493;
reg   [0:0] ap_phi_mux_p_run_1_phi_fu_507_p4;
wire    ap_loop_init;
reg   [511:0] ap_phi_mux_iqtmpdat_phi_fu_476_p4;
wire   [511:0] p_Result_10_s_fu_956_p33;
wire   [511:0] ap_phi_reg_pp0_iter1_iqtmpdat_reg_473;
wire   [511:0] iq_V_6_s_fu_1375_p33;
reg   [255:0] ap_phi_mux_qtmpdat_phi_fu_486_p4;
wire   [255:0] ap_phi_reg_pp0_iter1_qtmpdat_reg_483;
reg   [255:0] ap_phi_mux_itmpdat_phi_fu_496_p4;
wire   [255:0] i_V_fu_626_p1;
wire   [255:0] ap_phi_reg_pp0_iter1_itmpdat_reg_493;
wire   [0:0] ap_phi_reg_pp0_iter1_p_run_1_reg_503;
wire   [63:0] zext_ln573_fu_579_p1;
reg   [14:0] p_Val2_s_fu_352;
reg   [14:0] ap_sig_allocacmp_p_Val2_load;
reg   [14:0] ap_sig_allocacmp_p_Val2_load_1;
wire   [14:0] sample_V_fu_608_p3;
reg   [14:0] last_counter_V_fu_356;
reg   [14:0] ap_sig_allocacmp_last_counter_V_load;
wire   [14:0] last_counter_V_2_fu_555_p3;
reg   [0:0] p_runcache_fu_360;
reg   [0:0] ap_sig_allocacmp_p_run_3;
reg   [1023:0] p_Val2_1_fu_364;
reg    ap_block_pp0_stage0_01001;
wire   [0:0] icmp_ln1049_fu_543_p2;
wire   [14:0] last_counter_V_1_fu_549_p2;
wire   [13:0] ret_fu_569_p4;
wire   [0:0] icmp_ln1049_1_fu_596_p2;
wire   [14:0] add_ln223_fu_602_p2;
wire   [15:0] p_Result_21_14_fu_946_p4;
wire   [15:0] p_Result_19_14_fu_936_p4;
wire   [15:0] p_Result_21_13_fu_926_p4;
wire   [15:0] p_Result_19_13_fu_916_p4;
wire   [15:0] p_Result_21_12_fu_906_p4;
wire   [15:0] p_Result_19_12_fu_896_p4;
wire   [15:0] p_Result_21_11_fu_886_p4;
wire   [15:0] p_Result_19_11_fu_876_p4;
wire   [15:0] p_Result_21_10_fu_866_p4;
wire   [15:0] p_Result_19_10_fu_856_p4;
wire   [15:0] p_Result_21_s_fu_846_p4;
wire   [15:0] p_Result_19_s_fu_836_p4;
wire   [15:0] p_Result_21_9_fu_826_p4;
wire   [15:0] p_Result_19_9_fu_816_p4;
wire   [15:0] p_Result_21_8_fu_806_p4;
wire   [15:0] p_Result_19_8_fu_796_p4;
wire   [15:0] p_Result_21_7_fu_786_p4;
wire   [15:0] p_Result_19_7_fu_776_p4;
wire   [15:0] p_Result_21_6_fu_766_p4;
wire   [15:0] p_Result_19_6_fu_756_p4;
wire   [15:0] p_Result_21_5_fu_746_p4;
wire   [15:0] p_Result_19_5_fu_736_p4;
wire   [15:0] p_Result_21_4_fu_726_p4;
wire   [15:0] p_Result_19_4_fu_716_p4;
wire   [15:0] p_Result_21_3_fu_706_p4;
wire   [15:0] p_Result_19_3_fu_696_p4;
wire   [15:0] p_Result_21_2_fu_686_p4;
wire   [15:0] p_Result_19_2_fu_676_p4;
wire   [15:0] p_Result_21_1_fu_666_p4;
wire   [15:0] p_Result_19_1_fu_656_p4;
wire   [15:0] p_Result_1_fu_646_p4;
wire   [15:0] trunc_ln674_fu_642_p1;
wire   [15:0] p_Result_27_14_fu_1365_p4;
wire   [15:0] p_Result_25_14_fu_1355_p4;
wire   [15:0] p_Result_27_13_fu_1345_p4;
wire   [15:0] p_Result_25_13_fu_1335_p4;
wire   [15:0] p_Result_27_12_fu_1325_p4;
wire   [15:0] p_Result_25_12_fu_1315_p4;
wire   [15:0] p_Result_27_11_fu_1305_p4;
wire   [15:0] p_Result_25_11_fu_1295_p4;
wire   [15:0] p_Result_27_10_fu_1285_p4;
wire   [15:0] p_Result_25_10_fu_1275_p4;
wire   [15:0] p_Result_27_s_fu_1265_p4;
wire   [15:0] p_Result_25_s_fu_1255_p4;
wire   [15:0] p_Result_27_9_fu_1245_p4;
wire   [15:0] p_Result_25_9_fu_1235_p4;
wire   [15:0] p_Result_27_8_fu_1225_p4;
wire   [15:0] p_Result_25_8_fu_1215_p4;
wire   [15:0] p_Result_27_7_fu_1205_p4;
wire   [15:0] p_Result_25_7_fu_1195_p4;
wire   [15:0] p_Result_27_6_fu_1185_p4;
wire   [15:0] p_Result_25_6_fu_1175_p4;
wire   [15:0] p_Result_27_5_fu_1165_p4;
wire   [15:0] p_Result_25_5_fu_1155_p4;
wire   [15:0] p_Result_27_4_fu_1145_p4;
wire   [15:0] p_Result_25_4_fu_1135_p4;
wire   [15:0] p_Result_27_3_fu_1125_p4;
wire   [15:0] p_Result_25_3_fu_1115_p4;
wire   [15:0] p_Result_27_2_fu_1105_p4;
wire   [15:0] p_Result_25_2_fu_1095_p4;
wire   [15:0] p_Result_27_1_fu_1085_p4;
wire   [15:0] p_Result_25_1_fu_1075_p4;
wire   [15:0] p_Result_3_fu_1065_p4;
wire   [15:0] p_Result_2_fu_1055_p4;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_860;
reg    ap_condition_865;
reg    ap_condition_869;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

dac_table_axim_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_phi_mux_p_run_phi_fu_465_p4 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            last_counter_V_fu_356 <= last_counter_V_2_fu_555_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            last_counter_V_fu_356 <= replay_length;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_phi_mux_p_run_phi_fu_465_p4 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            p_Val2_s_fu_352 <= sample_V_fu_608_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            p_Val2_s_fu_352 <= 15'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_init == 1'b1))) begin
            p_run_reg_462 <= 1'd1;
        end else if ((1'b1 == ap_condition_865)) begin
            p_run_reg_462 <= ap_phi_mux_p_run_1_phi_fu_507_p4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_869)) begin
            p_runcache_fu_360 <= run;
        end else if ((ap_loop_init == 1'b1)) begin
            p_runcache_fu_360 <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_phi_mux_p_run_phi_fu_465_p4 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        iqtmp_user_V_reg_1493 <= iqtmp_user_V_fu_592_p1;
        itmp_last_V_reg_1481 <= itmp_last_V_fu_563_p2;
        trunc_ln46_reg_1477 <= trunc_ln46_fu_539_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (p_run_reg_462 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (trunc_ln46_reg_1477 == 1'd0))) begin
        p_Val2_1_fu_364 <= comb2wide_V_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_run_3_reg_1472 <= ap_sig_allocacmp_p_run_3;
    end
end

always @ (*) begin
    if (((ap_phi_mux_p_run_phi_fu_465_p4 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((p_run_reg_462 == 1'd1)) begin
        if ((trunc_ln46_reg_1477 == 1'd1)) begin
            ap_phi_mux_iqtmpdat_phi_fu_476_p4 = iq_V_6_s_fu_1375_p33;
        end else if ((trunc_ln46_reg_1477 == 1'd0)) begin
            ap_phi_mux_iqtmpdat_phi_fu_476_p4 = p_Result_10_s_fu_956_p33;
        end else begin
            ap_phi_mux_iqtmpdat_phi_fu_476_p4 = ap_phi_reg_pp0_iter1_iqtmpdat_reg_473;
        end
    end else begin
        ap_phi_mux_iqtmpdat_phi_fu_476_p4 = ap_phi_reg_pp0_iter1_iqtmpdat_reg_473;
    end
end

always @ (*) begin
    if ((p_run_reg_462 == 1'd1)) begin
        if ((trunc_ln46_reg_1477 == 1'd1)) begin
            ap_phi_mux_itmpdat_phi_fu_496_p4 = {{p_Val2_1_fu_364[767:512]}};
        end else if ((trunc_ln46_reg_1477 == 1'd0)) begin
            ap_phi_mux_itmpdat_phi_fu_496_p4 = i_V_fu_626_p1;
        end else begin
            ap_phi_mux_itmpdat_phi_fu_496_p4 = ap_phi_reg_pp0_iter1_itmpdat_reg_493;
        end
    end else begin
        ap_phi_mux_itmpdat_phi_fu_496_p4 = ap_phi_reg_pp0_iter1_itmpdat_reg_493;
    end
end

always @ (*) begin
    if ((p_run_reg_462 == 1'd1)) begin
        if ((trunc_ln46_reg_1477 == 1'd1)) begin
            ap_phi_mux_p_run_1_phi_fu_507_p4 = p_run_3_reg_1472;
        end else if ((trunc_ln46_reg_1477 == 1'd0)) begin
            ap_phi_mux_p_run_1_phi_fu_507_p4 = 1'd1;
        end else begin
            ap_phi_mux_p_run_1_phi_fu_507_p4 = ap_phi_reg_pp0_iter1_p_run_1_reg_503;
        end
    end else begin
        ap_phi_mux_p_run_1_phi_fu_507_p4 = ap_phi_reg_pp0_iter1_p_run_1_reg_503;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((ap_loop_init == 1'b1)) begin
            ap_phi_mux_p_run_phi_fu_465_p4 = 1'd1;
        end else if ((1'b1 == ap_condition_860)) begin
            ap_phi_mux_p_run_phi_fu_465_p4 = ap_phi_mux_p_run_1_phi_fu_507_p4;
        end else begin
            ap_phi_mux_p_run_phi_fu_465_p4 = 1'd1;
        end
    end else begin
        ap_phi_mux_p_run_phi_fu_465_p4 = 1'd1;
    end
end

always @ (*) begin
    if ((p_run_reg_462 == 1'd1)) begin
        if ((trunc_ln46_reg_1477 == 1'd1)) begin
            ap_phi_mux_qtmpdat_phi_fu_486_p4 = {{p_Val2_1_fu_364[1023:768]}};
        end else if ((trunc_ln46_reg_1477 == 1'd0)) begin
            ap_phi_mux_qtmpdat_phi_fu_486_p4 = {{comb2wide_V_q0[511:256]}};
        end else begin
            ap_phi_mux_qtmpdat_phi_fu_486_p4 = ap_phi_reg_pp0_iter1_qtmpdat_reg_483;
        end
    end else begin
        ap_phi_mux_qtmpdat_phi_fu_486_p4 = ap_phi_reg_pp0_iter1_qtmpdat_reg_483;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_last_counter_V_load = replay_length;
    end else begin
        ap_sig_allocacmp_last_counter_V_load = last_counter_V_fu_356;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_p_Val2_load = 15'd0;
    end else begin
        ap_sig_allocacmp_p_Val2_load = p_Val2_s_fu_352;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_p_Val2_load_1 = 15'd0;
    end else begin
        ap_sig_allocacmp_p_Val2_load_1 = p_Val2_s_fu_352;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_p_run_3 = 1'd1;
    end else begin
        ap_sig_allocacmp_p_run_3 = p_runcache_fu_360;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        comb2wide_V_ce0 = 1'b1;
    end else begin
        comb2wide_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (p_run_reg_462 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        iout_TDATA_blk_n = iout_TREADY;
    end else begin
        iout_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (p_run_reg_462 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        iout_TVALID = 1'b1;
    end else begin
        iout_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (p_run_reg_462 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        iqout_TDATA_blk_n = iqout_TREADY;
    end else begin
        iqout_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (p_run_reg_462 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        iqout_TVALID = 1'b1;
    end else begin
        iqout_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (p_run_reg_462 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        qout_TDATA_blk_n = qout_TREADY;
    end else begin
        qout_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (p_run_reg_462 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        qout_TVALID = 1'b1;
    end else begin
        qout_TVALID = 1'b0;
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

assign add_ln223_fu_602_p2 = (ap_sig_allocacmp_p_Val2_load_1 + 15'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((iqout_TREADY == 1'b0) & (p_run_reg_462 == 1'd1)) | ((qout_TREADY == 1'b0) & (p_run_reg_462 == 1'd1)) | ((p_run_reg_462 == 1'd1) & (iout_TREADY == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((iqout_TREADY == 1'b0) & (p_run_reg_462 == 1'd1)) | ((qout_TREADY == 1'b0) & (p_run_reg_462 == 1'd1)) | ((p_run_reg_462 == 1'd1) & (iout_TREADY == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((iqout_TREADY == 1'b0) & (p_run_reg_462 == 1'd1)) | ((qout_TREADY == 1'b0) & (p_run_reg_462 == 1'd1)) | ((p_run_reg_462 == 1'd1) & (iout_TREADY == 1'b0))));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_io = (((iqout_TREADY == 1'b0) & (p_run_reg_462 == 1'd1)) | ((qout_TREADY == 1'b0) & (p_run_reg_462 == 1'd1)) | ((p_run_reg_462 == 1'd1) & (iout_TREADY == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((iqout_TREADY == 1'b0) & (p_run_reg_462 == 1'd1)) | ((qout_TREADY == 1'b0) & (p_run_reg_462 == 1'd1)) | ((p_run_reg_462 == 1'd1) & (iout_TREADY == 1'b0)));
end

always @ (*) begin
    ap_condition_860 = ((1'b0 == ap_block_pp0_stage0) & (p_run_reg_462 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_865 = ((1'b0 == ap_block_pp0_stage0_11001) & (p_run_reg_462 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_869 = ((ap_phi_mux_p_run_phi_fu_465_p4 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (trunc_ln46_fu_539_p1 == 1'd0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_phi_reg_pp0_iter1_iqtmpdat_reg_473 = 'bx;

assign ap_phi_reg_pp0_iter1_itmpdat_reg_493 = 'bx;

assign ap_phi_reg_pp0_iter1_p_run_1_reg_503 = 'bx;

assign ap_phi_reg_pp0_iter1_qtmpdat_reg_483 = 'bx;

assign comb2wide_V_address0 = zext_ln573_fu_579_p1;

assign i_V_fu_626_p1 = comb2wide_V_q0[255:0];

assign icmp_ln1049_1_fu_596_p2 = ((ap_sig_allocacmp_p_Val2_load_1 == length_r) ? 1'b1 : 1'b0);

assign icmp_ln1049_fu_543_p2 = ((ap_sig_allocacmp_last_counter_V_load == 15'd0) ? 1'b1 : 1'b0);

assign iout_TDATA = ap_phi_mux_itmpdat_phi_fu_496_p4;

assign iout_TKEEP = 32'd0;

assign iout_TLAST = itmp_last_V_reg_1481;

assign iout_TSTRB = 32'd0;

assign iq_V_6_s_fu_1375_p33 = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{p_Result_27_14_fu_1365_p4}, {p_Result_25_14_fu_1355_p4}}, {p_Result_27_13_fu_1345_p4}}, {p_Result_25_13_fu_1335_p4}}, {p_Result_27_12_fu_1325_p4}}, {p_Result_25_12_fu_1315_p4}}, {p_Result_27_11_fu_1305_p4}}, {p_Result_25_11_fu_1295_p4}}, {p_Result_27_10_fu_1285_p4}}, {p_Result_25_10_fu_1275_p4}}, {p_Result_27_s_fu_1265_p4}}, {p_Result_25_s_fu_1255_p4}}, {p_Result_27_9_fu_1245_p4}}, {p_Result_25_9_fu_1235_p4}}, {p_Result_27_8_fu_1225_p4}}, {p_Result_25_8_fu_1215_p4}}, {p_Result_27_7_fu_1205_p4}}, {p_Result_25_7_fu_1195_p4}}, {p_Result_27_6_fu_1185_p4}}, {p_Result_25_6_fu_1175_p4}}, {p_Result_27_5_fu_1165_p4}}, {p_Result_25_5_fu_1155_p4}}, {p_Result_27_4_fu_1145_p4}}, {p_Result_25_4_fu_1135_p4}}, {p_Result_27_3_fu_1125_p4}}, {p_Result_25_3_fu_1115_p4}}, {p_Result_27_2_fu_1105_p4}}, {p_Result_25_2_fu_1095_p4}}, {p_Result_27_1_fu_1085_p4}}, {p_Result_25_1_fu_1075_p4}}, {p_Result_3_fu_1065_p4}}, {p_Result_2_fu_1055_p4}};

assign iqout_TDATA = ap_phi_mux_iqtmpdat_phi_fu_476_p4;

assign iqout_TKEEP = 64'd0;

assign iqout_TLAST = itmp_last_V_reg_1481;

assign iqout_TSTRB = 64'd0;

assign iqout_TUSER = iqtmp_user_V_reg_1493;

assign iqtmp_user_V_fu_592_p1 = ap_sig_allocacmp_p_Val2_load_1[7:0];

assign itmp_last_V_fu_563_p2 = (tlast & icmp_ln1049_fu_543_p2);

assign last_counter_V_1_fu_549_p2 = ($signed(ap_sig_allocacmp_last_counter_V_load) + $signed(15'd32767));

assign last_counter_V_2_fu_555_p3 = ((icmp_ln1049_fu_543_p2[0:0] == 1'b1) ? replay_length : last_counter_V_1_fu_549_p2);

assign p_Result_10_s_fu_956_p33 = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{p_Result_21_14_fu_946_p4}, {p_Result_19_14_fu_936_p4}}, {p_Result_21_13_fu_926_p4}}, {p_Result_19_13_fu_916_p4}}, {p_Result_21_12_fu_906_p4}}, {p_Result_19_12_fu_896_p4}}, {p_Result_21_11_fu_886_p4}}, {p_Result_19_11_fu_876_p4}}, {p_Result_21_10_fu_866_p4}}, {p_Result_19_10_fu_856_p4}}, {p_Result_21_s_fu_846_p4}}, {p_Result_19_s_fu_836_p4}}, {p_Result_21_9_fu_826_p4}}, {p_Result_19_9_fu_816_p4}}, {p_Result_21_8_fu_806_p4}}, {p_Result_19_8_fu_796_p4}}, {p_Result_21_7_fu_786_p4}}, {p_Result_19_7_fu_776_p4}}, {p_Result_21_6_fu_766_p4}}, {p_Result_19_6_fu_756_p4}}, {p_Result_21_5_fu_746_p4}}, {p_Result_19_5_fu_736_p4}}, {p_Result_21_4_fu_726_p4}}, {p_Result_19_4_fu_716_p4}}, {p_Result_21_3_fu_706_p4}}, {p_Result_19_3_fu_696_p4}}, {p_Result_21_2_fu_686_p4}}, {p_Result_19_2_fu_676_p4}}, {p_Result_21_1_fu_666_p4}}, {p_Result_19_1_fu_656_p4}}, {p_Result_1_fu_646_p4}}, {trunc_ln674_fu_642_p1}};

assign p_Result_19_10_fu_856_p4 = {{comb2wide_V_q0[191:176]}};

assign p_Result_19_11_fu_876_p4 = {{comb2wide_V_q0[207:192]}};

assign p_Result_19_12_fu_896_p4 = {{comb2wide_V_q0[223:208]}};

assign p_Result_19_13_fu_916_p4 = {{comb2wide_V_q0[239:224]}};

assign p_Result_19_14_fu_936_p4 = {{comb2wide_V_q0[255:240]}};

assign p_Result_19_1_fu_656_p4 = {{comb2wide_V_q0[31:16]}};

assign p_Result_19_2_fu_676_p4 = {{comb2wide_V_q0[47:32]}};

assign p_Result_19_3_fu_696_p4 = {{comb2wide_V_q0[63:48]}};

assign p_Result_19_4_fu_716_p4 = {{comb2wide_V_q0[79:64]}};

assign p_Result_19_5_fu_736_p4 = {{comb2wide_V_q0[95:80]}};

assign p_Result_19_6_fu_756_p4 = {{comb2wide_V_q0[111:96]}};

assign p_Result_19_7_fu_776_p4 = {{comb2wide_V_q0[127:112]}};

assign p_Result_19_8_fu_796_p4 = {{comb2wide_V_q0[143:128]}};

assign p_Result_19_9_fu_816_p4 = {{comb2wide_V_q0[159:144]}};

assign p_Result_19_s_fu_836_p4 = {{comb2wide_V_q0[175:160]}};

assign p_Result_1_fu_646_p4 = {{comb2wide_V_q0[271:256]}};

assign p_Result_21_10_fu_866_p4 = {{comb2wide_V_q0[447:432]}};

assign p_Result_21_11_fu_886_p4 = {{comb2wide_V_q0[463:448]}};

assign p_Result_21_12_fu_906_p4 = {{comb2wide_V_q0[479:464]}};

assign p_Result_21_13_fu_926_p4 = {{comb2wide_V_q0[495:480]}};

assign p_Result_21_14_fu_946_p4 = {{comb2wide_V_q0[511:496]}};

assign p_Result_21_1_fu_666_p4 = {{comb2wide_V_q0[287:272]}};

assign p_Result_21_2_fu_686_p4 = {{comb2wide_V_q0[303:288]}};

assign p_Result_21_3_fu_706_p4 = {{comb2wide_V_q0[319:304]}};

assign p_Result_21_4_fu_726_p4 = {{comb2wide_V_q0[335:320]}};

assign p_Result_21_5_fu_746_p4 = {{comb2wide_V_q0[351:336]}};

assign p_Result_21_6_fu_766_p4 = {{comb2wide_V_q0[367:352]}};

assign p_Result_21_7_fu_786_p4 = {{comb2wide_V_q0[383:368]}};

assign p_Result_21_8_fu_806_p4 = {{comb2wide_V_q0[399:384]}};

assign p_Result_21_9_fu_826_p4 = {{comb2wide_V_q0[415:400]}};

assign p_Result_21_s_fu_846_p4 = {{comb2wide_V_q0[431:416]}};

assign p_Result_25_10_fu_1275_p4 = {{p_Val2_1_fu_364[703:688]}};

assign p_Result_25_11_fu_1295_p4 = {{p_Val2_1_fu_364[719:704]}};

assign p_Result_25_12_fu_1315_p4 = {{p_Val2_1_fu_364[735:720]}};

assign p_Result_25_13_fu_1335_p4 = {{p_Val2_1_fu_364[751:736]}};

assign p_Result_25_14_fu_1355_p4 = {{p_Val2_1_fu_364[767:752]}};

assign p_Result_25_1_fu_1075_p4 = {{p_Val2_1_fu_364[543:528]}};

assign p_Result_25_2_fu_1095_p4 = {{p_Val2_1_fu_364[559:544]}};

assign p_Result_25_3_fu_1115_p4 = {{p_Val2_1_fu_364[575:560]}};

assign p_Result_25_4_fu_1135_p4 = {{p_Val2_1_fu_364[591:576]}};

assign p_Result_25_5_fu_1155_p4 = {{p_Val2_1_fu_364[607:592]}};

assign p_Result_25_6_fu_1175_p4 = {{p_Val2_1_fu_364[623:608]}};

assign p_Result_25_7_fu_1195_p4 = {{p_Val2_1_fu_364[639:624]}};

assign p_Result_25_8_fu_1215_p4 = {{p_Val2_1_fu_364[655:640]}};

assign p_Result_25_9_fu_1235_p4 = {{p_Val2_1_fu_364[671:656]}};

assign p_Result_25_s_fu_1255_p4 = {{p_Val2_1_fu_364[687:672]}};

assign p_Result_27_10_fu_1285_p4 = {{p_Val2_1_fu_364[959:944]}};

assign p_Result_27_11_fu_1305_p4 = {{p_Val2_1_fu_364[975:960]}};

assign p_Result_27_12_fu_1325_p4 = {{p_Val2_1_fu_364[991:976]}};

assign p_Result_27_13_fu_1345_p4 = {{p_Val2_1_fu_364[1007:992]}};

assign p_Result_27_14_fu_1365_p4 = {{p_Val2_1_fu_364[1023:1008]}};

assign p_Result_27_1_fu_1085_p4 = {{p_Val2_1_fu_364[799:784]}};

assign p_Result_27_2_fu_1105_p4 = {{p_Val2_1_fu_364[815:800]}};

assign p_Result_27_3_fu_1125_p4 = {{p_Val2_1_fu_364[831:816]}};

assign p_Result_27_4_fu_1145_p4 = {{p_Val2_1_fu_364[847:832]}};

assign p_Result_27_5_fu_1165_p4 = {{p_Val2_1_fu_364[863:848]}};

assign p_Result_27_6_fu_1185_p4 = {{p_Val2_1_fu_364[879:864]}};

assign p_Result_27_7_fu_1205_p4 = {{p_Val2_1_fu_364[895:880]}};

assign p_Result_27_8_fu_1225_p4 = {{p_Val2_1_fu_364[911:896]}};

assign p_Result_27_9_fu_1245_p4 = {{p_Val2_1_fu_364[927:912]}};

assign p_Result_27_s_fu_1265_p4 = {{p_Val2_1_fu_364[943:928]}};

assign p_Result_2_fu_1055_p4 = {{p_Val2_1_fu_364[527:512]}};

assign p_Result_3_fu_1065_p4 = {{p_Val2_1_fu_364[783:768]}};

assign qout_TDATA = ap_phi_mux_qtmpdat_phi_fu_486_p4;

assign qout_TKEEP = 32'd0;

assign qout_TLAST = itmp_last_V_reg_1481;

assign qout_TSTRB = 32'd0;

assign ret_fu_569_p4 = {{ap_sig_allocacmp_p_Val2_load[14:1]}};

assign sample_V_fu_608_p3 = ((icmp_ln1049_1_fu_596_p2[0:0] == 1'b1) ? 15'd0 : add_ln223_fu_602_p2);

assign trunc_ln46_fu_539_p1 = ap_sig_allocacmp_p_Val2_load[0:0];

assign trunc_ln674_fu_642_p1 = comb2wide_V_q0[15:0];

assign zext_ln573_fu_579_p1 = ret_fu_569_p4;

endmodule //dac_table_axim_dac_table_axim_Pipeline_runloop
