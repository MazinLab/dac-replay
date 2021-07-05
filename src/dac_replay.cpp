#include "dac_replay.hpp"

#include <iostream>
using namespace std;

void dac_table_axim(volatile sample32_t* a, samplectr_t length, bool tlast, samplectr_t replay_length, bool &run,
		hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout) {
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE axis register port=qout
#pragma HLS INTERFACE axis register port=iqout
#pragma HLS INTERFACE m_axi port=a depth=2*MAX_SAMPLES max_read_burst_length=256 num_read_outstanding=1 offset=slave //bundle=control
#pragma HLS INTERFACE s_axilite port=a bundle=control
#pragma HLS INTERFACE s_axilite port=length bundle=control
#pragma HLS INTERFACE s_axilite port=tlast bundle=control
#pragma HLS INTERFACE s_axilite port=replay_length bundle=control
#pragma HLS INTERFACE s_axilite port=run bundle=control
//NB that RTL cosim will fail if the return and axim ports are bundled with the other args
#pragma HLS INTERFACE s_axilite port=return bundle=control


	samplectr_t sample, last_counter, foo, bar;
	sample32_t comb[MAX_SAMPLES/N_LANES][N_LANES];
#pragma HLS ARRAY_PARTITION variable=comb dim=2 complete

	sample=0;
	foo=replay_length-1;
	bar=length-1;
	last_counter=foo;

	memcpy(comb, (const sample32_t*) a, MAX_SAMPLES*sizeof(sample32_t));

//	runloop: for (int i=0;i<length*2;i++) {
	runloop: while(run) {
#pragma HLS PIPELINE II=1
		bool set_last;
		sample32_t iqval[N_LANES];
		adcstreamint_t itmp, qtmp;
		iqstreamint_t iqtmp;

		if (last_counter==0) {
			set_last=tlast;
			last_counter=foo;
		} else{
			set_last=false;
			last_counter--;
		}

		load: for (int lane=0;lane<N_LANES;lane++) {
			iqval[lane]=comb[sample][lane];
		}

		outtmp: for (int lane=0;lane<N_LANES;lane++) {
			itmp.data.range((lane+1)*16-1, lane*16)=iqval[lane]&0xffff;
			qtmp.data.range((lane+1)*16-1, lane*16)=iqval[lane]>>16;
			iqtmp.data.range((lane+1)*32-1, lane*32)=iqval[lane];
		}
		itmp.last=set_last;
		qtmp.last=set_last;
		iqtmp.user=sample;
		iqtmp.last=set_last;

		iout.write(itmp);
		qout.write(qtmp);
		iqout.write(iqtmp);

		if (sample==bar) sample=0;
		else sample++;
	}

}
