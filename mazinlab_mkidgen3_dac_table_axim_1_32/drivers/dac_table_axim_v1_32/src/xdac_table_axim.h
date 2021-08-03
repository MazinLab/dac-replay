// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XDAC_TABLE_AXIM_H
#define XDAC_TABLE_AXIM_H

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
#include "xdac_table_axim_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XDac_table_axim_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XDac_table_axim;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDac_table_axim_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDac_table_axim_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDac_table_axim_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDac_table_axim_ReadReg(BaseAddress, RegOffset) \
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
int XDac_table_axim_Initialize(XDac_table_axim *InstancePtr, u16 DeviceId);
XDac_table_axim_Config* XDac_table_axim_LookupConfig(u16 DeviceId);
int XDac_table_axim_CfgInitialize(XDac_table_axim *InstancePtr, XDac_table_axim_Config *ConfigPtr);
#else
int XDac_table_axim_Initialize(XDac_table_axim *InstancePtr, const char* InstanceName);
int XDac_table_axim_Release(XDac_table_axim *InstancePtr);
#endif

void XDac_table_axim_Start(XDac_table_axim *InstancePtr);
u32 XDac_table_axim_IsDone(XDac_table_axim *InstancePtr);
u32 XDac_table_axim_IsIdle(XDac_table_axim *InstancePtr);
u32 XDac_table_axim_IsReady(XDac_table_axim *InstancePtr);
void XDac_table_axim_EnableAutoRestart(XDac_table_axim *InstancePtr);
void XDac_table_axim_DisableAutoRestart(XDac_table_axim *InstancePtr);

void XDac_table_axim_Set_a(XDac_table_axim *InstancePtr, u64 Data);
u64 XDac_table_axim_Get_a(XDac_table_axim *InstancePtr);
void XDac_table_axim_Set_length_r(XDac_table_axim *InstancePtr, u32 Data);
u32 XDac_table_axim_Get_length_r(XDac_table_axim *InstancePtr);
void XDac_table_axim_Set_tlast(XDac_table_axim *InstancePtr, u32 Data);
u32 XDac_table_axim_Get_tlast(XDac_table_axim *InstancePtr);
void XDac_table_axim_Set_replay_length(XDac_table_axim *InstancePtr, u32 Data);
u32 XDac_table_axim_Get_replay_length(XDac_table_axim *InstancePtr);
void XDac_table_axim_Set_run(XDac_table_axim *InstancePtr, u32 Data);
u32 XDac_table_axim_Get_run(XDac_table_axim *InstancePtr);

void XDac_table_axim_InterruptGlobalEnable(XDac_table_axim *InstancePtr);
void XDac_table_axim_InterruptGlobalDisable(XDac_table_axim *InstancePtr);
void XDac_table_axim_InterruptEnable(XDac_table_axim *InstancePtr, u32 Mask);
void XDac_table_axim_InterruptDisable(XDac_table_axim *InstancePtr, u32 Mask);
void XDac_table_axim_InterruptClear(XDac_table_axim *InstancePtr, u32 Mask);
u32 XDac_table_axim_InterruptGetEnabled(XDac_table_axim *InstancePtr);
u32 XDac_table_axim_InterruptGetStatus(XDac_table_axim *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
