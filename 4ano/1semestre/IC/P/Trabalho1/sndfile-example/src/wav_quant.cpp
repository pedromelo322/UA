#include <iostream>
#include <vector>
#include <cmath>
#include <sndfile.hh>

using namespace std;

constexpr size_t FRAMES_BUFFER_SIZE = 65536;

// Função que aplica a quantização uniforme escalar a uma única amostra.
short quantize(short sample, int bits) {
    // Se o número de bits for 16 ou mais, não é necessária quantização.
    if(bits >= 16) return sample;
    // Se for 0 ou menos, o resultado é o silêncio.
    if(bits <= 0) return 0;       
    
    // Calcula o step de quantização (delta) com base no número de bits de destino.
    // step = 2^(16-B)
    int step = 1 << (16 - bits);
    
    // Processo de quantização:
    // 1. Divide a amostra pelo step.
    // 2. Arredonda para o inteiro mais próximo.
    // 3. Multiplica de volta pelo step para obter o múltiplo mais próximo.
    int quantized = static_cast<int>(round(static_cast<double>(sample) / step)) * step;
    
    // Garante que o valor final se mantém dentro do intervalo de um inteiro de 16 bits com sinal.
    if(quantized > 32767) quantized = 32767;
    if(quantized < -32768) quantized = -32768;
    
    return static_cast<short>(quantized);
}

int main(int argc, char *argv[]) {
    int bits = 8; // Número de bits por omissão para a quantização.
    
    if(argc < 3 || argc > 4) {
        cerr << "Usage: wav_quant wavFileIn wavFileOut [bits]\n";
        cerr << "       bits: number of bits for quantization (1-16, default 8)\n";
        return 1;
    }
    
    // Analisa o argumento 'bits' se este for fornecido pelo utilizador.
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
    
    // Valida se o formato do ficheiro de entrada é WAV PCM de 16 bits.
    if((sfhIn.format() & SF_FORMAT_TYPEMASK) != SF_FORMAT_WAV) {
        cerr << "Error: file is not in WAV format\n";
        return 1;
    }
    
    if((sfhIn.format() & SF_FORMAT_SUBMASK) != SF_FORMAT_PCM_16) {
        cerr << "Error: file is not in PCM_16 format\n";
        return 1;
    }
    
    // Abre o ficheiro WAV de saída, mantendo as propriedades do original (formato, canais, taxa de amostragem).
    SndfileHandle sfhOut { argv[2], SFM_WRITE, sfhIn.format(),
                          sfhIn.channels(), sfhIn.samplerate() };
    if(sfhOut.error()) {
        cerr << "Error: invalid output file\n";
        return 1;
    }
    
    // Processa o áudio em blocos para ser eficiente no uso de memória.
    size_t nFrames;
    vector<short> samples(FRAMES_BUFFER_SIZE * sfhIn.channels());
    
    while((nFrames = sfhIn.readf(samples.data(), FRAMES_BUFFER_SIZE))) {
        samples.resize(nFrames * sfhIn.channels());
        
        // Aplica a quantização a cada amostra do bloco lido.
        for(auto& sample : samples) {
            sample = quantize(sample, bits);
        }
        
        // Escreve o bloco de amostras já quantizadas no ficheiro de saída.
        sfhOut.writef(samples.data(), nFrames);
    }
    
    return 0;
}