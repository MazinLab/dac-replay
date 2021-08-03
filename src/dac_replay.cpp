#include "dac_replay.hpp"

#include <iostream>
using namespace std;

void dac_table_axim(ap_uint<128> *a, samplectr_t length, bool tlast, samplectr_t replay_length, bool &run,
		hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout) {
#pragma HLS STABLE variable=tlast
#pragma HLS STABLE variable=a
#pragma HLS STABLE variable=length
#pragma HLS STABLE variable=replay_length
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE axis register port=qout
#pragma HLS INTERFACE axis register port=iqout
#pragma HLS INTERFACE m_axi port=a depth=MAX_SAMPLES/4 offset=slave max_write_burst_length=1 num_write_outstanding=1 num_read_outstanding=1 max_read_burst_length=1
#pragma HLS INTERFACE s_axilite port=a bundle=control
#pragma HLS INTERFACE s_axilite port=length bundle=control
#pragma HLS INTERFACE s_axilite port=tlast bundle=control
#pragma HLS INTERFACE s_axilite port=replay_length bundle=control
#pragma HLS INTERFACE s_axilite port=run bundle=control
//NB that RTL cosim will fail if the return and axim ports are bundled with the other args
#pragma HLS INTERFACE s_axilite port=return bundle=control


	//Need 512bits each clock,  MAX_SAMPLES/16 deep (so 16 or 32k deep
	//each URAM is 72bx4096 back of 7.1 needed for one clock
	//4 or 8 banks needed for depth so 32 or 64 chip has 80, but this wastes 11%
	//doing a 2 cycle read of 1k needs 14.22 so 15 in a bank with 2 or 4 banks 30 or 60 wastes 5.2%

	samplectr_t sample, last_counter, foo, bar;
	ap_uint<1024> comb2wide[MAX_SAMPLES/N_LANES/2];
#pragma HLS BIND_STORAGE variable=comb2wide type=ram_2p impl=uram// latency=3

	sample=0;
	foo=replay_length-1;
	bar=length-1;
	last_counter=foo;

	for (int i=0; i<MAX_SAMPLES/4/8; i++) {
#pragma HLS PIPELINE ii=20
		ap_uint<1024> x;
		ap_uint<128> x128[8];
		for (int j=0; j<8;j++) {
			x128[j]=*(a+i*8+j);//]*(a+i*8+j);
			cout<<"loaded: ";
			for (int k=0;k<8;k++) cout<<x128[j].range((k+1)*16-1,k*16).to_uint()<<", ";
			cout<<endl;
		}
		for (int j=0; j<8;j++) x.range((128+1)*j-1, 128*j)=x128[j];
		comb2wide[i]=x;
	}

	ap_uint<1024> x;
	runloop: for (int i=0;i<length*2;i++) {
//	runloop: while(run) {
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

		if (!sample[0]) {
			x=comb2wide[sample/2];
			for (int lane=0;lane<N_LANES;lane++) {
				ap_uint<32> tmp=x.range((lane+1)*32-1, lane*32);
				iqval[lane]=tmp;
			}
		} else {
			for (int lane=0;lane<N_LANES;lane++) {
				ap_uint<32> tmp=x.range((lane+1)*32-1+512, lane*32+512);
				iqval[lane]=tmp;
			}
		}


//		load: for (int lane=0;lane<N_LANES;lane++) {
//			iqval[lane]=comb[sample][lane];
//		}

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
