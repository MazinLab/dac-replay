// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XDAC_TABLE_AXILITE_H
#define XDAC_TABLE_AXILITE_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xdac_table_axilite_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XDac_table_axilite_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XDac_table_axilite;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDac_table_axilite_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDac_table_axilite_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDac_table_axilite_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDac_table_axilite_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XDac_table_axilite_Initialize(XDac_table_axilite *InstancePtr, u16 DeviceId);
XDac_table_axilite_Config* XDac_table_axilite_LookupConfig(u16 DeviceId);
int XDac_table_axilite_CfgInitialize(XDac_table_axilite *InstancePtr, XDac_table_axilite_Config *ConfigPtr);
#else
int XDac_table_axilite_Initialize(XDac_table_axilite *InstancePtr, const char* InstanceName);
int XDac_table_axilite_Release(XDac_table_axilite *InstancePtr);
#endif

void XDac_table_axilite_Start(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_IsDone(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_IsIdle(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_IsReady(XDac_table_axilite *InstancePtr);
void XDac_table_axilite_EnableAutoRestart(XDac_table_axilite *InstancePtr);
void XDac_table_axilite_DisableAutoRestart(XDac_table_axilite *InstancePtr);

void XDac_table_axilite_Set_length_V(XDac_table_axilite *InstancePtr, u32 Data);
u32 XDac_table_axilite_Get_length_V(XDac_table_axilite *InstancePtr);
void XDac_table_axilite_Set_tlast(XDac_table_axilite *InstancePtr, u32 Data);
u32 XDac_table_axilite_Get_tlast(XDac_table_axilite *InstancePtr);
void XDac_table_axilite_Set_replay_length_V(XDac_table_axilite *InstancePtr, u32 Data);
u32 XDac_table_axilite_Get_replay_length_V(XDac_table_axilite *InstancePtr);
void XDac_table_axilite_Set_run(XDac_table_axilite *InstancePtr, u32 Data);
u32 XDac_table_axilite_Get_run(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_0_0_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_0_0_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_0_0_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_0_0_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_0_0_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_0_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_0_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_0_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_0_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_0_1_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_0_1_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_0_1_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_0_1_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_0_1_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_0_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_0_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_0_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_0_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_1_0_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_1_0_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_1_0_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_1_0_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_1_0_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_1_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_1_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_1_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_1_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_1_1_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_1_1_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_1_1_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_1_1_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_1_1_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_1_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_1_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_1_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_1_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_2_0_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_2_0_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_2_0_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_2_0_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_2_0_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_2_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_2_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_2_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_2_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_2_1_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_2_1_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_2_1_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_2_1_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_2_1_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_2_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_2_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_2_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_2_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_3_0_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_3_0_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_3_0_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_3_0_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_3_0_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_3_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_3_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_3_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_3_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_3_1_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_3_1_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_3_1_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_3_1_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_3_1_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_3_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_3_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_3_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_3_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_4_0_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_4_0_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_4_0_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_4_0_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_4_0_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_4_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_4_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_4_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_4_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_4_1_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_4_1_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_4_1_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_4_1_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_4_1_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_4_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_4_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_4_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_4_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_5_0_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_5_0_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_5_0_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_5_0_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_5_0_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_5_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_5_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_5_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_5_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_5_1_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_5_1_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_5_1_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_5_1_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_5_1_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_5_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_5_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_5_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_5_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_6_0_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_6_0_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_6_0_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_6_0_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_6_0_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_6_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_6_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_6_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_6_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_6_1_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_6_1_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_6_1_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_6_1_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_6_1_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_6_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_6_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_6_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_6_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_7_0_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_7_0_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_7_0_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_7_0_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_7_0_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_7_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_7_0_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_7_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_7_0_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Get_comb_7_1_BaseAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_7_1_HighAddress(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_7_1_TotalBytes(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_7_1_BitWidth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Get_comb_7_1_Depth(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_Write_comb_7_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Read_comb_7_1_Words(XDac_table_axilite *InstancePtr, int offset, int *data, int length);
u32 XDac_table_axilite_Write_comb_7_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);
u32 XDac_table_axilite_Read_comb_7_1_Bytes(XDac_table_axilite *InstancePtr, int offset, char *data, int length);

void XDac_table_axilite_InterruptGlobalEnable(XDac_table_axilite *InstancePtr);
void XDac_table_axilite_InterruptGlobalDisable(XDac_table_axilite *InstancePtr);
void XDac_table_axilite_InterruptEnable(XDac_table_axilite *InstancePtr, u32 Mask);
void XDac_table_axilite_InterruptDisable(XDac_table_axilite *InstancePtr, u32 Mask);
void XDac_table_axilite_InterruptClear(XDac_table_axilite *InstancePtr, u32 Mask);
u32 XDac_table_axilite_InterruptGetEnabled(XDac_table_axilite *InstancePtr);
u32 XDac_table_axilite_InterruptGetStatus(XDac_table_axilite *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
