#include "ap_int.h"
#include "ap_fixed.h"
#include <stdio.h>
#include <string.h>
#include "hls_stream.h"
#include "axi.h"

#define N_LANES 16

typedef unsigned short sample_t;
typedef unsigned int sample32_t;
typedef ap_uint<28> sample28_t;
typedef ap_uint<15> samplectr_t;


typedef ap_axiu<256,0,0,0> adcstreamint_t;

typedef ap_axiu<512,8,0,0> iqstreamint_t;


const int MAX_SAMPLES=262144;

void dac_table_axim(volatile sample32_t* a, samplectr_t length, bool tlast, samplectr_t replay_length, bool &run,
		hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout);
