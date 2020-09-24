// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdac_table_axilite.h"

extern XDac_table_axilite_Config XDac_table_axilite_ConfigTable[];

XDac_table_axilite_Config *XDac_table_axilite_LookupConfig(u16 DeviceId) {
	XDac_table_axilite_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDAC_TABLE_AXILITE_NUM_INSTANCES; Index++) {
		if (XDac_table_axilite_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDac_table_axilite_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDac_table_axilite_Initialize(XDac_table_axilite *InstancePtr, u16 DeviceId) {
	XDac_table_axilite_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDac_table_axilite_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDac_table_axilite_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

