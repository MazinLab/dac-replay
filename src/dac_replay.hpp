#include "ap_int.h"
#include "ap_fixed.h"
#include <stdio.h>
#include <string.h>
#include "hls_stream.h"

#define N_LANES 8

typedef unsigned short sample_t;

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

const int BURST_LEN=64;
const int MAX_SAMPLES=262144;///8;

void dac_table_master(volatile sample_t* a, bool &config, unsigned int length, bool tlast,
			   	   	  unsigned int replay_length, adcstream_t &iout, adcstream_t &qout, iqstream_t &iqout);
void dac_table(sample_t comb[MAX_SAMPLES/8][8][2], unsigned int length, bool tlast,
			   unsigned int tlast_length, adcstream_t &iout, adcstream_t &qout, iqstream_t &iqout);
void dac_table_streams(sample_t comb[MAX_SAMPLES/8][8][2], unsigned int length, bool tlast,
			   unsigned int tlast_length, hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout);
