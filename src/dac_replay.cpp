#include "dac_replay.hpp"
#include "ap_int.h"
#include "ap_fixed.h"

void dac_table_master(volatile sample_t* a, bool &config, unsigned int length, bool tlast,
			   	   	  unsigned int replay_length, adcstream_t &iout, adcstream_t &qout, iqstream_t &iqout) {
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE axis register port=qout
#pragma HLS INTERFACE axis register port=iqout

#pragma HLS INTERFACE m_axi port=a bundle=control depth=2*8*MAX_SAMPLES offset=slave num_read_outstanding=32 max_read_burst_length=BURST_LEN
#pragma HLS INTERFACE s_axilite port=length bundle=control
#pragma HLS INTERFACE s_axilite port=tlast bundle=control
#pragma HLS INTERFACE s_axilite port=replay_length bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control clock=control_clk
//#pragma HLS RESOURCE variable=comb core=RAM_T2P_URAM

	static unsigned int _length=0, _replay_length=0;
	static bool _tlast;
	sample_t comb[2][8][MAX_SAMPLES];
#pragma HLS ARRAY_PARTITION variable=comb dim=1 complete
#pragma HLS ARRAY_PARTITION variable=comb dim=2 complete

	if (config) {
		_length=length>MAX_SAMPLES ? MAX_SAMPLES: length;
		_tlast=tlast;
		_replay_length=replay_length;
		for (int lane=0;lane<8; lane++) {
			memcpy(&comb[0][lane], (const sample_t*) a+lane*MAX_SAMPLES, MAX_SAMPLES*sizeof(sample_t));
		}
		for (int lane=0;lane<8; lane++) {
			memcpy(&comb[1][lane], (const sample_t*) a+lane*MAX_SAMPLES+8*MAX_SAMPLES, MAX_SAMPLES*sizeof(sample_t));
		}
		config=false;

		for (unsigned int sample=0;sample<_length;sample++) {
#pragma HLS PIPELINE REWIND II=100
			sample_t ival[N_LANES], qval[N_LANES];
			load: for (int lane=0;lane<N_LANES;lane++) {
				ival[lane]=comb[0][lane][sample];
				qval[lane]=comb[1][lane][sample];
			}

			outi: for (int i=0;i<N_LANES;i++) {
#pragma HLS UNROLL
				iout.data[i]=ival[i];
			}
			iout.last=sample==_length-1 && _tlast;

			outq: for (int i=0;i<N_LANES;i++) {
#pragma HLS UNROLL
				qout.data[i]=qval[i];
			}
			qout.last=sample==_length-1 && _tlast;

			outiq: for (int i=0;i<2*N_LANES;i++) {
#pragma HLS UNROLL
				iqout.data[i]=i%2 ? qval[i/2]: ival[i/2];
			}
			iqout.last=sample==_length-1 && _tlast;
		}
	}
}

void dac_table(sample_t comb[MAX_SAMPLES/8][8][2], unsigned int length, bool tlast,
			   unsigned int tlast_length, adcstream_t &iout, adcstream_t &qout, iqstream_t &iqout) {
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE axis register port=qout
#pragma HLS INTERFACE axis register port=iqout
#pragma HLS ARRAY_PARTITION variable=comb dim=2 complete
#pragma HLS ARRAY_PARTITION variable=comb dim=3 complete
#pragma HLS INTERFACE s_axilite port=comb bundle=control clock=control_clk
#pragma HLS INTERFACE s_axilite port=length bundle=control
#pragma HLS INTERFACE s_axilite port=tlast bundle=control
#pragma HLS INTERFACE s_axilite port=tlast_length bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

	unsigned int tmp=length;
	if (length>MAX_SAMPLES)
		tmp=MAX_SAMPLES;
	if (tmp==0) tmp=1;
	for (unsigned int sample=0;sample<tmp;sample+=N_LANES) {
#pragma HLS PIPELINE rewind II=8
		sample_t ival[N_LANES], qval[N_LANES];
		load: for (int i=0;i<N_LANES;i++) {
			ival[i]=comb[sample][i][0];
			qval[i]=comb[sample][i][1];
		}

		outi: for (int i=0;i<N_LANES;i++) {
			iout.data[i]=ival[i];
		}
		iout.last=sample==tlast_length-1 && tlast;

		outq: for (int i=0;i<N_LANES;i++) {
			qout.data[i]=qval[i];
		}
		qout.last=sample==tlast_length-1 && tlast;

		outiq: for (int i=0;i<2*N_LANES;i++) {
			iqout.data[i]=i%2 ? qval[i/2]: ival[i/2];
		}
		iqout.last=sample==tlast_length-1 && tlast;
	}

}


void dac_table_masterstream(volatile sample_t* a, bool *run, unsigned int length, bool tlast, unsigned int replay_length,
		hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout) {
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE axis register port=qout
#pragma HLS INTERFACE axis register port=iqout

#pragma HLS INTERFACE m_axi port=a bundle=control depth=2*8*MAX_SAMPLES offset=slave num_read_outstanding=32 max_read_burst_length=BURST_LEN
#pragma HLS INTERFACE s_axilite port=length bundle=control
#pragma HLS INTERFACE s_axilite port=tlast bundle=control
#pragma HLS INTERFACE s_axilite port=replay_length bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control clock=control_clk
//#pragma HLS RESOURCE variable=comb core=RAM_T2P_URAM

	unsigned int _length=0, _replay_length=0, sample=0;
	static bool _tlast;
	sample_t comb[8][MAX_SAMPLES/8][2];
#pragma HLS ARRAY_PARTITION variable=comb dim=1 complete
#pragma HLS ARRAY_PARTITION variable=comb dim=3 complete

	_length=length>MAX_SAMPLES/8 ? MAX_SAMPLES/8: length;
	_tlast=tlast;
	_replay_length=replay_length;
	for (int lane=0;lane<8; lane++) {
		memcpy(&comb[lane], (const sample_t*) a+lane*MAX_SAMPLES/4, MAX_SAMPLES/4*sizeof(sample_t));
	}

	while (run) {
#pragma HLS PIPELINE rewind ii=4
		sample_t ival[N_LANES], qval[N_LANES];
		load: for (int lane=0;lane<N_LANES;lane++) {
			ival[lane]=comb[lane][sample][0];
			qval[lane]=comb[lane][sample][1];
		}

		adcstreamint_t itmp, qtmp;
		iqstreamint_t iqtmp;

		outi: for (int i=0;i<N_LANES;i++) {
			itmp.data.range((i+1)*16-1, i*16)=ival[i];
		}
		itmp.last=(sample+1)%_replay_length==0 && tlast;

		outq: for (int i=0;i<N_LANES;i++) {
			qtmp.data.range((i+1)*16-1, i*16)=qval[i];
		}
		qtmp.last=(sample+1)%_replay_length==0 && tlast;

		outiq: for (int i=0;i<N_LANES;i++) {
			ap_uint<32> x;
			x.range(15,0)=ival[i];
			x.range(31,16)=qval[i];
			iqtmp.data.range((i+1)*32-1, i*32)=x;
		}
		iqtmp.last=(sample+1)%_replay_length==0 && tlast;

		iout.write(itmp);
		qout.write(qtmp);
		iqout.write(iqtmp);

		sample = sample == _length-1 ? 0 : sample+1;
	}

}



void dac_table_streams(sample_t comb[MAX_SAMPLES/8][8][2], unsigned int length, bool tlast, unsigned int replay_length,
		hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout) {
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE axis register port=qout
#pragma HLS INTERFACE axis register port=iqout
#pragma HLS ARRAY_PARTITION variable=comb dim=2 complete
#pragma HLS ARRAY_PARTITION variable=comb dim=3 complete
#pragma HLS INTERFACE s_axilite port=comb bundle=control clock=control_clk
#pragma HLS INTERFACE s_axilite port=length bundle=control
#pragma HLS INTERFACE s_axilite port=tlast bundle=control
#pragma HLS INTERFACE s_axilite port=replay_length bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

	unsigned int _length=0, _replay_length=0, sample=0;
	bool _tlast;

	for (int sample=0;sample<MAX_SAMPLES/8;sample++) {
#pragma HLS PIPELINE rewind ii=1

//		if (sample==0) {
////			_length=length;
//			_tlast=tlast;
//			_replay_length=replay_length;
//		}

		sample_t ival[N_LANES], qval[N_LANES];
		load: for (int i=0;i<N_LANES;i++) {
			ival[i]=comb[sample][i][0];
			qval[i]=comb[sample][i][1];
		}

		adcstreamint_t itmp, qtmp;
		iqstreamint_t iqtmp;

		outi: for (int i=0;i<N_LANES;i++) {
			itmp.data.range((i+1)*16-1, i*16)=ival[i];
		}
		itmp.last=(sample+1)%replay_length==0 && tlast;

		outq: for (int i=0;i<N_LANES;i++) {
			qtmp.data.range((i+1)*16-1, i*16)=qval[i];
		}
		qtmp.last=(sample+1)%replay_length==0 && tlast;

		outiq: for (int i=0;i<N_LANES;i++) {
			ap_uint<32> x;
			x.range(15,0)=ival[i];
			x.range(31,16)=qval[i];
			iqtmp.data.range((i+1)*32-1, i*32)=x;
		}
		iqtmp.last=(sample+1)%replay_length==0 && tlast;

		iout.write(itmp);
		qout.write(qtmp);
		iqout.write(iqtmp);

	}
}



void dac_table_debug(sample_t comb[1024], unsigned int length, bool tlast, unsigned int replay_length,
					 hls::stream<adcstreamint_t> &iout, bool &started, unsigned char &axichange) {
#pragma HLS INTERFACE axis register port=iout
#pragma HLS INTERFACE s_axilite port=comb bundle=control// latency=1
#pragma HLS ARRAY_PARTITION variable=comb factor=8 cyclic
#pragma HLS INTERFACE s_axilite port=length bundle=control
#pragma HLS INTERFACE s_axilite port=tlast bundle=control
#pragma HLS INTERFACE s_axilite port=replay_length bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

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
