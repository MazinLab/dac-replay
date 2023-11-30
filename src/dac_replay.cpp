#include "dac_replay.hpp"

#include <iostream>
using namespace std;

iq8x_t i_and_q_to_iq(sample8x_t i, sample8x_t q){
	iq8x_t iq;
	for (int lane=0;lane<8;lane++) {
		iq_t tmp;
		tmp.range(15,0)=i.range(16*(lane+1)-1, 16*lane);
		tmp.range(31,16)=q.range(16*(lane+1)-1, 16*lane);
		iq.range(32*(lane+1)-1, lane*32)=tmp;
	}
	return iq;
}

iq16x_t i_and_q_to_iq(sample16x_t i, sample16x_t q){
	iq16x_t iq;
	for (int lane=0;lane<16;lane++) {
		iq_t tmp;
		tmp.range(15,0)=i.range(16*(lane+1)-1, 16*lane);
		tmp.range(31,16)=q.range(16*(lane+1)-1, 16*lane);
		iq.range(32*(lane+1)-1, lane*32)=tmp;
	}
	return iq;
}

const int _N_LANES=N_LANES;
void dac_table_axim(sample8x_t *a, bool run,
					hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout) {
//Data in a must be of form I0...I(N_LANE-1) Q0...Q(N_LANE-1)  I(N_LANE) ...I(2*N_LANE-1)  Q(N_LANE) ...
#pragma HLS STABLE variable=a
#pragma HLS INTERFACE axis register port=iout depth=MAX_IQ_SAMPLES/_N_LANES*2
#pragma HLS INTERFACE axis register port=qout depth=MAX_IQ_SAMPLES/_N_LANES*2
#pragma HLS INTERFACE axis register port=iqout depth=MAX_IQ_SAMPLES/_N_LANES*2
#pragma HLS INTERFACE m_axi port=a depth=MAX_IQ_SAMPLES/4 offset=slave max_write_burst_length=1 num_write_outstanding=1 num_read_outstanding=1 max_read_burst_length=8
#pragma HLS INTERFACE s_axilite port=a bundle=control
#pragma HLS INTERFACE s_axilite port=run bundle=control
//NB that RTL cosim will fail if the return and axim ports are bundled with the other args
#pragma HLS INTERFACE s_axilite port=return bundle=control


	//Need 256b each clock,  MAX_IQ_SAMPLES/16 deep (so 16 or 32k deep)
	//each URAM is 72bx4096 back of 7.1 needed for one clock
	//4 or 8 banks needed for depth so 32 or 64 chip has 80, but this wastes 11%
	//doing a 2 cycle read of 1k needs 14.22 so 15 in a bank with 2 or 4 banks 30 or 60 wastes 5.2%

	bool _run, _runcache;
	_run=true;
	_runcache=true;

	iq16x_t iq_for2clocks;
	samplectr_t sample_group;
	iq16x_t comb2wide[MAX_IQ_SAMPLES/N_LANES/2]; //each is two beats worth of n N_LANES IQ samples stored N_LANES*I N_LANES*q N_LANES*I N_LANES*q
#pragma HLS BIND_STORAGE variable=comb2wide type=ram_2p impl=uram

	sample_group=0;

	//Load the data over AXI
	copy: for (int i=0; i<MAX_IQ_SAMPLES/N_LANES/2; i++) { //need to load MAX_IQ_SAMPLES, each time through gets 2*N_LANES IQs
	#pragma HLS PIPELINE ii=6
		iq16x_t iq_bundle; // N_LANES*I N_LANES*q N_LANES*I N_LANES*q
		// a[i] 4*(I or Q)
		sample8x_t iorq_dat[N_LANES*2*2/8];
		for (int j=0; j<N_LANES*2*2/8;j++) //n_lanes*2 beats*2(i & q) / 8 vals per read
			iorq_dat[j]=*(a+i*N_LANES/4*2+j); // bursted read of groups of 8 i or q samples

		for (int j=0; j<N_LANES*2*2/8;j++)
			iq_bundle.range(8*16*(j+1)-1, 8*16*j)=iorq_dat[j]; //bundle for storage into uram

//#ifndef __SYNTHESIS__
//		cout<<"Loaded i="<<i<<endl<<" ";
//		printu16_fromN(iq_bundle);
//		cout<<endl;
//		if (i==MAX_IQ_SAMPLES/N_LANES/2-1) cout<<"Loaded last element from "<<(MAX_IQ_SAMPLES/N_LANES/2-1)*N_LANES/4*2+N_LANES*2*2/8-1<<endl;
//#endif
		comb2wide[i]=iq_bundle;
	}

	//Replay the data
//	run: for (int i=0;i<MAX_IQ_SAMPLES/N_LANES * 2;i++) {  //for simulating, loop through twice
	runloop: while(_run) {
	#pragma HLS PIPELINE II=1
		adcstreamint_t itmp, qtmp;
		iqstreamint_t iqtmp;
		sample8x_t itmpdat, qtmpdat;
		iq8x_t iqtmpdat;
		bool set_tlast;

		set_tlast=sample_group.range(7,0)==255;

		if (!sample_group[0]) {
			iq_for2clocks=comb2wide[sample_group/2];
			itmpdat=iq_for2clocks.range(N_LANES*16-1,0);
			qtmpdat=iq_for2clocks.range(2*N_LANES*16-1, N_LANES*16);
			iqtmpdat=i_and_q_to_iq(itmpdat,qtmpdat);

//#ifndef __SYNTHESIS__
//		if (sample_group%256 == 0){
//		cout<<"Fetched sampgroup="<<sample_group<<" for replay on i="<<i<<" and next"<<endl<<" I:";
//		printu16_fromN(itmpdat);
//		cout<<endl<<" Q: ";
//		printu16_fromN(qtmpdat);
//		cout<<endl;}
//#endif
			_runcache=run;
		} else {
			itmpdat=iq_for2clocks.range(3*N_LANES*16-1,2*N_LANES*16);
			qtmpdat=iq_for2clocks.range(4*N_LANES*16-1,3*N_LANES*16);
			iqtmpdat=i_and_q_to_iq(itmpdat,qtmpdat);
			_run=_runcache;
//#ifndef __SYNTHESIS__
//			if (sample_group%256 == 1){
//		cout<<"Cached  sampgroup="<<sample_group<<" for replay on i="<<i<<" and next"<<endl<<" I:";
//		printu16_fromN(itmpdat);
//		cout<<endl<<" Q: ";
//		printu16_fromN(qtmpdat);
//		cout<<endl;}
//#endif
		}

		// Write out the streams
		itmp.data=itmpdat;
		itmp.last=set_tlast;
		iout.write(itmp);

		qtmp.data=qtmpdat;
		qtmp.last=set_tlast;
		qout.write(qtmp);

		iqtmp.data=iqtmpdat;
		iqtmp.user=sample_group; //only care about the low bits
		iqtmp.last=set_tlast;
		iqout.write(iqtmp);

		//Next sample
		sample_group++;
	}

}
