#include "dac_replay.hpp"

#include <iostream>

using namespace std;


bool verify(sample_t comb[MAX_SAMPLES/8][8][2], unsigned int  length, bool tlast,unsigned int tlast_length,
		hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout){
	bool fail=false;

	if (iout.size()!=length) {
		fail=true;
		cout<<"iout wrong size:"<<iout.size()<<endl;
	}
	if (qout.size()!=length) {
		fail=true;
		cout<<"qout wrong size:"<<qout.size()<<endl;
	}
	if (iqout.size()!=length) {
		fail=true;
		cout<<"iqout wrong size:"<<iqout.size()<<endl;
	}

	unsigned int sample=0;
	while (!iout.empty()) {
		adcstreamint_t ival,qval;
		iqstreamint_t iqval;
		iout.read(ival);
		qout.read(qval);
		iqout.read(iqval);

		//build expected output
		ap_uint<128> iexp, qexp;
		ap_uint<256> iqexp;
		bool lastexp;
		for (int i=0;i<N_LANES; i++) {
			iexp.range((i+1)*16-1,i*16)=comb[sample][i][0];
			qexp.range((i+1)*16-1,i*16)=comb[sample][i][1];
			ap_uint<32> x;
			x.range(15,0)=comb[sample][i][0];
			x.range(31,16)=comb[sample][i][1];
			iqexp.range((i+1)*32-1,i*32)=x;
		}
		lastexp=((sample+1)%tlast_length == 0) && tlast;

		//compare output
		bool print=false;
		if (iexp!=ival.data) {
			cout<<" ival mismatch";
			fail=true;
			print=true;
		}
		if (qexp!=qval.data) {
			cout<<" qval mismatch";
			fail=true;
			print=true;
		}
		if (iqexp!=iqval.data) {
			cout<<" iqval mismatch";
			fail=true;
			print=true;
		}
		if (ival.last!=lastexp) {
			cout<<" ival last mismatch "<<ival.last<<"=?"<<lastexp;
			fail=true;
			print=true;
		}else {
			cout<<" ival last MATCH "<<ival.last<<"="<<lastexp<<" "<<sample<<endl;
		}
		if (qval.last!=lastexp) {
			cout<<" qval last mismatch";
			fail=true;
			print=true;
		}
		if (iqval.last!=lastexp) {
			cout<<" iqval last mismatch";
			fail=true;
			print=true;
		}

		if (print) {
			cout<<" "<<sample;
			cout<<endl;
		}

		sample++;
	}
}

//
//int main(){
//	sample_t comb[MAX_SAMPLES/8][8][2];
//	sample_t* iq_flat;
//
//	iq_flat = (sample_t*) comb;
//
//	for (int i=0;i<2*MAX_SAMPLES; i++) *(iq_flat+i)=i;
//
//	unsigned int length, tlast_length;
//	bool tlast, fail;
//	hls::stream<adcstreamint_t> iout, qout;
//	hls::stream<iqstreamint_t> iqout;
//
//	//no tlast every
//	tlast=true;
//	tlast_length=25;
//	length=150;
//	dac_table_streams(comb, length, tlast, tlast_length, iout, qout, iqout);
//
//	if (iout.size()!=length) {
//		fail=true;
//		cout<<"iout wrong size:"<<iout.size()<<endl;
//	}
//	if (qout.size()!=length) {
//		fail=true;
//		cout<<"qout wrong size:"<<qout.size()<<endl;
//	}
//	if (iqout.size()!=length) {
//		fail=true;
//		cout<<"iqout wrong size:"<<iqout.size()<<endl;
//	}
//
//	unsigned int sample=0;
//	while (!iout.empty()) {
//		adcstreamint_t ival,qval;
//		iqstreamint_t iqval;
//		iout.read(ival);
//		qout.read(qval);
//		iqout.read(iqval);
//
//		//build expected output
//		ap_uint<128> iexp, qexp;
//		ap_uint<256> iqexp;
//		bool lastexp;
//		for (int i=0;i<N_LANES; i++) {
//			iexp.range((i+1)*16-1,i*16)=comb[sample][i][0];
//			qexp.range((i+1)*16-1,i*16)=comb[sample][i][1];
//			ap_uint<32> x;
//			x.range(15,0)=comb[sample][i][0];
//			x.range(31,16)=comb[sample][i][1];
//			iqexp.range((i+1)*32-1,i*32)=x;
//		}
//		lastexp=((sample+1)%tlast_length == 0) && tlast;
//
//		//compare output
//		bool print=false;
//		if (iexp!=ival.data) {
//			cout<<" ival mismatch";
//			fail=true;
//			print=true;
//		}
//		if (qexp!=qval.data) {
//			cout<<" qval mismatch";
//			fail=true;
//			print=true;
//		}
//		if (iqexp!=iqval.data) {
//			cout<<" iqval mismatch";
//			fail=true;
//			print=true;
//		}
//		if (ival.last!=lastexp) {
//			cout<<" ival last mismatch "<<ival.last<<"=?"<<lastexp;
//			fail=true;
//			print=true;
//		}else {
//			cout<<" ival last MATCH "<<ival.last<<"="<<lastexp<<" "<<sample<<endl;
//		}
//		if (qval.last!=lastexp) {
//			cout<<" qval last mismatch";
//			fail=true;
//			print=true;
//		}
//		if (iqval.last!=lastexp) {
//			cout<<" iqval last mismatch";
//			fail=true;
//			print=true;
//		}
//
//		if (print) {
//			cout<<" "<<sample;
//			cout<<endl;
//		}
//
//		sample++;
//	}
//
//	return fail;
//}



int main(){
	sample_t comb[MAX_SAMPLES/8][8][2];
	sample_t* iq_flat;

	iq_flat = (sample_t*) comb;

	for (int i=0;i<2*MAX_SAMPLES; i++) *(iq_flat+i)=i;

	unsigned int length, tlast_length;
	bool tlast, fail;
	hls::stream<adcstreamint_t> iout, qout;
	hls::stream<iqstreamint_t> iqout;

	//no tlast every
	tlast=true;
	tlast_length=25;
	length=150;
	dac_table_streams(comb, length, tlast, tlast_length, iout, qout, iqout);

	fail=verify(comb, length, tlast, tlast_length, iout, qout, iqout);


	return fail;
}
