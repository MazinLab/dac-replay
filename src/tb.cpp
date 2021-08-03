#include "dac_replay.hpp"

#include <iostream>

using namespace std;

ap_uint<512> i256q256_to_iq512_tb(ap_uint<256> i, ap_uint<256> q){
	ap_uint<512> iq;
	for (int lane=0;lane<16;lane++) {
		ap_uint<32> tmp;
		tmp.range(15,0)=i.range(16*(lane+1)-1, 16*lane);
		tmp.range(31,16)=q.range(16*(lane+1)-1, 16*lane);
		iq.range(32*(lane+1)-1, lane*32)=tmp;
	}
	return iq;
}

void print16_from256(ap_uint<256> x) {
	for (int i=0;i<16;i++) cout<<x.range((i+1)*16-1,i*16).to_uint()<<", ";
}


bool verify(int nfor_loops, ap_uint<128> combdata[MAX_SAMPLES/4], unsigned int  length, bool tlast, unsigned int tlast_length,
		    hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout) {
	bool fail=false;

	if (iout.size()!=nfor_loops*length) {
		fail=true;
		cout<<"iout wrong size:"<<iout.size()<<endl;
	}
	if (qout.size()!=nfor_loops*length) {
		fail=true;
		cout<<"qout wrong size:"<<qout.size()<<endl;
	}
	if (iqout.size()!=nfor_loops*length) {
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


		if (sample==length)
			sample=0;
		//build expected output
		ap_uint<16*N_LANES> iexp, qexp;
		ap_uint<32*N_LANES> iqexp;
		bool lastexp;


		ap_uint<128> x[4];
		for (int i=0;i<4; i++) x[i]=combdata[sample*4+i];
		iexp.range(127,0)=x[0];
		iexp.range(255,128)=x[1];
		qexp.range(127,0)=x[2];
		qexp.range(255,128)=x[3];
		iqexp=i256q256_to_iq512_tb(iexp,qexp);

//		cout<<" exp i: ";print16_from256(iexp);cout<<endl;
//		cout<<" got i: ";print16_from256(ival.data);cout<<endl;
//		cout<<" exp q: ";print16_from256(qexp);cout<<endl;
//		cout<<" got q: ";print16_from256(qval.data);cout<<endl;
//		cout<<" exp sample: "<<sample<<" ilast: "<<(((sample+1)%tlast_length)== 0)<<endl;
//		cout<<" got iquser: "<<iqval.user<<" ilast: "<<ival.last<<endl;

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
			//cout<<" ival last MATCH "<<ival.last<<"="<<lastexp<<" "<<sample<<endl;
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
	} return fail;
}

//sample_t comb[MAX_SAMPLES/N_LANES][N_LANES][2];
ap_uint<128> combdata[MAX_SAMPLES/4];


int main(){

	volatile ap_uint<128>* a;
	sample_t* iq_flat;

	for (int i=0; i<MAX_SAMPLES/4; i++) { // 2=iq 4=4 iq in 128bits1
		combdata[i]=i;
	}

	samplectr_t length, tlast_length;
	bool tlast, fail, run;
	hls::stream<adcstreamint_t> iout, qout;
	hls::stream<iqstreamint_t> iqout;

	//no tlast every
	tlast=true;
	tlast_length=8;
	length=64;
	run=true;

	cout<<"Running core.\n";
	dac_table_axim(combdata, length-1, tlast, tlast_length-1, run, iout, qout, iqout);
	fail=verify(2, combdata, length, tlast, tlast_length, iout, qout, iqout);

	if (fail) cout<<"FAIL\n";
	else cout<<"PASSED!\n";

	return fail;
}
