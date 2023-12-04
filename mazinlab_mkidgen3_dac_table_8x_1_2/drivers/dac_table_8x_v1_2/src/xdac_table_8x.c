// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xdac_table_8x.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDac_table_8x_CfgInitialize(XDac_table_8x *InstancePtr, XDac_table_8x_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDac_table_8x_Start(XDac_table_8x *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_8x_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_AP_CTRL) & 0x80;
    XDac_table_8x_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDac_table_8x_IsDone(XDac_table_8x *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_8x_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDac_table_8x_IsIdle(XDac_table_8x *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_8x_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDac_table_8x_IsReady(XDac_table_8x *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_8x_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDac_table_8x_EnableAutoRestart(XDac_table_8x *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_8x_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XDac_table_8x_DisableAutoRestart(XDac_table_8x *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_8x_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_AP_CTRL, 0);
}

void XDac_table_8x_Set_run(XDac_table_8x *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_8x_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_RUN_DATA, Data);
}

u32 XDac_table_8x_Get_run(XDac_table_8x *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDac_table_8x_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_RUN_DATA);
    return Data;
}

void XDac_table_8x_InterruptGlobalEnable(XDac_table_8x *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_8x_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_GIE, 1);
}

void XDac_table_8x_InterruptGlobalDisable(XDac_table_8x *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDac_table_8x_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_GIE, 0);
}

void XDac_table_8x_InterruptEnable(XDac_table_8x *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDac_table_8x_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_IER);
    XDac_table_8x_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_IER, Register | Mask);
}

void XDac_table_8x_InterruptDisable(XDac_table_8x *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDac_table_8x_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_IER);
    XDac_table_8x_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_IER, Register & (~Mask));
}

void XDac_table_8x_InterruptClear(XDac_table_8x *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XDac_table_8x_WriteReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_ISR, Mask);
}

u32 XDac_table_8x_InterruptGetEnabled(XDac_table_8x *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDac_table_8x_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_IER);
}

u32 XDac_table_8x_InterruptGetStatus(XDac_table_8x *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XDac_table_8x_ReadReg(InstancePtr->Control_BaseAddress, XDAC_TABLE_8X_CONTROL_ADDR_ISR);
}

