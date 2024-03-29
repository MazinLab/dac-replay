// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dac_table_8x_dac_table_8x_Pipeline_copy (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_gmem_AWVALID,
        m_axi_gmem_AWREADY,
        m_axi_gmem_AWADDR,
        m_axi_gmem_AWID,
        m_axi_gmem_AWLEN,
        m_axi_gmem_AWSIZE,
        m_axi_gmem_AWBURST,
        m_axi_gmem_AWLOCK,
        m_axi_gmem_AWCACHE,
        m_axi_gmem_AWPROT,
        m_axi_gmem_AWQOS,
        m_axi_gmem_AWREGION,
        m_axi_gmem_AWUSER,
        m_axi_gmem_WVALID,
        m_axi_gmem_WREADY,
        m_axi_gmem_WDATA,
        m_axi_gmem_WSTRB,
        m_axi_gmem_WLAST,
        m_axi_gmem_WID,
        m_axi_gmem_WUSER,
        m_axi_gmem_ARVALID,
        m_axi_gmem_ARREADY,
        m_axi_gmem_ARADDR,
        m_axi_gmem_ARID,
        m_axi_gmem_ARLEN,
        m_axi_gmem_ARSIZE,
        m_axi_gmem_ARBURST,
        m_axi_gmem_ARLOCK,
        m_axi_gmem_ARCACHE,
        m_axi_gmem_ARPROT,
        m_axi_gmem_ARQOS,
        m_axi_gmem_ARREGION,
        m_axi_gmem_ARUSER,
        m_axi_gmem_RVALID,
        m_axi_gmem_RREADY,
        m_axi_gmem_RDATA,
        m_axi_gmem_RLAST,
        m_axi_gmem_RID,
        m_axi_gmem_RFIFONUM,
        m_axi_gmem_RUSER,
        m_axi_gmem_RRESP,
        m_axi_gmem_BVALID,
        m_axi_gmem_BREADY,
        m_axi_gmem_BRESP,
        m_axi_gmem_BID,
        m_axi_gmem_BUSER,
        sext_ln36,
        comb2wide_V_address1,
        comb2wide_V_ce1,
        comb2wide_V_we1,
        comb2wide_V_d1
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_gmem_AWVALID;
input   m_axi_gmem_AWREADY;
output  [63:0] m_axi_gmem_AWADDR;
output  [0:0] m_axi_gmem_AWID;
output  [31:0] m_axi_gmem_AWLEN;
output  [2:0] m_axi_gmem_AWSIZE;
output  [1:0] m_axi_gmem_AWBURST;
output  [1:0] m_axi_gmem_AWLOCK;
output  [3:0] m_axi_gmem_AWCACHE;
output  [2:0] m_axi_gmem_AWPROT;
output  [3:0] m_axi_gmem_AWQOS;
output  [3:0] m_axi_gmem_AWREGION;
output  [0:0] m_axi_gmem_AWUSER;
output   m_axi_gmem_WVALID;
input   m_axi_gmem_WREADY;
output  [127:0] m_axi_gmem_WDATA;
output  [15:0] m_axi_gmem_WSTRB;
output   m_axi_gmem_WLAST;
output  [0:0] m_axi_gmem_WID;
output  [0:0] m_axi_gmem_WUSER;
output   m_axi_gmem_ARVALID;
input   m_axi_gmem_ARREADY;
output  [63:0] m_axi_gmem_ARADDR;
output  [0:0] m_axi_gmem_ARID;
output  [31:0] m_axi_gmem_ARLEN;
output  [2:0] m_axi_gmem_ARSIZE;
output  [1:0] m_axi_gmem_ARBURST;
output  [1:0] m_axi_gmem_ARLOCK;
output  [3:0] m_axi_gmem_ARCACHE;
output  [2:0] m_axi_gmem_ARPROT;
output  [3:0] m_axi_gmem_ARQOS;
output  [3:0] m_axi_gmem_ARREGION;
output  [0:0] m_axi_gmem_ARUSER;
input   m_axi_gmem_RVALID;
output   m_axi_gmem_RREADY;
input  [127:0] m_axi_gmem_RDATA;
input   m_axi_gmem_RLAST;
input  [0:0] m_axi_gmem_RID;
input  [3:0] m_axi_gmem_RFIFONUM;
input  [0:0] m_axi_gmem_RUSER;
input  [1:0] m_axi_gmem_RRESP;
input   m_axi_gmem_BVALID;
output   m_axi_gmem_BREADY;
input  [1:0] m_axi_gmem_BRESP;
input  [0:0] m_axi_gmem_BID;
input  [0:0] m_axi_gmem_BUSER;
input  [59:0] sext_ln36;
output  [14:0] comb2wide_V_address1;
output   comb2wide_V_ce1;
output   comb2wide_V_we1;
output  [511:0] comb2wide_V_d1;

reg ap_idle;
reg m_axi_gmem_RREADY;
reg comb2wide_V_ce1;
reg comb2wide_V_we1;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state2;
reg   [0:0] icmp_ln36_reg_163;
reg    ap_block_state2_pp0_stage1_iter0;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_CS_fsm_state6;
wire    ap_block_state6_pp0_stage5_iter0;
reg    gmem_blk_n_R;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [15:0] i_1_reg_157;
wire   [0:0] icmp_ln36_fu_110_p2;
reg   [127:0] iorq_dat_V_reg_172;
reg   [127:0] iorq_dat_V_1_reg_177;
reg    ap_block_state3_pp0_stage2_iter0;
reg   [127:0] iorq_dat_V_2_reg_182;
reg    ap_block_state4_pp0_stage3_iter0;
reg   [127:0] iorq_dat_V_3_reg_187;
reg    ap_block_state5_pp0_stage4_iter0;
wire   [63:0] zext_ln36_fu_132_p1;
reg   [15:0] i_fu_66;
wire   [15:0] add_ln36_fu_122_p2;
wire    ap_loop_init;
reg   [15:0] ap_sig_allocacmp_i_1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 ap_done_reg = 1'b0;
end

dac_table_8x_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
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
        end else if ((~((icmp_ln36_reg_163 == 1'd0) & (m_axi_gmem_RVALID == 1'b0)) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_loop_init == 1'b1))) begin
        i_fu_66 <= 16'd0;
    end else if ((~((icmp_ln36_reg_163 == 1'd0) & (m_axi_gmem_RVALID == 1'b0)) & (icmp_ln36_reg_163 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        i_fu_66 <= add_ln36_fu_122_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_reg_157 <= ap_sig_allocacmp_i_1;
        icmp_ln36_reg_163 <= icmp_ln36_fu_110_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((m_axi_gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        iorq_dat_V_1_reg_177 <= m_axi_gmem_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((m_axi_gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        iorq_dat_V_2_reg_182 <= m_axi_gmem_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((m_axi_gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        iorq_dat_V_3_reg_187 <= m_axi_gmem_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((~((icmp_ln36_reg_163 == 1'd0) & (m_axi_gmem_RVALID == 1'b0)) & (icmp_ln36_reg_163 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        iorq_dat_V_reg_172 <= m_axi_gmem_RDATA;
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln36_reg_163 == 1'd0) & (m_axi_gmem_RVALID == 1'b0))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((m_axi_gmem_RVALID == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((m_axi_gmem_RVALID == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((m_axi_gmem_RVALID == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

assign ap_ST_fsm_state6_blk = 1'b0;

always @ (*) begin
    if ((~((icmp_ln36_reg_163 == 1'd0) & (m_axi_gmem_RVALID == 1'b0)) & (icmp_ln36_reg_163 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if ((~((icmp_ln36_reg_163 == 1'd0) & (m_axi_gmem_RVALID == 1'b0)) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_1 = 16'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_66;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        comb2wide_V_ce1 = 1'b1;
    end else begin
        comb2wide_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        comb2wide_V_we1 = 1'b1;
    end else begin
        comb2wide_V_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | ((icmp_ln36_reg_163 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        gmem_blk_n_R = m_axi_gmem_RVALID;
    end else begin
        gmem_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((~((icmp_ln36_reg_163 == 1'd0) & (m_axi_gmem_RVALID == 1'b0)) & (icmp_ln36_reg_163 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((m_axi_gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state5)) | ((m_axi_gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state4)) | ((m_axi_gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state3)))) begin
        m_axi_gmem_RREADY = 1'b1;
    end else begin
        m_axi_gmem_RREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((icmp_ln36_reg_163 == 1'd0) & (m_axi_gmem_RVALID == 1'b0)) & (icmp_ln36_reg_163 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((icmp_ln36_reg_163 == 1'd0) & (m_axi_gmem_RVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((m_axi_gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((m_axi_gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((m_axi_gmem_RVALID == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln36_fu_122_p2 = (i_1_reg_157 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

always @ (*) begin
    ap_block_state2_pp0_stage1_iter0 = ((icmp_ln36_reg_163 == 1'd0) & (m_axi_gmem_RVALID == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage2_iter0 = (m_axi_gmem_RVALID == 1'b0);
end

always @ (*) begin
    ap_block_state4_pp0_stage3_iter0 = (m_axi_gmem_RVALID == 1'b0);
end

always @ (*) begin
    ap_block_state5_pp0_stage4_iter0 = (m_axi_gmem_RVALID == 1'b0);
end

assign ap_block_state6_pp0_stage5_iter0 = ~(1'b1 == 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign comb2wide_V_address1 = zext_ln36_fu_132_p1;

assign comb2wide_V_d1 = {{{{iorq_dat_V_3_reg_187}, {iorq_dat_V_2_reg_182}}, {iorq_dat_V_1_reg_177}}, {iorq_dat_V_reg_172}};

assign icmp_ln36_fu_110_p2 = ((ap_sig_allocacmp_i_1 == 16'd32768) ? 1'b1 : 1'b0);

assign m_axi_gmem_ARADDR = 64'd0;

assign m_axi_gmem_ARBURST = 2'd0;

assign m_axi_gmem_ARCACHE = 4'd0;

assign m_axi_gmem_ARID = 1'd0;

assign m_axi_gmem_ARLEN = 32'd0;

assign m_axi_gmem_ARLOCK = 2'd0;

assign m_axi_gmem_ARPROT = 3'd0;

assign m_axi_gmem_ARQOS = 4'd0;

assign m_axi_gmem_ARREGION = 4'd0;

assign m_axi_gmem_ARSIZE = 3'd0;

assign m_axi_gmem_ARUSER = 1'd0;

assign m_axi_gmem_ARVALID = 1'b0;

assign m_axi_gmem_AWADDR = 64'd0;

assign m_axi_gmem_AWBURST = 2'd0;

assign m_axi_gmem_AWCACHE = 4'd0;

assign m_axi_gmem_AWID = 1'd0;

assign m_axi_gmem_AWLEN = 32'd0;

assign m_axi_gmem_AWLOCK = 2'd0;

assign m_axi_gmem_AWPROT = 3'd0;

assign m_axi_gmem_AWQOS = 4'd0;

assign m_axi_gmem_AWREGION = 4'd0;

assign m_axi_gmem_AWSIZE = 3'd0;

assign m_axi_gmem_AWUSER = 1'd0;

assign m_axi_gmem_AWVALID = 1'b0;

assign m_axi_gmem_BREADY = 1'b0;

assign m_axi_gmem_WDATA = 128'd0;

assign m_axi_gmem_WID = 1'd0;

assign m_axi_gmem_WLAST = 1'b0;

assign m_axi_gmem_WSTRB = 16'd0;

assign m_axi_gmem_WUSER = 1'd0;

assign m_axi_gmem_WVALID = 1'b0;

assign zext_ln36_fu_132_p1 = i_1_reg_157;

endmodule //dac_table_8x_dac_table_8x_Pipeline_copy
