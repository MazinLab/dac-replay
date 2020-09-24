#include "ap_int.h"
#include "ap_fixed.h"
#include <stdio.h>
#include <string.h>
#include "hls_stream.h"

#define N_LANES 8

typedef unsigned short sample_t;
typedef ap_uint<15> samplectr_t;

typedef struct samplegroup_t {
	sample_t v[N_LANES];
} samplegroup_t;

typedef struct iqgroup_t {
	sample_t v[2*N_LANES];
} iqgroup_t;

typedef struct adcstream_t {
	sample_t data[N_LANES];
	bool last;
} adcstream_t;

typedef struct iqstream_t {
	//iqgroup_t data;
	sample_t data[2*N_LANES];
	bool last;
} iqstream_t;

typedef struct adcstreamint_t {
	ap_uint<128> data;
	bool last;
} adcstreamint_t;

typedef struct iqstreamint_t {
	//iqgroup_t data;
	ap_uint<256> data;
	bool last;
} iqstreamint_t;

const int MAX_SAMPLES=262144;


void dac_table_axim(volatile sample_t* a, unsigned int length, bool tlast, unsigned int replay_length, bool &run,
		hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout);
void dac_table_axilite(sample_t comb[MAX_SAMPLES/8][8][2], unsigned int length, bool tlast, unsigned int replay_length, bool &run,
		hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout);
