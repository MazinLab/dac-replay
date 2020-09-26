#include "dac_replay.hpp"

#include <iostream>
using namespace std;

void dac_table_axim(volatile sample32_t* a, samplectr_t length, bool tlast, samplectr_t replay_length, bool &run,
		hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout) {
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE axis register port=qout
#pragma HLS INTERFACE axis register port=iqout
#pragma HLS INTERFACE m_axi port=a depth=2*MAX_SAMPLES max_read_burst_length=256 bundle=control offset=slave num_read_outstanding=0
#pragma HLS INTERFACE s_axilite port=length bundle=control
#pragma HLS INTERFACE s_axilite port=tlast bundle=control
#pragma HLS INTERFACE s_axilite port=replay_length bundle=control
#pragma HLS INTERFACE s_axilite port=run bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control //clock=control_clk


	samplectr_t sample, last_counter, foo, bar;
	sample32_t comb[MAX_SAMPLES/N_LANES][N_LANES];
#pragma HLS ARRAY_PARTITION variable=comb dim=2 complete

	sample=0;
	foo=replay_length-1;
	bar=length-1;
//	if (length > MAX_SAMPLES/N_LANES) bar=MAX_SAMPLES/N_LANES-1;
//	else bar=length-1;
	last_counter=foo;

	memcpy(comb, (const sample32_t*) a, MAX_SAMPLES*sizeof(sample32_t));

//	for (int i=0;i<length*2;i++) {
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
		iqtmp.last=set_last;

		iout.write(itmp);
		qout.write(qtmp);
		iqout.write(iqtmp);

		if (sample==bar) sample=0;
		else sample++;
	}

}



void dac_table_axilite(sample_t comb[MAX_SAMPLES/N_LANES][N_LANES][2], samplectr_t length, bool tlast, samplectr_t replay_length, bool &run,
		hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout) {
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE axis register port=qout
#pragma HLS INTERFACE axis register port=iqout
#pragma HLS ARRAY_PARTITION variable=comb dim=2 complete
#pragma HLS ARRAY_PARTITION variable=comb dim=3 complete
#pragma HLS INTERFACE s_axilite port=comb bundle=control //clock=control_clk
#pragma HLS INTERFACE s_axilite port=length bundle=control
#pragma HLS INTERFACE s_axilite port=tlast bundle=control
#pragma HLS INTERFACE s_axilite port=replay_length bundle=control
#pragma HLS INTERFACE s_axilite port=run bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

	samplectr_t sample, last_counter, foo, bar;

	sample=0;
	foo=replay_length-1;
	last_counter=foo;
	bar=length-1;

//	unsigned int iter=0;
//	for (int i=0;i<length*2;i++) {  //required for testbench
	runloop: while(run) {
#pragma HLS PIPELINE II=1

		bool set_last;
		sample_t ival[N_LANES], qval[N_LANES];
		adcstreamint_t itmp, qtmp;
		iqstreamint_t iqtmp;

		//cout<<"   Iter: "<<iter<<" Sample: "<<sample;
		if (last_counter==0) {
		//	cout<<" Set LAST:"<<tlast;
			set_last=tlast;
			last_counter=foo;
		} else{
			set_last=false;
		//	cout<<" Last count:"<<last_counter;
			last_counter--;
		}
		cout<<endl;


		load: for (int lane=0;lane<N_LANES;lane++) {
			ival[lane]=comb[sample][lane][0];
			qval[lane]=comb[sample][lane][1];
		}

		outtmp: for (int lane=0;lane<N_LANES;lane++) {
			itmp.data.range((lane+1)*16-1, lane*16)=ival[lane];
			qtmp.data.range((lane+1)*16-1, lane*16)=qval[lane];

			ap_uint<32> x;
			x.range(15,0)=ival[lane];
			x.range(31,16)=qval[lane];
			iqtmp.data.range((lane+1)*32-1, lane*32)=x;
		}
		itmp.last=set_last;
		qtmp.last=set_last;
		iqtmp.last=set_last;

		iout.write(itmp);
		qout.write(qtmp);
		iqout.write(iqtmp);

		if (sample==bar) {
			sample=0;
		} else {
			sample++;
		}
//		iter++;
	}
}

void dac_table_debug_while(sample_t comb[1024], unsigned int length, bool tlast, unsigned int replay_length, volatile bool &run,
					 hls::stream<adcstreamint_t> &iout) {
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE s_axilite port=comb bundle=control// latency=1
#pragma HLS ARRAY_PARTITION variable=comb factor=8 cyclic
#pragma HLS INTERFACE s_axilite port=length bundle=control
#pragma HLS INTERFACE s_axilite port=tlast bundle=control
#pragma HLS INTERFACE s_axilite port=replay_length bundle=control
#pragma HLS INTERFACE s_axilite port=run bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control


	unsigned int sample, last_counter;
	last_counter=replay_length;
	sample=0;
	for (int i=0;i<length*3;i++) {
//	runloop: while (run) {
#pragma HLS PIPELINE II=1

		bool set_last;
		sample_t ival[N_LANES];
		adcstreamint_t itmp;

		if (last_counter==0) {
			set_last=tlast;
			last_counter=replay_length;
		} else{
			last_counter--;
		}

		load: for (int lane=0;lane<N_LANES;lane++) {
			ival[lane]=comb[sample*N_LANES+lane];
		}

		outi: for (int i=0;i<N_LANES;i++) {
			itmp.data.range((i+1)*16-1, i*16)=ival[i];
		}
		itmp.last=set_last;
		iout.write(itmp);

		if (sample==length-1) {
			sample=0;
		} else {
			sample++;
		}
	}
}




void dac_table_debugaxim(volatile sample_t * a, unsigned int length, bool tlast, unsigned int replay_length,
					 hls::stream<adcstreamint_t> &iout, bool &started, unsigned char &axichange) {
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE m_axi port=a depth=1024 offset=slave max_read_burst_length=64 num_read_outstanding=0
#pragma HLS INTERFACE s_axilite port=length //bundle=control2
#pragma HLS INTERFACE s_axilite port=tlast //bundle=control2
#pragma HLS INTERFACE s_axilite port=replay_length //bundle=control2
#pragma HLS INTERFACE s_axilite port=return

	sample_t comb[1024];
#pragma HLS ARRAY_PARTITION variable=comb factor=8 cyclic

	for (int i=0;i<1024/32;i++)
		memcpy(comb+32*i, (const sample_t*) a+32*i, 32*sizeof(sample_t));

	unsigned int _length=length, _replay_length=replay_length;
	bool _tlast=tlast;
	axichange=0;
	started=true;
	unsigned int sample_last=0;

	for (unsigned int sample=0;sample<_length;sample++) {
#pragma HLS PIPELINE rewind ii=1
		axichange|=4;

		if (_length!=length) {
			axichange|=1;
		} else axichange&=0b11111110;
		if (_replay_length!=replay_length) {
			axichange|=2;
		} else axichange&=0b11111101;


		sample_t ival[N_LANES];
		load: for (int lane=0;lane<N_LANES;lane++) {
			ival[lane]=comb[sample*N_LANES+lane];
		}

		adcstreamint_t itmp;

		outi: for (int i=0;i<N_LANES;i++) {
			itmp.data.range((i+1)*16-1, i*16)=ival[i];
		}
		itmp.last=(sample+1)%_replay_length==0 && _tlast;
		iout.write(itmp);
	}
}
