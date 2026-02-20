#include <iostream>
#include <fstream>
#include <vector>
#include <sndfile.hh>
#include "bit_stream.h"

using namespace std;

constexpr size_t FRAMES_BUFFER_SIZE = 65536;

int main(int argc, char *argv[]) {
    if(argc != 3) {
        cerr << "Usage: wav_quant_dec encodedFile wavFileOut\n";
        return 1;
    }
    
    // Abre o ficheiro binário codificado.
    fstream ifs { argv[1], ios::in | ios::binary };
    if(!ifs.is_open()) {
        cerr << "Error: cannot open input file\n";
        return 1;
    }
    
    BitStream ibs { ifs, STREAM_READ };
    
    // Leitura do Cabeçalho
    // Lê os metadados para saber como reconstruir o ficheiro WAV.
    int bits = ibs.read_n_bits(8);
    int channels = ibs.read_n_bits(16);
    int samplerate = ibs.read_n_bits(32);
    size_t totalFrames = ibs.read_n_bits(64);
    
    cout << "Decoding audio file...\n";
    cout << "Bits per sample: " << bits << "\n";
    cout << "Channels: " << channels << "\n";
    cout << "Sample rate: " << samplerate << " Hz\n";
    cout << "Total frames: " << totalFrames << "\n";
    
    // Valida os parâmetros lidos do cabeçalho.
    if(bits < 1 || bits > 16) {
        cerr << "Error: invalid bits value in encoded file\n";
        return 1;
    }
    
    if(channels < 1 || channels > 16) {
        cerr << "Error: invalid channels value in encoded file\n";
        return 1;
    }
    
    // Abre o ficheiro WAV de saída para escrita.
    SndfileHandle sfhOut { argv[2], SFM_WRITE, SF_FORMAT_WAV | SF_FORMAT_PCM_16, channels, samplerate };
    if(sfhOut.error()) {
        cerr << "Error: cannot create output file\n";
        return 1;
    }
    
    // Pré-calcula o step(delta) e o offset para a desquantização.
    int step = 1 << (16 - bits);
    int offset = 1 << (bits - 1);
    
    vector<short> samples;
    samples.reserve(FRAMES_BUFFER_SIZE * channels);
    
    size_t framesProcessed = 0;
    
    while(framesProcessed < totalFrames) {
        samples.clear();
        
        size_t framesToRead = min(FRAMES_BUFFER_SIZE, totalFrames - framesProcessed);
        size_t samplesToRead = framesToRead * channels;
        
        for(size_t i = 0; i < samplesToRead; i++) {
            // Passo 1: Ler um índice de 'bits' bits do ficheiro.
            int scaled = ibs.read_n_bits(bits);
            
            // Passo 2: Desmapear o índice não-negativo para o valor da amostra quantizada (com sinal).
            // Operação inversa da codificação: x_q = (i_q - 2^(B-1)) * delta.
            int quantized = (scaled - offset) * step;
            
            // Garante que o valor está dentro dos limites de 16 bits.
            if(quantized > 32767) quantized = 32767;
            if(quantized < -32768) quantized = -32768;
            
            samples.push_back(static_cast<short>(quantized));
        }
        
        // Escreve o bloco de amostras reconstruídas no ficheiro WAV.
        sfhOut.writef(samples.data(), framesToRead);
        framesProcessed += framesToRead;
    }
    
    ibs.close();
    cout << "Decoding complete.\n";
    
    return 0;
}