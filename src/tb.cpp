#include "dac_replay.hpp"

#include <iostream>

using namespace std;





bool verify(int nfor_loops, sample8x_t combdata[MAX_IQ_SAMPLES/4],
		    hls::stream<adcstreamint_t> &iout, hls::stream<adcstreamint_t> &qout, hls::stream<iqstreamint_t> &iqout) {
	bool fail=false;

	if (iout.size()!=nfor_loops*MAX_IQ_SAMPLES/N_LANES) {
		fail=true;
		cout<<"iout wrong size:"<<iout.size()<<endl;
	}
	if (qout.size()!=nfor_loops*MAX_IQ_SAMPLES/N_LANES) {
		fail=true;
		cout<<"qout wrong size:"<<qout.size()<<endl;
	}
	if (iqout.size()!=nfor_loops*MAX_IQ_SAMPLES/N_LANES) {
		fail=true;
		cout<<"iqout wrong size:"<<iqout.size()<<endl;
	}


	unsigned int sample_group=0, sample=0;
	while (!iout.empty()) {
		adcstreamint_t ival, qval;
		iqstreamint_t iqval;

		//build expected output
		sample8x_t iexp, qexp;
		iq8x_t iqexp;
		bool lastexp;


		iout.read(ival);
		qout.read(qval);
		iqout.read(iqval);

//		cout<<"Checking "<<sample<<" sample_group "<<sample_group<<" elements "<<sample_group*2<<" - "<<sample_group*2+N_LANES*2/8-1<<" of "<<MAX_IQ_SAMPLES/4<<endl;
		for (int i=0; i<N_LANES*2/8;i++) { //need to pull this many sample groups
			sample8x_t x;

			x=combdata[sample_group*2+i]; // //n_lanes*2 beats*2(i & q) / 8 vals per read

			if (i%2) {
				qexp.range(8*16*(i/2+1)-1, 8*16*(i/2))=x;
			} else {
				iexp.range(8*16*(i/2+1)-1, 8*16*(i/2))=x;
			}

		}
		iqexp=i_and_q_to_iq(iexp,qexp);

		lastexp=(sample_group%256)==255;

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
			cout<<endl;
			cout<<"exp"<<endl<<" i: ";printu16_fromN(iexp);cout<<endl;
			cout<<" q: ";printu16_fromN(qexp);cout<<endl;

			cout<<"got"<<endl<<" i: ";printu16_fromN(ival.data);cout<<endl;
			cout<<" q: ";printu16_fromN(qval.data);cout<<endl;

			cout<<" exp sample: "<<sample_group<<" ilast: "<<lastexp<<endl;
			cout<<" got iquser: "<<iqval.user<<" ilast: "<<iqval.last<<endl;
		}

		if (sample_group*2+N_LANES*2/8 >= MAX_IQ_SAMPLES/4) sample_group=0;
		else sample_group++;
		sample++;
	}
	return fail;
}


int main(){
	auto combdata = new sample8x_t [MAX_IQ_SAMPLES/4];

	for (int i=0; i<MAX_IQ_SAMPLES/4; i++) { // 2=iq 4=4 iq in 128bits1
		combdata[i]=i; ///sets IorQ0-7=0 IorQ8-15=1 ...
	}
	cout<<"Last comb data value at "<<MAX_IQ_SAMPLES/4-1<<endl<<" ";
	printu16_fromN(combdata[MAX_IQ_SAMPLES/4-1]);cout<<endl;

	bool fail;
	hls::stream<adcstreamint_t> iout, qout;
	hls::stream<iqstreamint_t> iqout;

	cout<<"Running core.\n";
	dac_table_8x(combdata, true, iout, qout, iqout);
	fail=verify(2, combdata, iout, qout, iqout);

	if (fail) cout<<"FAIL\n";
	else cout<<"PASSED!\n";

	free(combdata);

	return fail;
}
