// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XDAC_TABLE_8X_H
#define XDAC_TABLE_8X_H

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
#include "xdac_table_8x_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XDac_table_8x_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XDac_table_8x;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDac_table_8x_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDac_table_8x_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDac_table_8x_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDac_table_8x_ReadReg(BaseAddress, RegOffset) \
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
int XDac_table_8x_Initialize(XDac_table_8x *InstancePtr, u16 DeviceId);
XDac_table_8x_Config* XDac_table_8x_LookupConfig(u16 DeviceId);
int XDac_table_8x_CfgInitialize(XDac_table_8x *InstancePtr, XDac_table_8x_Config *ConfigPtr);
#else
int XDac_table_8x_Initialize(XDac_table_8x *InstancePtr, const char* InstanceName);
int XDac_table_8x_Release(XDac_table_8x *InstancePtr);
#endif

void XDac_table_8x_Start(XDac_table_8x *InstancePtr);
u32 XDac_table_8x_IsDone(XDac_table_8x *InstancePtr);
u32 XDac_table_8x_IsIdle(XDac_table_8x *InstancePtr);
u32 XDac_table_8x_IsReady(XDac_table_8x *InstancePtr);
void XDac_table_8x_EnableAutoRestart(XDac_table_8x *InstancePtr);
void XDac_table_8x_DisableAutoRestart(XDac_table_8x *InstancePtr);

void XDac_table_8x_Set_a(XDac_table_8x *InstancePtr, u64 Data);
u64 XDac_table_8x_Get_a(XDac_table_8x *InstancePtr);
void XDac_table_8x_Set_run(XDac_table_8x *InstancePtr, u32 Data);
u32 XDac_table_8x_Get_run(XDac_table_8x *InstancePtr);

void XDac_table_8x_InterruptGlobalEnable(XDac_table_8x *InstancePtr);
void XDac_table_8x_InterruptGlobalDisable(XDac_table_8x *InstancePtr);
void XDac_table_8x_InterruptEnable(XDac_table_8x *InstancePtr, u32 Mask);
void XDac_table_8x_InterruptDisable(XDac_table_8x *InstancePtr, u32 Mask);
void XDac_table_8x_InterruptClear(XDac_table_8x *InstancePtr, u32 Mask);
u32 XDac_table_8x_InterruptGetEnabled(XDac_table_8x *InstancePtr);
u32 XDac_table_8x_InterruptGetStatus(XDac_table_8x *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
