// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdac_table_axim.h"

extern XDac_table_axim_Config XDac_table_axim_ConfigTable[];

XDac_table_axim_Config *XDac_table_axim_LookupConfig(u16 DeviceId) {
	XDac_table_axim_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDAC_TABLE_AXIM_NUM_INSTANCES; Index++) {
		if (XDac_table_axim_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDac_table_axim_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDac_table_axim_Initialize(XDac_table_axim *InstancePtr, u16 DeviceId) {
	XDac_table_axim_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDac_table_axim_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDac_table_axim_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

