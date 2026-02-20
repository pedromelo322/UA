#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <sndfile.hh>
#include "bit_stream.h"

using namespace std;

constexpr size_t FRAMES_BUFFER_SIZE = 65536;

// Função de quantização uniforme escalar para uma amostra de 16 bits.
short quantize(short sample, int bits) {
    if(bits >= 16) return sample; // Se B >= 16, não há perda de precisão.
    if(bits <= 0) return 0;       // Se B <= 0, a amostra é descartada.
    
    // Calcula o step de quantização (delta).
    int step = 1 << (16 - bits);
    
    // Quantiza a amostra: divide pelo step, arredonda para o inteiro mais próximo
    // e multiplica de volta pelo step, minimizando o erro.
    int quantized = static_cast<int>(round(static_cast<double>(sample) / step)) * step;
    
    // Garante que o valor se mantém nos limites de um inteiro de 16 bits com sinal.
    if(quantized > 32767) quantized = 32767;
    if(quantized < -32768) quantized = -32768;
    
    return static_cast<short>(quantized);
}

int main(int argc, char *argv[]) {
    int bits = 8; // Número de bits por omissão para a quantização.
    
    if(argc < 3 || argc > 4) {
        cerr << "Usage: wav_quant_enc wavFileIn encodedFile [bits]\n";
        cerr << "       bits: number of bits for quantization (1-16, default 8)\n";
        return 1;
    }
    
    // Lê o número de bits da linha de comando, se for fornecido.
    if(argc == 4) {
        bits = atoi(argv[3]);
        if(bits < 1 || bits > 16) {
            cerr << "Error: bits must be between 1 and 16\n";
            return 1;
        }
    }
    
    // Abre o ficheiro WAV de entrada.
    SndfileHandle sfhIn { argv[1] };
    if(sfhIn.error()) {
        cerr << "Error: invalid input file\n";
        return 1;
    }
    
    // Valida o formato do ficheiro de áudio de entrada.
    if((sfhIn.format() & SF_FORMAT_TYPEMASK) != SF_FORMAT_WAV) {
        cerr << "Error: file is not in WAV format\n";
        return 1;
    }
    
    if((sfhIn.format() & SF_FORMAT_SUBMASK) != SF_FORMAT_PCM_16) {
        cerr << "Error: file is not in PCM_16 format\n";
        return 1;
    }
    
    // Abre o ficheiro de destino para escrita em modo binário.
    fstream ofs { argv[2], ios::out | ios::binary };
    if(!ofs.is_open()) {
        cerr << "Error: cannot open output file\n";
        return 1;
    }
    
    BitStream obs { ofs, STREAM_WRITE };
    
    // Escrita do Cabeçalho
    // Metadados essenciais para que o descodificador possa reconstruir o ficheiro WAV.
    obs.write_n_bits(bits, 8);
    obs.write_n_bits(sfhIn.channels(), 16);
    obs.write_n_bits(sfhIn.samplerate(), 32);
    obs.write_n_bits(sfhIn.frames(), 64);
    
    // Processa o áudio em blocos para um uso eficiente de memória RAM.
    size_t nFrames;
    vector<short> samples(FRAMES_BUFFER_SIZE * sfhIn.channels());
    
    cout << "Encoding audio file...\n";
    cout << "Bits per sample: " << bits << "\n";
    cout << "Channels: " << sfhIn.channels() << "\n";
    cout << "Sample rate: " << sfhIn.samplerate() << " Hz\n";
    cout << "Total frames: " << sfhIn.frames() << "\n";
    
    while((nFrames = sfhIn.readf(samples.data(), FRAMES_BUFFER_SIZE))) {
        samples.resize(nFrames * sfhIn.channels());
        
        for(auto& sample : samples) {
            // Passo 1: Quantizar a amostra.
            short quantized = quantize(sample, bits);
            
            // Passo 2: Mapear o valor quantizado (com sinal) para um índice não-negativo.
            // O intervalo de índices de quantização é [0, 2^B - 1].
            // A transformação i_q = x_q / delta + 2^(B-1) realiza este mapeamento.
            int step = 1 << (16 - bits);
            int scaled = (quantized / step) + (1 << (bits - 1));
            
            // Garante que o índice está no intervalo correto antes de ser escrito.
            if(scaled < 0) scaled = 0;
            if(scaled >= (1 << bits)) scaled = (1 << bits) - 1;
            
            // Passo 3: Escrever o índice usando exatamente 'bits' bits no ficheiro.
            obs.write_n_bits(scaled, bits);
        }
    }
    
    obs.close();
    cout << "Encoding complete.\n";
    
    return 0;
}