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
#include <sndfile.hh>
#include <fstream>

class WAVHist {
  private:
    std::vector<std::map<short, size_t>> counts;
    // Mapas para os histogramas dos canais MID e SIDE.
    std::map<short, size_t> midCounts; 
    std::map<short, size_t> sideCounts;
    int numChannels;
    bool isStereo;
    int binSize;  // Tamanho dos bins para histogramas mais grossos (deve ser uma potência de 2)

    // Função auxiliar para mapear amostra para bin
    short getBin(short sample) const {
        if(binSize == 1) return sample;
        // Para binSize = 2^k, deslocamos para a direita por k bits
        int k = 0;
        int temp = binSize;
        while(temp > 1) {
            temp >>= 1;
            k++;
        }
        return static_cast<short>((sample / binSize) * binSize);
    }

  public:
    WAVHist(const SndfileHandle& sfh, int binSize = 1) 
        : numChannels(sfh.channels()), isStereo(sfh.channels() == 2), binSize(binSize) {
        counts.resize(sfh.channels());
        
        // Validação do binSize
        if(binSize <= 0 || (binSize & (binSize - 1)) != 0) {
            std::cerr << "Warning: binSize must be a power of 2. Using binSize = 1.\n";
            this->binSize = 1;
        }
    }

    void update(const std::vector<short>& samples) {
        size_t n { };
        for(auto s : samples) {
            short bin = getBin(s);
            counts[n++ % counts.size()][bin] += binSize;  // Incrementa o contador do bin correspondente por binSize
        }
        
        // Atualiza histogramas MID e SIDE se for estéreo
        if(isStereo && samples.size() >= 2) {
            for(size_t i = 0; i < samples.size(); i += 2) {
                short left = samples[i];
                short right = samples[i + 1];

                // MID = (L + R) / 2 (divisão inteira)
                short mid = static_cast<short>((static_cast<int>(left) + static_cast<int>(right)) / 2);
                
                // SIDE = (L - R) / 2 (divisão inteira)
                short side = static_cast<short>((static_cast<int>(left) - static_cast<int>(right)) / 2);
                
                short midBin = getBin(mid);
                short sideBin = getBin(side);
                
                midCounts[midBin] += binSize;
                sideCounts[sideBin] += binSize;
            }
        }
    }

    void dump(const size_t channel) const {
        if(channel < counts.size()) {
            for(auto [value, counter] : counts[channel]) {
                if(binSize == 1) {
                    std::cout << value << '\t' << counter << '\n';
                } else {
                    std::cout << value << "-" << (value + binSize - 1) << '\t' << counter << '\n';
                }
            }
        }
    }
    
    // Dump dos histogramas MID
    void dumpMid() const {
        if(isStereo) {
            for(auto [value, counter] : midCounts) {
                if(binSize == 1) {
                    std::cout << value << '\t' << counter << '\n';
                } else {
                    std::cout << value << "-" << (value + binSize - 1) << '\t' << counter << '\n';
                }
            }
        } else {
            std::cerr << "Error: MID channel only available for stereo audio\n";
        }
    }


    // Dump dos histogramas SIDE
    void dumpSide() const {
        if(isStereo) {
            for(auto [value, counter] : sideCounts) {
                if(binSize == 1) {
                    std::cout << value << '\t' << counter << '\n';
                } else {
                    std::cout << value << "-" << (value + binSize - 1) << '\t' << counter << '\n';
                }
            }
        } else {
            std::cerr << "Error: SIDE channel only available for stereo audio\n";
        }
    }

    // Salva histograma de um canal específico para um ficheiro
    void saveToFile(const std::string& filename, size_t channel) const {
        std::ofstream file(filename);
        if(file.is_open() && channel < counts.size()) {
            for(auto [value, counter] : counts[channel]) {
                file << value << '\t' << counter << '\n';
            }
            file.close();
        }
    }

    void saveMidToFile(const std::string& filename) const {
        if(isStereo) {
            std::ofstream file(filename);
            if(file.is_open()) {
                for(auto [value, counter] : midCounts) {
                    file << value << '\t' << counter << '\n';
                }
                file.close();
            }
        }
    }

    void saveSideToFile(const std::string& filename) const {
        if(isStereo) {
            std::ofstream file(filename);
            if(file.is_open()) {
                for(auto [value, counter] : sideCounts) {
                    file << value << '\t' << counter << '\n';
                }
                file.close();
            }
        }
    }
    
    bool getStereoStatus() const {
        return isStereo;
    }
    
    int getChannelCount() const {
        return numChannels;
    }

    int getBinSize() const {
        return binSize;
    }
};

#endif