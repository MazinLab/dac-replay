// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xdac_table_axilite.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDac_table_axilite_CfgInitialize(XDac_table_axilite *InstancePtr, XDac_table_axilite_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDac_table_axilite_Start(XDac_table_axilite *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_AP_CTRL) & 0x80;
    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDac_table_axilite_IsDone(XDac_table_axilite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDac_table_axilite_IsIdle(XDac_table_axilite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDac_table_axilite_IsReady(XDac_table_axilite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDac_table_axilite_EnableAutoRestart(XDac_table_axilite *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XDac_table_axilite_DisableAutoRestart(XDac_table_axilite *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_AP_CTRL, 0);
}

void XDac_table_axilite_Set_length_V(XDac_table_axilite *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_LENGTH_V_DATA, Data);
}

u32 XDac_table_axilite_Get_length_V(XDac_table_axilite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_LENGTH_V_DATA);
    return Data;
}

void XDac_table_axilite_Set_tlast(XDac_table_axilite *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_TLAST_DATA, Data);
}

u32 XDac_table_axilite_Get_tlast(XDac_table_axilite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_TLAST_DATA);
    return Data;
}

void XDac_table_axilite_Set_replay_length_V(XDac_table_axilite *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_REPLAY_LENGTH_V_DATA, Data);
}

u32 XDac_table_axilite_Get_replay_length_V(XDac_table_axilite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_REPLAY_LENGTH_V_DATA);
    return Data;
}

void XDac_table_axilite_Set_run(XDac_table_axilite *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_RUN_DATA, Data);
}

u32 XDac_table_axilite_Get_run(XDac_table_axilite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_RUN_DATA);
    return Data;
}

u32 XDac_table_axilite_Get_comb_0_0_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_BASE);
}

u32 XDac_table_axilite_Get_comb_0_0_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_HIGH);
}

u32 XDac_table_axilite_Get_comb_0_0_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_0_0_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_0_0;
}

u32 XDac_table_axilite_Get_comb_0_0_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_0_0;
}

u32 XDac_table_axilite_Write_comb_0_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_0_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_0_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_0_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_0_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_0_1_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_BASE);
}

u32 XDac_table_axilite_Get_comb_0_1_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_HIGH);
}

u32 XDac_table_axilite_Get_comb_0_1_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_0_1_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_0_1;
}

u32 XDac_table_axilite_Get_comb_0_1_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_0_1;
}

u32 XDac_table_axilite_Write_comb_0_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_0_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_0_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_0_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_0_1_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_1_0_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_BASE);
}

u32 XDac_table_axilite_Get_comb_1_0_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_HIGH);
}

u32 XDac_table_axilite_Get_comb_1_0_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_1_0_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_1_0;
}

u32 XDac_table_axilite_Get_comb_1_0_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_1_0;
}

u32 XDac_table_axilite_Write_comb_1_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_1_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_1_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_1_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_0_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_1_1_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_BASE);
}

u32 XDac_table_axilite_Get_comb_1_1_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_HIGH);
}

u32 XDac_table_axilite_Get_comb_1_1_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_1_1_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_1_1;
}

u32 XDac_table_axilite_Get_comb_1_1_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_1_1;
}

u32 XDac_table_axilite_Write_comb_1_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_1_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_1_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_1_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_1_1_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_2_0_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_BASE);
}

u32 XDac_table_axilite_Get_comb_2_0_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_HIGH);
}

u32 XDac_table_axilite_Get_comb_2_0_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_2_0_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_2_0;
}

u32 XDac_table_axilite_Get_comb_2_0_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_2_0;
}

u32 XDac_table_axilite_Write_comb_2_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_2_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_2_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_2_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_0_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_2_1_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_BASE);
}

u32 XDac_table_axilite_Get_comb_2_1_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_HIGH);
}

u32 XDac_table_axilite_Get_comb_2_1_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_2_1_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_2_1;
}

u32 XDac_table_axilite_Get_comb_2_1_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_2_1;
}

u32 XDac_table_axilite_Write_comb_2_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_2_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_2_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_2_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_2_1_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_3_0_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_BASE);
}

u32 XDac_table_axilite_Get_comb_3_0_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_HIGH);
}

u32 XDac_table_axilite_Get_comb_3_0_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_3_0_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_3_0;
}

u32 XDac_table_axilite_Get_comb_3_0_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_3_0;
}

u32 XDac_table_axilite_Write_comb_3_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_3_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_3_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_3_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_0_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_3_1_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_BASE);
}

u32 XDac_table_axilite_Get_comb_3_1_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_HIGH);
}

u32 XDac_table_axilite_Get_comb_3_1_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_3_1_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_3_1;
}

u32 XDac_table_axilite_Get_comb_3_1_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_3_1;
}

u32 XDac_table_axilite_Write_comb_3_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_3_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_3_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_3_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_3_1_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_4_0_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_BASE);
}

u32 XDac_table_axilite_Get_comb_4_0_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_HIGH);
}

u32 XDac_table_axilite_Get_comb_4_0_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_4_0_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_4_0;
}

u32 XDac_table_axilite_Get_comb_4_0_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_4_0;
}

u32 XDac_table_axilite_Write_comb_4_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_4_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_4_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_4_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_0_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_4_1_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_BASE);
}

u32 XDac_table_axilite_Get_comb_4_1_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_HIGH);
}

u32 XDac_table_axilite_Get_comb_4_1_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_4_1_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_4_1;
}

u32 XDac_table_axilite_Get_comb_4_1_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_4_1;
}

u32 XDac_table_axilite_Write_comb_4_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_4_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_4_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_4_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_4_1_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_5_0_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_BASE);
}

u32 XDac_table_axilite_Get_comb_5_0_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_HIGH);
}

u32 XDac_table_axilite_Get_comb_5_0_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_5_0_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_5_0;
}

u32 XDac_table_axilite_Get_comb_5_0_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_5_0;
}

u32 XDac_table_axilite_Write_comb_5_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_5_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_5_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_5_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_0_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_5_1_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_BASE);
}

u32 XDac_table_axilite_Get_comb_5_1_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_HIGH);
}

u32 XDac_table_axilite_Get_comb_5_1_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_5_1_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_5_1;
}

u32 XDac_table_axilite_Get_comb_5_1_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_5_1;
}

u32 XDac_table_axilite_Write_comb_5_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_5_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_5_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_5_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_5_1_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_6_0_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_BASE);
}

u32 XDac_table_axilite_Get_comb_6_0_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_HIGH);
}

u32 XDac_table_axilite_Get_comb_6_0_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_6_0_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_6_0;
}

u32 XDac_table_axilite_Get_comb_6_0_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_6_0;
}

u32 XDac_table_axilite_Write_comb_6_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_6_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_6_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_6_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_0_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_6_1_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_BASE);
}

u32 XDac_table_axilite_Get_comb_6_1_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_HIGH);
}

u32 XDac_table_axilite_Get_comb_6_1_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_6_1_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_6_1;
}

u32 XDac_table_axilite_Get_comb_6_1_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_6_1;
}

u32 XDac_table_axilite_Write_comb_6_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_6_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_6_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_6_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_6_1_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_7_0_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_BASE);
}

u32 XDac_table_axilite_Get_comb_7_0_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_HIGH);
}

u32 XDac_table_axilite_Get_comb_7_0_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_7_0_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_7_0;
}

u32 XDac_table_axilite_Get_comb_7_0_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_7_0;
}

u32 XDac_table_axilite_Write_comb_7_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_7_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_7_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_7_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_0_BASE + offset + i);
    }
    return length;
}

u32 XDac_table_axilite_Get_comb_7_1_BaseAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_BASE);
}

u32 XDac_table_axilite_Get_comb_7_1_HighAddress(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_HIGH);
}

u32 XDac_table_axilite_Get_comb_7_1_TotalBytes(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_BASE + 1);
}

u32 XDac_table_axilite_Get_comb_7_1_BitWidth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_WIDTH_COMB_7_1;
}

u32 XDac_table_axilite_Get_comb_7_1_Depth(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDAC_TABLE_AXILITE_CONTROL_DEPTH_COMB_7_1;
}

u32 XDac_table_axilite_Write_comb_7_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_7_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_BASE + (offset + i)*4);
    }
    return length;
}

u32 XDac_table_axilite_Write_comb_7_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XDac_table_axilite_Read_comb_7_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_HIGH - XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XDAC_TABLE_AXILITE_CONTROL_ADDR_COMB_7_1_BASE + offset + i);
    }
    return length;
}

void XDac_table_axilite_InterruptGlobalEnable(XDac_table_axilite *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_GIE, 1);
}

void XDac_table_axilite_InterruptGlobalDisable(XDac_table_axilite *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_GIE, 0);
}

void XDac_table_axilite_InterruptEnable(XDac_table_axilite *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_IER);
    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_IER, Register | Mask);
}

void XDac_table_axilite_InterruptDisable(XDac_table_axilite *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_IER);
    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_IER, Register & (~Mask));
}

void XDac_table_axilite_InterruptClear(XDac_table_axilite *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axilite_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_ISR, Mask);
}

u32 XDac_table_axilite_InterruptGetEnabled(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_IER);
}

u32 XDac_table_axilite_InterruptGetStatus(XDac_table_axilite *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDac_table_axilite_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXILITE_CONTROL_ADDR_ISR);
}

