// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdac_table.h"

extern XDac_table_Config XDac_table_ConfigTable[];

XDac_table_Config *XDac_table_LookupConfig(u16 DeviceId) {
	XDac_table_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDAC_TABLE_NUM_INSTANCES; Index++) {
		if (XDac_table_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDac_table_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDac_table_Initialize(XDac_table *InstancePtr, u16 DeviceId) {
	XDac_table_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDac_table_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDac_table_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

