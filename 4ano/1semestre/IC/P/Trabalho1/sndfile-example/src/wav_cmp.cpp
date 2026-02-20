#include <iostream>
#include <vector>
#include <cmath>
#include <sndfile.hh>
#include <algorithm>
#include <iomanip>

using namespace std;

constexpr size_t FRAMES_BUFFER_SIZE = 65536; // Buffer para leitura de frames.

// Estrutura para armazenar as métricas de erro calculadas para um canal.
struct AudioMetrics {
    double mse = 0.0;          // Erro Quadrático Médio (Mean Squared Error)
    double maxAbsError = 0.0;  // Erro Máximo Absoluto (Norma L-infinito)
    double snr = 0.0;          // Relação Sinal-Ruído (Signal-to-Noise Ratio) em dB
    size_t sampleCount = 0;    // Contador de amostras processadas
    double signalPower = 0.0;  // Potência acumulada do sinal original
};

int main(int argc, char *argv[]) {
    if(argc != 3) {
        cerr << "Usage: " << argv[0] << " <original_file> <processed_file>\n";
        return 1;
    }

    // Abertura e Validação dos Ficheiros
    SndfileHandle sfhOriginal { argv[1] };
    if(sfhOriginal.error()) {
        cerr << "Error: invalid original file\n";
        return 1;
    }

    if((sfhOriginal.format() & SF_FORMAT_TYPEMASK) != SF_FORMAT_WAV) {
        cerr << "Error: original file is not in WAV format\n";
        return 1;
    }

    if((sfhOriginal.format() & SF_FORMAT_SUBMASK) != SF_FORMAT_PCM_16) {
        cerr << "Error: original file is not in PCM_16 format\n";
        return 1;
    }

    // Abre o ficheiro WAV processado.
    SndfileHandle sfhProcessed { argv[2] };
    if(sfhProcessed.error()) {
        cerr << "Error: invalid processed file\n";
        return 1;
    }

    if((sfhProcessed.format() & SF_FORMAT_TYPEMASK) != SF_FORMAT_WAV) {
        cerr << "Error: processed file is not in WAV format\n";
        return 1;
    }

    if((sfhProcessed.format() & SF_FORMAT_SUBMASK) != SF_FORMAT_PCM_16) {
        cerr << "Error: processed file is not in PCM_16 format\n";
        return 1;

    // Verifica se os ficheiros são compatíveis (mesmos canais, taxa de amostragem, etc.).
    if(sfhOriginal.channels() != sfhProcessed.channels()) {
        cerr << "Error: files have different number of channels\n";
        return 1;
    }

    if(sfhOriginal.samplerate() != sfhProcessed.samplerate()) {
        cerr << "Error: files have different sample rates\n";
        return 1;
    }

    if(sfhOriginal.frames() != sfhProcessed.frames()) {
        cerr << "Error: files have different number of frames\n";
        return 1;
    }

    int numChannels = sfhOriginal.channels();
    vector<AudioMetrics> channelMetrics(numChannels); // Métricas para cada canal individual (L, R, etc.).
    AudioMetrics midMetrics;                          // Métricas para o canal MID em ficheiros estéreo.
    bool isStereo = (numChannels == 2);

    size_t nFrames;
    vector<short> samplesOriginal(FRAMES_BUFFER_SIZE * numChannels);
    vector<short> samplesProcessed(FRAMES_BUFFER_SIZE * numChannels);

    // Processa os ficheiros em blocos para eficiência de memória.
    while((nFrames = sfhOriginal.readf(samplesOriginal.data(), FRAMES_BUFFER_SIZE))) {
        samplesOriginal.resize(nFrames * numChannels);
    
        size_t readFrames = sfhProcessed.readf(samplesProcessed.data(), FRAMES_BUFFER_SIZE);
        if(readFrames != nFrames) {
            cerr << "Error: frame mismatch during reading\n";
            return 1;
        }

        samplesProcessed.resize(nFrames * numChannels);

        // Cálculo para Canais Individuais
        for(size_t i = 0; i < samplesOriginal.size(); i++) {
            int channel = i % numChannels;
            double original = static_cast<double>(samplesOriginal[i]);
            double processed = static_cast<double>(samplesProcessed[i]);
            double error = original - processed;
            double absError = abs(error);
            double squaredError = error * error;

            // Atualiza as métricas para o canal correspondente.
            channelMetrics[channel].mse += squaredError;
            channelMetrics[channel].maxAbsError = max(channelMetrics[channel].maxAbsError, absError);
            channelMetrics[channel].signalPower += original * original;
            channelMetrics[channel].sampleCount++;
        }

        // Cálculo para o Canal MID (apenas se for estéreo)
        if(isStereo) {
            for(size_t frame = 0; frame < nFrames; frame++) {
                size_t leftIdx = frame * 2;
                size_t rightIdx = frame * 2 + 1;

                // MID = (L + R) / 2.0
                double origLeft = static_cast<double>(samplesOriginal[leftIdx]);
                double origRight = static_cast<double>(samplesOriginal[rightIdx]);
                double origMid = (origLeft + origRight) / 2.0;

                double procLeft = static_cast<double>(samplesProcessed[leftIdx]);
                double procRight = static_cast<double>(samplesProcessed[rightIdx]);
                double procMid = (procLeft + procRight) / 2.0;

                double midError = origMid - procMid;
                double midAbsError = abs(midError);
                double midSquaredError = midError * midError;

                // Atualiza as métricas para o canal MID.
                midMetrics.mse += midSquaredError;
                midMetrics.maxAbsError = max(midMetrics.maxAbsError, midAbsError);
                midMetrics.signalPower += origMid * origMid;
                midMetrics.sampleCount++;
            }
        }
    }

    // Finalização e Apresentação dos Resultados
    cout << fixed << setprecision(6);
    cout << "Audio Comparison Results:\n========================\n\n";

    // Apresenta os resultados por canal.
    for(int ch = 0; ch < numChannels; ch++) {
        if(channelMetrics[ch].sampleCount > 0) {
            // Finaliza o cálculo do MSE (média).
            channelMetrics[ch].mse /= channelMetrics[ch].sampleCount;
            
            // Calcula o SNR em dB.
            double avgSignalPower = channelMetrics[ch].signalPower / channelMetrics[ch].sampleCount;
            if(channelMetrics[ch].mse > 0 && avgSignalPower > 0) {
                channelMetrics[ch].snr = 10.0 * log10(avgSignalPower / channelMetrics[ch].mse);
            } else if(channelMetrics[ch].mse == 0) {
                channelMetrics[ch].snr = INFINITY; // Caso ideal: erro zero.
            } else {
                channelMetrics[ch].snr = -INFINITY; // Caso atípico: sinal com potência nula.
            }

            cout << "Channel " << ch << ":\n";
            cout << "  Mean Squared Error (L2):     " << channelMetrics[ch].mse << "\n";
            cout << "  Max Absolute Error (L∞):     " << channelMetrics[ch].maxAbsError << "\n";
            
            if(isfinite(channelMetrics[ch].snr)) {
                cout << "  Signal-to-Noise Ratio (SNR): " << channelMetrics[ch].snr << " dB\n";
            } else if(channelMetrics[ch].snr == INFINITY) {
                cout << "  Signal-to-Noise Ratio (SNR): ∞ dB (perfect match)\n";
            } else {
                cout << "  Signal-to-Noise Ratio (SNR): -∞ dB (no signal)\n";
            }
            cout << "\n";
        }
    }

    // Apresenta os resultados do canal MID.
    if(isStereo && midMetrics.sampleCount > 0) {
        // Calcula o MSE médio e o SNR para o canal MID.
        midMetrics.mse /= midMetrics.sampleCount;
        double avgSignalPower = midMetrics.signalPower / midMetrics.sampleCount;
        
        if(midMetrics.mse > 0 && avgSignalPower > 0) {
            midMetrics.snr = 10.0 * log10(avgSignalPower / midMetrics.mse);
        } else if(midMetrics.mse == 0) {
            midMetrics.snr = INFINITY;
        } else {
            midMetrics.snr = -INFINITY;
        }

        cout << "MID Channel (Average of Channels):\n";
        cout << "  Mean Squared Error (L2):     " << midMetrics.mse << "\n";
        cout << "  Max Absolute Error (L∞):     " << midMetrics.maxAbsError << "\n";
        
        if(isfinite(midMetrics.snr)) {
            cout << "  Signal-to-Noise Ratio (SNR): " << midMetrics.snr << " dB\n";
        } else if(midMetrics.snr == INFINITY) {
            cout << "  Signal-to-Noise Ratio (SNR): ∞ dB (perfect match)\n";
        } else {
            cout << "  Signal-to-Noise Ratio (SNR): -∞ dB (no signal)\n";
        }
        cout << "\n";
    }

    cout << "Total samples processed per channel: " << (isStereo ? channelMetrics[0].sampleCount : channelMetrics[0].sampleCount) << "\n";
    cout << "Number of channels: " << numChannels << "\n";
    if(isStereo) {
        cout << "MID channel samples processed: " << midMetrics.sampleCount << "\n";
    }

    return 0;
}