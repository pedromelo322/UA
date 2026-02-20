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
#include <iostream>
#include <vector>
#include <sndfile.hh>
#include "wav_hist.h"

using namespace std;

constexpr size_t FRAMES_BUFFER_SIZE = 65536; // Buffer for reading frames

int main(int argc, char *argv[]) {

    if(argc < 2) {
        cerr << "Usage: " << argv[0] << " <input file> [channel] [k] [--save]\n";
        cerr << "  channel: channel number (0, 1, ...). If not specified, dumps all channels\n";
        cerr << "  k: exponent for bin size (bin_size = 2^k). Default: k=0 (bin_size=1)\n";
        cerr << "  --save: save histograms to files for external visualization\n";
        return 1;
    }

    SndfileHandle sndFile { argv[1] };
    if(sndFile.error()) {
        cerr << "Error: invalid input file\n";
        return 1;
    }

    if((sndFile.format() & SF_FORMAT_TYPEMASK) != SF_FORMAT_WAV) {
        cerr << "Error: file is not in WAV format\n";
        return 1;
    }

    if((sndFile.format() & SF_FORMAT_SUBMASK) != SF_FORMAT_PCM_16) {
        cerr << "Error: file is not in PCM_16 format\n";
        return 1;
    }

    int channel = -1; // -1 significa todos os canais
    int k = 0; // Exponente para o tamanho do bin (bin_size = 2^k, padrão = 0)
    bool saveToFiles = false;
    
    // Parse arguments
    for(int i = 2; i < argc; i++) {
        if(string(argv[i]) == "--save") {
            saveToFiles = true;
        } else {
            try {
                int value = stoi(argv[i]);
                // verifica se é um canal válido
                if(value >= 0 && value < sndFile.channels()) {
                    channel = value;
                } else {
                    // Assume que é o valor de k
                    k = value;
                }
            } catch(...) {
                cerr << "Error: invalid argument '" << argv[i] << "'\n";
                return 1;
            }
        }
    }

    // Validação de k
    if(k < 0 || k > 15) { // Limites razoáveis para k
        cerr << "Error: k must be between 0 and 15 (bin_size = 2^k)\n";
        return 1;
    }

    int binSize = 1 << k; // Calcula 2^k

    size_t nFrames;
    vector<short> samples(FRAMES_BUFFER_SIZE * sndFile.channels());
    WAVHist hist { sndFile, binSize };
    
    while((nFrames = sndFile.readf(samples.data(), FRAMES_BUFFER_SIZE))) {
        samples.resize(nFrames * sndFile.channels());
        hist.update(samples);
    }

    cout << "k: " << k << " (bin size: " << hist.getBinSize() << ")\n\n";

    // Dump dos histogramas dos canais especificados ou todos
    if(channel == -1) {
        // Dump de todos os canais
        for(int i = 0; i < hist.getChannelCount(); i++) {
            cout << "Channel " << i << " histogram:\n";
            hist.dump(i);
            cout << "\n";
        }
    } else {
        // Dump canal específico
        cout << "Channel " << channel << " histogram:\n";
        hist.dump(channel);
    }
    
    // Se for stereo, dump MID and SIDE histograms
    if(hist.getStereoStatus()) {
        cout << "\nMID channel histogram:\n";
        hist.dumpMid();
        
        cout << "\nSIDE channel histogram:\n";
        hist.dumpSide();
    }

    // Guarda histogramas em ficheiros se solicitado
    if(saveToFiles) {
        string baseName = string(argv[1]);
        size_t lastDot = baseName.find_last_of(".");
        if(lastDot != string::npos) {
            baseName = baseName.substr(0, lastDot);
        }
        
        string suffix = "_bin" + to_string(binSize);
        
        if(channel == -1) {
            // Guarda todos os canais
            for(int i = 0; i < hist.getChannelCount(); i++) {
                hist.saveToFile(baseName + suffix + "_ch" + to_string(i) + ".txt", i);
                cout << "\nChannel " << i << " histogram saved to: " << baseName + suffix + "_ch" + to_string(i) + ".txt\n";
            }
        } else {
            // Guarda canal específico
            hist.saveToFile(baseName + suffix + "_ch" + to_string(channel) + ".txt", channel);
            cout << "\nChannel " << channel << " histogram saved to: " << baseName + suffix + "_ch" + to_string(channel) + ".txt\n";
        }
        
        if(hist.getStereoStatus()) {
            hist.saveMidToFile(baseName + suffix + "_mid.txt");
            hist.saveSideToFile(baseName + suffix + "_side.txt");
            cout << "MID histogram saved to: " << baseName + suffix + "_mid.txt\n";
            cout << "SIDE histogram saved to: " << baseName + suffix + "_side.txt\n";
        }
    }

    return 0;
}