// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XDAC_TABLE_H
#define XDAC_TABLE_H

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
#include "xdac_table_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XDac_table_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XDac_table;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDac_table_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDac_table_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDac_table_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDac_table_ReadReg(BaseAddress, RegOffset) \
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
int XDac_table_Initialize(XDac_table *InstancePtr, u16 DeviceId);
XDac_table_Config* XDac_table_LookupConfig(u16 DeviceId);
int XDac_table_CfgInitialize(XDac_table *InstancePtr, XDac_table_Config *ConfigPtr);
#else
int XDac_table_Initialize(XDac_table *InstancePtr, const char* InstanceName);
int XDac_table_Release(XDac_table *InstancePtr);
#endif

void XDac_table_Start(XDac_table *InstancePtr);
u32 XDac_table_IsDone(XDac_table *InstancePtr);
u32 XDac_table_IsIdle(XDac_table *InstancePtr);
u32 XDac_table_IsReady(XDac_table *InstancePtr);
void XDac_table_EnableAutoRestart(XDac_table *InstancePtr);
void XDac_table_DisableAutoRestart(XDac_table *InstancePtr);

void XDac_table_Set_length_r(XDac_table *InstancePtr, u32 Data);
u32 XDac_table_Get_length_r(XDac_table *InstancePtr);
void XDac_table_Set_tlast(XDac_table *InstancePtr, u32 Data);
u32 XDac_table_Get_tlast(XDac_table *InstancePtr);
void XDac_table_Set_tlast_length(XDac_table *InstancePtr, u32 Data);
u32 XDac_table_Get_tlast_length(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_0_0_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_0_0_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_0_0_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_0_0_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_0_0_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_0_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_0_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_0_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_0_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_0_1_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_0_1_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_0_1_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_0_1_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_0_1_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_0_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_0_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_0_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_0_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_1_0_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_1_0_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_1_0_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_1_0_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_1_0_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_1_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_1_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_1_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_1_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_1_1_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_1_1_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_1_1_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_1_1_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_1_1_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_1_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_1_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_1_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_1_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_2_0_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_2_0_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_2_0_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_2_0_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_2_0_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_2_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_2_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_2_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_2_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_2_1_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_2_1_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_2_1_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_2_1_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_2_1_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_2_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_2_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_2_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_2_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_3_0_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_3_0_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_3_0_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_3_0_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_3_0_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_3_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_3_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_3_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_3_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_3_1_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_3_1_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_3_1_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_3_1_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_3_1_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_3_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_3_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_3_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_3_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_4_0_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_4_0_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_4_0_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_4_0_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_4_0_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_4_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_4_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_4_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_4_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_4_1_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_4_1_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_4_1_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_4_1_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_4_1_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_4_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_4_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_4_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_4_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_5_0_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_5_0_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_5_0_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_5_0_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_5_0_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_5_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_5_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_5_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_5_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_5_1_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_5_1_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_5_1_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_5_1_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_5_1_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_5_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_5_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_5_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_5_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_6_0_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_6_0_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_6_0_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_6_0_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_6_0_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_6_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_6_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_6_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_6_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_6_1_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_6_1_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_6_1_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_6_1_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_6_1_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_6_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_6_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_6_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_6_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_7_0_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_7_0_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_7_0_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_7_0_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_7_0_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_7_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_7_0_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_7_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_7_0_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Get_comb_7_1_BaseAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_7_1_HighAddress(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_7_1_TotalBytes(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_7_1_BitWidth(XDac_table *InstancePtr);
u32 XDac_table_Get_comb_7_1_Depth(XDac_table *InstancePtr);
u32 XDac_table_Write_comb_7_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Read_comb_7_1_Words(XDac_table *InstancePtr, int offset, int *data, int length);
u32 XDac_table_Write_comb_7_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);
u32 XDac_table_Read_comb_7_1_Bytes(XDac_table *InstancePtr, int offset, char *data, int length);

void XDac_table_InterruptGlobalEnable(XDac_table *InstancePtr);
void XDac_table_InterruptGlobalDisable(XDac_table *InstancePtr);
void XDac_table_InterruptEnable(XDac_table *InstancePtr, u32 Mask);
void XDac_table_InterruptDisable(XDac_table *InstancePtr, u32 Mask);
void XDac_table_InterruptClear(XDac_table *InstancePtr, u32 Mask);
u32 XDac_table_InterruptGetEnabled(XDac_table *InstancePtr);
u32 XDac_table_InterruptGetStatus(XDac_table *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
