// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdac_table_8x.h"

extern XDac_table_8x_Config XDac_table_8x_ConfigTable[];

XDac_table_8x_Config *XDac_table_8x_LookupConfig(u16 DeviceId) {
	XDac_table_8x_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDAC_TABLE_8X_NUM_INSTANCES; Index++) {
		if (XDac_table_8x_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDac_table_8x_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDac_table_8x_Initialize(XDac_table_8x *InstancePtr, u16 DeviceId) {
	XDac_table_8x_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDac_table_8x_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDac_table_8x_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

