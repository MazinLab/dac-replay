#include "ap_int.h"
#include "ap_fixed.h"

#define N_LANES 8
#define MAX_SAMPLES 262144  //8x2^15

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

void dac_table(sample_t comb[MAX_SAMPLES][2], unsigned int length, bool tlast,
			   unsigned int tlast_length, adcstream_t &iout, adcstream_t &qout, iqstream_t &iqout) {
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE axis register port=qout
#pragma HLS INTERFACE axis register port=iqout
#pragma HLS ARRAY_PARTITION variable=comb dim=2 complete
#pragma HLS ARRAY_PARTITION variable=comb dim=1 block factor=8
#pragma HLS INTERFACE s_axilite port=comb bundle=control clock=control_clk
#pragma HLS INTERFACE s_axilite port=length bundle=control
#pragma HLS INTERFACE s_axilite port=tlast bundle=control
#pragma HLS INTERFACE s_axilite port=tlast_length bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

	unsigned int tmp=length;
	if (length>MAX_SAMPLES )
		tmp=MAX_SAMPLES;
	if (tmp==0) tmp=1;
	for (unsigned int ndx=0;ndx<tmp;ndx+=N_LANES) {
			sample_t ival[N_LANES], qval[N_LANES];
			load: for (int i=0;i<N_LANES;i++) {
				ival[i]=comb[ndx+i][0];
				qval[i]=comb[ndx+i][1];
			}

			outi: for (int i=0;i<N_LANES;i++) {
				iout.data[i]=ival[i];
			}
			iout.last=ndx==tlast_length-1 && tlast;

			outq: for (int i=0;i<N_LANES;i++) {
				qout.data[i]=qval[i];
			}
			qout.last=ndx==tlast_length-1 && tlast;

			outiq: for (int i=0;i<2*N_LANES;i++) {
				iqout.data[i]=i%2 ? qval[i/2]: ival[i/2];
			}
			iqout.last=ndx==tlast_length-1 && tlast;
	}

}
