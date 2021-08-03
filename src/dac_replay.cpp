#include "dac_replay.hpp"

#include <iostream>
using namespace std;

ap_uint<512> i256q256_to_iq512(ap_uint<256> i, ap_uint<256> q){
	ap_uint<512> iq;
	for (int lane=0;lane<16;lane++) {
		ap_uint<32> tmp;
		tmp.range(15,0)=i.range(16*(lane+1)-1, 16*lane);
		tmp.range(31,16)=q.range(16*(lane+1)-1, 16*lane);
		iq.range(32*(lane+1)-1, lane*32)=tmp;
	}
	return iq;
}

void dac_table_axim(ap_uint<128> *a, samplectr_t length, bool tlast, samplectr_t replay_length, bool &run,
		hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout) {
#pragma HLS STABLE variable=tlast
#pragma HLS STABLE variable=a
#pragma HLS STABLE variable=length
#pragma HLS STABLE variable=replay_length
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE axis register port=qout
#pragma HLS INTERFACE axis register port=iqout
#pragma HLS INTERFACE m_axi port=a depth=MAX_SAMPLES/4 offset=slave max_write_burst_length=1 num_write_outstanding=1 num_read_outstanding=1 max_read_burst_length=8
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

	ap_uint<1024> iq_for2clocks;
	samplectr_t sample, last_counter;
	ap_uint<1024> comb2wide[MAX_SAMPLES/N_LANES/2];
#pragma HLS BIND_STORAGE variable=comb2wide type=ram_2p impl=uram// latency=3

	sample=0;
	last_counter=replay_length;

	//Load the data over AXI
	copy: for (int i=0; i<MAX_SAMPLES/4/8; i++) {
#pragma HLS PIPELINE ii=20
		ap_uint<1024> x;
		ap_uint<128> x128[8];
		for (int j=0; j<8;j++) x128[j]=*(a+i*8+j);
		for (int j=0; j<8;j++) x.range(128*(j+1)-1, 128*j)=x128[j];
		comb2wide[i]=x;
	}

	//Replay the data
//	run: for (int i=0;i<(length+1)*2;i++) {  //for simulating
	runloop: while(run) {
#pragma HLS PIPELINE II=1
		bool set_last;
		adcstreamint_t itmp, qtmp;
		iqstreamint_t iqtmp;
		ap_uint<256> itmpdat, qtmpdat;
		ap_uint<512> iqtmpdat;

		if (last_counter==0) {
			set_last=tlast;
			last_counter=replay_length;
		} else{
			set_last=false;
			last_counter--;
		}

		if (!sample[0]) {
			iq_for2clocks=comb2wide[sample/2];

			itmpdat=iq_for2clocks.range(255,0);
			qtmpdat=iq_for2clocks.range(511,256);
			iqtmpdat=i256q256_to_iq512(itmpdat,qtmpdat);
		} else {
			itmpdat=iq_for2clocks.range(767,512);
			qtmpdat=iq_for2clocks.range(1023,768);
			iqtmpdat=i256q256_to_iq512(itmpdat,qtmpdat);
		}

		// Write out the streams
		itmp.data=itmpdat;
		itmp.last=set_last;
		iout.write(itmp);

		qtmp.data=qtmpdat;
		qtmp.last=set_last;
		qout.write(qtmp);

		iqtmp.data=iqtmpdat;
		iqtmp.user=sample;
		iqtmp.last=set_last;
		iqout.write(iqtmp);

		//Next sample
		sample = sample==length ? samplectr_t(0): samplectr_t(sample+1);
	}

}
