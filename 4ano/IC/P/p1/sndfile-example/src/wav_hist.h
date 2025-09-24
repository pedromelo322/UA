//------------------------------------------------------------------------------
//
// Copyright 2025 University of Aveiro, Portugal, All Rights Reserved.
//
// These programs are supplied free of charge for research purposes only,
// and may not be sold or incorporated into any commercial product. There is
// ABSOLUTELY NO WARRANTY of any sort, nor any undertaking that they are
// fit for ANY PURPOSE WHATSOEVER. Use them at your own risk. If you do
// happen to find a bug, or have modifications to suggest, please report
// the same to Armando J. Pinho, ap@ua.pt. The copyright notice above
// and this statement of conditions must remain an integral part of each
// and every copy made of these files.
//
// Armando J. Pinho (ap@ua.pt)
// IEETA / DETI / University of Aveiro
//
#ifndef WAVHIST_H
#define WAVHIST_H

#include <iostream>
#include <vector>
#include <map>
#include <fstream>
#include <cstdlib>
#include <sndfile.hh>

class WAVHist {
  private:
	std::vector<std::map<short, size_t>> counts;

  const int k = 3;
  int bin_size = 1<<k;

  public:
	WAVHist(const SndfileHandle& sfh) {
		counts.resize(sfh.channels() + 4);
	}

	void update(const std::vector<short>& samples) {
		size_t numChannels = counts.size() - 4;
		size_t n { };
		short prev_s = 0;
		for(auto s : samples){
			size_t atual = n++ % numChannels;
			counts[atual][s]++;
			counts[atual+4][s/bin_size]++;
			if (prev_s == 0){
				prev_s = s;
			}else{
				short sum = (prev_s + s)/2;
				short diff = (prev_s - s)/2;
            	counts[numChannels][sum]++; // Canal "mid" (soma)
				counts[numChannels + 1][diff]++; // Canal "side" (diferença)
				prev_s = 0;
			}
		}
    }
	

	void dump(const size_t channel) const {
		if (counts[channel].empty()) {
			std::cout << "No data for channel " << channel << std::endl;
			return;
		}
		
		// Write data to temporary file
		std::string dataFile = "histogram_ch" + std::to_string(channel) + ".dat";
		std::ofstream file(dataFile);
		
		for(auto [value, counter] : counts[channel]) {
			
			file << value << " " << counter << "\n";
		}
		file.close();
		
		// Create gnuplot script
		std::string scriptFile = "plot_ch" + std::to_string(channel) + ".gp";
		std::ofstream script(scriptFile);
		
		script << "set terminal png size 800,600\n";
		if(channel < 2){
			script << "set output 'histogram_channel_" << channel << ".png'\n";
			script << "set title 'Audio Histogram - Channel " << channel << "'\n";
		}else if(channel == 2){
			script << "set output 'histogram_mid" << ".png'\n";
			script << "set title 'Audio Histogram - MID " << "'\n";
		}else if(channel == 3){
			script << "set output 'histogram_side" << ".png'\n";
			script << "set title 'Audio Histogram - SIDE " << "'\n";
		}else{
			script << "set output 'histogram_channel_" << channel-4 << "_bin_" << k << ".png'\n";
			script << "set title 'Audio Histogram - Channel " << channel-4 << "_bin_" << k <<"'\n";
		}
		
		script << "set xlabel 'Sample Value'\n";
		script << "set ylabel 'Count'\n";
		script << "set grid\n";
		script << "set style fill solid 0.7\n";
		script << "plot '" << dataFile << "' using 1:2 with points title 'Frequency'\n";
		
		script.close();
		
		// Execute gnuplot
		std::string command = "gnuplot " + scriptFile;
		int result = std::system(command.c_str());
		
		if (result == 0) {
			std::cout << "Histogram saved as histogram_channel_" << channel << ".png\n";
			// Clean up temporary files
			std::remove(dataFile.c_str());
			std::remove(scriptFile.c_str());
		} else {
			std::cout << "Error: gnuplot not found. Data saved in " << dataFile << "\n";
		}
	}


	void dump_all(){


		for(size_t i = 0; i < 6; i++){
			dump(i);
		}

	}

};

#endif

