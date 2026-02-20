#include <iostream>
#include <vector>
#include <cmath>
#include <string>
#include <sndfile.hh>
#include <fftw3.h>
#include "bit_stream.h"

using namespace std;

// Arredonda um coeficiente double para o inteiro de 32 bits mais próximo.
int32_t quantize_coeff(double coeff) {
    return static_cast<int32_t>(round(coeff));
}

int main(int argc, char *argv[]) {
    if (argc < 4) {
        cerr << "Usage: mono_dct_enc <input.wav> <output.bin> <blockSize> [bits (default 4)]\n";
        cerr << "       bits: Target average bits per sample (1-16)\n";
        return 1;
    }

    const char* inFile = argv[1];
    const char* outFile = argv[2];
    const int blockSize = stoi(argv[3]);
    int bits = (argc > 4) ? stoi(argv[4]) : 4;
    
    if (bits < 1 || bits > 16) {
        cerr << "Error: bits must be between 1 and 16\n";
        return 1;
    }

    SndfileHandle sfhIn { inFile };
    if (sfhIn.error()) { cerr << "Error: invalid input file\n"; return 1; }
    if (sfhIn.channels() != 1) { cerr << "Error: input file is not mono\n"; return 1; }

    // Calcula o número de coeficientes a preservar.
    int coeffs_to_keep = (bits * blockSize) / 32;
    if (coeffs_to_keep == 0) coeffs_to_keep = 1;
    if (coeffs_to_keep > blockSize) coeffs_to_keep = blockSize;

    fstream out_fs { outFile, ios::out | ios::binary };
    if (!out_fs) { cerr << "Error: could not open output file " << outFile << endl; return 1; }
    BitStream bs_out(out_fs, STREAM_WRITE);

    // Escrita do Cabeçalho
    bs_out.write_n_bits(sfhIn.samplerate(), 32);
    bs_out.write_n_bits(sfhIn.frames(), 64);
    bs_out.write_n_bits(blockSize, 16);
    bs_out.write_n_bits(coeffs_to_keep, 16);

    vector<short> samples(sfhIn.frames());
    sfhIn.readf(samples.data(), sfhIn.frames());

    // Garante que o vetor de amostras tem um tamanho múltiplo do blockSize (padding).
    size_t numBlocks = (sfhIn.frames() + blockSize - 1) / blockSize;
    samples.resize(numBlocks * blockSize, 0); 

    vector<double> block(blockSize);
    vector<double> dct_coeffs(blockSize);

    // Cria um plano FFTW para a DCT, que pré-calcula otimizações.
    fftw_plan plan = fftw_plan_r2r_1d(blockSize, block.data(), dct_coeffs.data(), FFTW_REDFT10, FFTW_ESTIMATE);
    
    for (size_t i = 0; i < numBlocks; ++i) {
        for (int j = 0; j < blockSize; ++j) {
            block[j] = samples[i * blockSize + j];
        }

        // Passo 1: Aplicar a DCT.
        fftw_execute(plan);

        // Itera apenas sobre os coeficientes de baixa frequência a serem preservados.
        for (int j = 0; j < coeffs_to_keep; ++j) {

            // Passo 2: Normalizar o coeficiente. A DCT da FFTW não é normalizada (ganho de 2*N).
            double normalized_coeff = dct_coeffs[j] / (2.0 * blockSize);
            
            // Passo 3: Arredondar para inteiro e escrever no ficheiro.
            int32_t quantized = quantize_coeff(normalized_coeff);
            bs_out.write_n_bits(quantized, 32);
        }
    }

    fftw_destroy_plan(plan);
    bs_out.close();
    out_fs.close();

    cout << "Encoded " << inFile << " to " << outFile << " with target " << bits << " bits/sample." << endl;
    cout << "Kept " << coeffs_to_keep << " coefficients per block of " << blockSize << "." << endl;


    return 0;
}