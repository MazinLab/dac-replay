// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xdac_table_axim.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDac_table_axim_CfgInitialize(XDac_table_axim *InstancePtr, XDac_table_axim_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDac_table_axim_Start(XDac_table_axim *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_AP_CTRL) & 0x80;
    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDac_table_axim_IsDone(XDac_table_axim *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDac_table_axim_IsIdle(XDac_table_axim *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDac_table_axim_IsReady(XDac_table_axim *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDac_table_axim_EnableAutoRestart(XDac_table_axim *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XDac_table_axim_DisableAutoRestart(XDac_table_axim *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_AP_CTRL, 0);
}

void XDac_table_axim_Set_a(XDac_table_axim *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_A_DATA, Data);
}

u32 XDac_table_axim_Get_a(XDac_table_axim *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_A_DATA);
    return Data;
}

void XDac_table_axim_Set_length_V(XDac_table_axim *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_LENGTH_V_DATA, Data);
}

u32 XDac_table_axim_Get_length_V(XDac_table_axim *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_LENGTH_V_DATA);
    return Data;
}

void XDac_table_axim_Set_tlast(XDac_table_axim *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_TLAST_DATA, Data);
}

u32 XDac_table_axim_Get_tlast(XDac_table_axim *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_TLAST_DATA);
    return Data;
}

void XDac_table_axim_Set_replay_length_V(XDac_table_axim *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_REPLAY_LENGTH_V_DATA, Data);
}

u32 XDac_table_axim_Get_replay_length_V(XDac_table_axim *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_REPLAY_LENGTH_V_DATA);
    return Data;
}

void XDac_table_axim_Set_run(XDac_table_axim *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_RUN_DATA, Data);
}

u32 XDac_table_axim_Get_run(XDac_table_axim *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_RUN_DATA);
    return Data;
}

void XDac_table_axim_InterruptGlobalEnable(XDac_table_axim *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_GIE, 1);
}

void XDac_table_axim_InterruptGlobalDisable(XDac_table_axim *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_GIE, 0);
}

void XDac_table_axim_InterruptEnable(XDac_table_axim *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_IER);
    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_IER, Register | Mask);
}

void XDac_table_axim_InterruptDisable(XDac_table_axim *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_IER);
    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_IER, Register & (~Mask));
}

void XDac_table_axim_InterruptClear(XDac_table_axim *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_axim_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_ISR, Mask);
}

u32 XDac_table_axim_InterruptGetEnabled(XDac_table_axim *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_IER);
}

u32 XDac_table_axim_InterruptGetStatus(XDac_table_axim *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDac_table_axim_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_AXIM_CONTROL_ADDR_ISR);
}

