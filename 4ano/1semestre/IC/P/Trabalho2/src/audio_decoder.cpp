// Inclusão de bibliotecas para entrada/saída, manipulação de áudio e codificação Golomb
#include <iostream>
#include <vector>
#include <sndfile.h>
#include "Golomb.h"
#include <fstream>
#include <string> 
#include <stdexcept> 
#include "utils.h" 

using namespace std;

// Função principal que descodifica áudio comprimido para WAV
int main(int argc, char* argv[]) {
    // Verificação dos argumentos de linha de comando
    if (argc < 3) {
        cerr << "Uso: " << argv[0] << " <input.bin> <output.wav>\n";
        return 1;
    }

    const char* inputFile = argv[1];
    const char* outputFile = argv[2];

    // Abertura do ficheiro de entrada comprimido
    ifstream in(inputFile, ios::binary);
    if (!in.is_open()) {
        cerr << "Erro ao abrir ficheiro: " << inputFile << endl;
        return 1;
    }

    int sampleRate, numChannels;
    sf_count_t numFrames;

    // Leitura do cabeçalho com metadados do áudio
    in.read((char*)&sampleRate, sizeof(int));
    in.read((char*)&numChannels, sizeof(int));
    in.read((char*)&numFrames, sizeof(sf_count_t));
    
    cout << "Descodificação (Canais=" << numChannels << ", m adaptativo por bloco)\n";

    // Leitura do bitstream do ficheiro
    vector<char> fileBytes((istreambuf_iterator<char>(in)), {});
    in.close();

    string bitstream;
    bitstream.reserve(fileBytes.size() * 8);
    for (unsigned char b : fileBytes) {
        for (int i = 7; i >= 0; --i)
            bitstream += ((b >> i) & 1) ? '1' : '0';
    }
    
    vector<int16_t> samples(numFrames * numChannels);
    size_t index = 0; 
    const int blockSize = 4096;

    int32_t mono_pred = 0;
    int32_t mid_pred = 0;
    int32_t side_pred = 0;

    // Ciclo de descodificação por blocos, lendo 'm' adaptativo e reconstruindo amostras
    try {
        for (sf_count_t frame_start = 0; frame_start < numFrames; frame_start += blockSize) {
            sf_count_t frame_end = min(frame_start + blockSize, numFrames);
            sf_count_t framesInBlock = frame_end - frame_start;
            
            // Leitura dos valores 'm' para os canais no início do bloco
            int m1 = static_cast<int>(binary_string_to_int(bitstream, index, 16));
            if (m1 <= 0) m1 = 1;
            int m2 = 0;
            if (numChannels == 2) {
                m2 = static_cast<int>(binary_string_to_int(bitstream, index, 16));
                if (m2 <= 0) m2 = 1;
            }

            Golomb g1(m1, SignHandling::INTERLEAVING);
            Golomb g2(m2 > 0 ? m2 : 1, SignHandling::INTERLEAVING);

            // Processamento das amostras no bloco: predição, descodificação e reconstrução
            for (sf_count_t i = 0; i < framesInBlock; i++) {
                sf_count_t frame_index = frame_start + i; 

                if (numChannels == 1) {
                    int32_t prediction = mono_pred;
                    int32_t residual = g1.decode(bitstream, index);
                    int32_t reconstructed = prediction + residual;
                    
                    int32_t clamped_sample = reconstructed;
                    if (clamped_sample > 32767) clamped_sample = 32767;
                    else if (clamped_sample < -32768) clamped_sample = -32768;

                    samples[frame_index] = static_cast<int16_t>(clamped_sample);
                    mono_pred = reconstructed; 
                
                } else { 
                    int32_t pred_mid = mid_pred;
                    int32_t pred_side = side_pred;

                    int32_t res_mid = g1.decode(bitstream, index);
                    int32_t res_side = g2.decode(bitstream, index);

                    int32_t mid = pred_mid + res_mid;
                    int32_t side = pred_side + res_side;

                    int32_t r_recon = mid - (side >> 1);
                    int32_t l_recon = r_recon + side;

                    int32_t clamped_l = l_recon;
                    int32_t clamped_r = r_recon;
                    if (clamped_l > 32767) clamped_l = 32767;
                    else if (clamped_l < -32768) clamped_l = -32768;

                    if (clamped_r > 32767) clamped_r = 32767;
                    else if (clamped_r < -32768) clamped_r = -32768;

                    samples[frame_index * 2] = static_cast<int16_t>(clamped_l);
                    samples[frame_index * 2 + 1] = static_cast<int16_t>(clamped_r);

                    mid_pred = mid;
                    side_pred = side;
                }
            }
        }
    } catch (const std::runtime_error& e) {
        cerr << "Erro fatal durante a descodificação: " << e.what() << endl;
        return 1;
    }

    // Escrita do áudio descodificado em formato WAV
    SF_INFO sfInfoOut;
    sfInfoOut.samplerate = sampleRate;
    sfInfoOut.channels = numChannels;
    sfInfoOut.format = SF_FORMAT_WAV | SF_FORMAT_PCM_16;

    SNDFILE* outFile = sf_open(outputFile, SFM_WRITE, &sfInfoOut);
    if (!outFile) {
        cerr << "Erro ao criar ficheiro WAV: " << outputFile << endl;
        return 1;
    }

    sf_write_short(outFile, samples.data(), samples.size());
    sf_close(outFile);

    cout << "Descodificação concluída: " << outputFile << endl;
    return 0;
}