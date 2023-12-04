#include "ap_int.h"
#include "ap_fixed.h"
#include <stdio.h>
#include <string.h>
#include "hls_stream.h"
#include "ap_axi_sdata.h"

#define N_LANES 8
const int MAX_IQ_SAMPLES=262144*2; //IQ samples, 2MiB, must drop to 1MiB to simulate w/o segfault on windows

typedef unsigned short sample_t;
typedef ap_uint<16> samplectr_t; //must be log2(MAX_IQ_SAMPLES/N_LANES/2)

typedef ap_uint<32> iq_t;
typedef ap_uint<128> iq4x_t;
typedef ap_uint<256> iq8x_t;
typedef ap_uint<512> iq16x_t;
typedef ap_uint<1024> iq32x_t;
typedef ap_uint<128> sample8x_t; //i or q
typedef ap_uint<256> sample16x_t; //i or q

typedef ap_axiu<128,0,0,0> adcstreamint_t;
typedef ap_axiu<256,8,0,0> iqstreamint_t;

void dac_table_8x(sample16x_t a[MAX_IQ_SAMPLES/8], bool run, hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout);

#include <iostream>

using namespace std;

inline iq8x_t i_and_q_to_iq(sample8x_t i, sample8x_t q){
	iq8x_t iq;
	for (int lane=0;lane<8;lane++) {
		iq_t tmp;
		tmp.range(15,0)=i.range(16*(lane+1)-1, 16*lane);
		tmp.range(31,16)=q.range(16*(lane+1)-1, 16*lane);
		iq.range(32*(lane+1)-1, lane*32)=tmp;
	}
	return iq;
}

inline iq16x_t i_and_q_to_iq(sample16x_t i, sample16x_t q){
	iq16x_t iq;
	for (int lane=0;lane<16;lane++) {
		iq_t tmp;
		tmp.range(15,0)=i.range(16*(lane+1)-1, 16*lane);
		tmp.range(31,16)=q.range(16*(lane+1)-1, 16*lane);
		iq.range(32*(lane+1)-1, lane*32)=tmp;
	}
	return iq;
}

inline void printu16_fromN(ap_uint<1024> x) {
	for (int i=0;i<64;i++) cout<<x.range((i+1)*16-1,i*16).to_uint()<<", ";
}

inline void printu16_fromN(ap_uint<512> x) {
	for (int i=0;i<32;i++) cout<<x.range((i+1)*16-1,i*16).to_uint()<<", ";
}

inline void printu16_fromN(ap_uint<256> x) {
	for (int i=0;i<16;i++) cout<<x.range((i+1)*16-1,i*16).to_uint()<<", ";
}

inline void printu16_fromN(ap_uint<128> x) {
	for (int i=0;i<8;i++) cout<<x.range((i+1)*16-1,i*16).to_uint()<<", ";
}
