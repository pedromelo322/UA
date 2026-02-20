#include <iostream>
#include <vector>
#include <cmath>
#include <string>
#include <sndfile.hh>
#include <fftw3.h>
#include "bit_stream.h"

using namespace std;

// Desquantiza o coeficiente de volta para o tipo double.
double dequantize_coeff(int32_t quantized_coeff) {
    return static_cast<double>(quantized_coeff);
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        cerr << "Usage: mono_dct_dec <input.bin> <output.wav>\n";
        return 1;
    }

    const char* inFile = argv[1];
    const char* outFile = argv[2];

    fstream in_fs { inFile, ios::in | ios::binary };
    if (!in_fs) { cerr << "Error: could not open input file " << inFile << endl; return 1; }
    BitStream bs_in(in_fs, STREAM_READ);

    // Leitura do Cabeçalho
    int samplerate = bs_in.read_n_bits(32);
    uint64_t totalFrames = bs_in.read_n_bits(64);
    int blockSize = bs_in.read_n_bits(16);
    int coeffs_to_read = bs_in.read_n_bits(16);

    SndfileHandle sfhOut { outFile, SFM_WRITE, SF_FORMAT_WAV | SF_FORMAT_PCM_16, 1, samplerate };
    if (sfhOut.error()) { cerr << "Error: invalid output file\n"; return 1; }

    size_t numBlocks = (totalFrames + blockSize - 1) / blockSize;
    vector<short> samples(numBlocks * blockSize);
    vector<double> dct_coeffs(blockSize);
    vector<double> block(blockSize);

    // Cria um plano FFTW para a DCT Inversa.
    fftw_plan plan = fftw_plan_r2r_1d(blockSize, dct_coeffs.data(), block.data(), FFTW_REDFT01, FFTW_ESTIMATE);
    
    for (size_t i = 0; i < numBlocks; ++i) {
        // Passo 1: Preencher o contentor de coeficientes com zeros.
        // Isto descarta efetivamente os coeficientes de alta frequência que não foram guardados.
        fill(dct_coeffs.begin(), dct_coeffs.end(), 0.0);

        // Passo 2: Ler os coeficientes de baixa frequência do ficheiro.
        for (int j = 0; j < coeffs_to_read; ++j) {
            int32_t quantized = bs_in.read_n_bits(32);
            dct_coeffs[j] = dequantize_coeff(quantized);
        }

        // Passo 3: Aplicar a DCT Inversa.
        fftw_execute(plan);

        // Converte o bloco de volta para amostras PCM de 16 bits.
        for (int j = 0; j < blockSize; ++j) {
            double val = round(block[j]);
            // Garante que o valor está dentro dos limites de 16 bits.
            if (val > 32767.0) val = 32767.0;
            if (val < -32768.0) val = -32768.0;
            samples[i * blockSize + j] = static_cast<short>(val);
        }
    }

    fftw_destroy_plan(plan);
    in_fs.close();

    // Escreve as amostras reconstruídas, garantindo que se escreve apenas o número original de frames.
    sfhOut.writef(samples.data(), totalFrames);

    cout << "Decoded " << inFile << " to " << outFile << endl;

    return 0;
}