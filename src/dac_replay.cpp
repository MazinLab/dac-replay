#include "dac_replay.hpp"

#include <assert.h>

const int _N_LANES=N_LANES;
void dac_table_8x(volatile sample16x_t table[MAX_IQ_SAMPLES/8],// volatile bool &run,
					hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout) {
#pragma HLS INTERFACE mode=ap_memory depth=MAX_IQ_SAMPLES/8 latency=12 port=table
//Data in a must be of form I0...I(N_LANE-1) Q0...Q(N_LANE-1)  I(N_LANE) ...I(2*N_LANE-1)  Q(N_LANE) ...
#pragma HLS INTERFACE axis register port=iout depth=MAX_IQ_SAMPLES/_N_LANES*2
#pragma HLS INTERFACE axis register port=qout depth=MAX_IQ_SAMPLES/_N_LANES*2
#pragma HLS INTERFACE axis register port=iqout depth=MAX_IQ_SAMPLES/_N_LANES*2
//#pragma HLS INTERFACE s_axilite port=run bundle=control
//NB that RTL cosim will fail if the return and axim ports are bundled with the other args
//#pragma HLS INTERFACE s_axilite port=return bundle=control
#pragma HLS INTERFACE ap_ctrl_none port=return


	//Need 256b each clock,  MAX_IQ_SAMPLES/16 deep (so 16 or 32k deep)
	//each URAM is 72bx4096 back of 7.1 needed for one clock
	//4 or 8 banks needed for depth so 32 or 64 chip has 80, but this wastes 11%
	//doing a 2 cycle read of 1k needs 14.22 so 15 in a bank with 2 or 4 banks 30 or 60 wastes 5.2%

//	samplectr_t sample_group;


	//Replay the data
	runloop: for (int sample_group=0;sample_group<MAX_IQ_SAMPLES/N_LANES;sample_group++) {  //for simulating, loop through twice
	#pragma HLS PIPELINE II=1 rewind
		adcstreamint_t itmp, qtmp;
		iqstreamint_t iqtmp;
		sample8x_t itmpdat, qtmpdat;
		iq8x_t iqtmpdat;
		sample16x_t iq_forclock;
		bool set_tlast;

		samplectr_t grp;
		grp=sample_group;
		set_tlast=grp.range(7,0)==255;

		iq_forclock=table[sample_group];
		itmpdat=iq_forclock.range(N_LANES*16-1,0);
		qtmpdat=iq_forclock.range(2*N_LANES*16-1, N_LANES*16);
		iqtmpdat=i_and_q_to_iq(itmpdat,qtmpdat);

//#ifndef __SYNTHESIS__
//		if (sample_group%256 == 0){
//		cout<<"Fetched sampgroup="<<sample_group<<" for replay on i="<<i<<" and next"<<endl<<" I:";
//		printu16_fromN(itmpdat);
//		cout<<endl<<" Q: ";
//		printu16_fromN(qtmpdat);
//		cout<<endl;}
//#endif

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
		//sample_group++;
	}

}
