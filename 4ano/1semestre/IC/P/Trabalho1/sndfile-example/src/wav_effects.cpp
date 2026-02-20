#include <iostream>
#include <vector>
#include <cmath>
#include <sndfile.hh>
#include <algorithm>
#include <string>
#include <set> 

using namespace std;

constexpr size_t FRAMES_BUFFER_SIZE = 65536;

class AudioEffects {
public:

    // Efeitos simples (adaptados para processamento em blocos)

    // Amplitude Modulation y(t) = x(t) * (1 + depth * cos(2 * pi * f_m * t))
    static void amplitudeModulation(vector<short>& samples, int numChannels, int sampleRate,
                                   double modFreq, double depth, size_t frameOffset = 0) { // MODIFICADO: Adicionado frameOffset
        for(size_t i = 0; i < samples.size(); i++) {
            size_t frameIndex = (i / numChannels) + frameOffset; // MODIFICADO: Usa o offset global
            double time = static_cast<double>(frameIndex) / sampleRate;

            double modulator = 1.0 + depth * cos(2.0 * M_PI * modFreq * time);
            int newValue = static_cast<int>(samples[i] * modulator);
            samples[i] = static_cast<short>(max(-32768, min(32767, newValue)));
        }
    }

    // Tremolo: Modulação de amplitude com um LFO (Low-Frequency Oscillator) sinusoidal.
    static void tremolo(vector<short>& samples, int numChannels, int sampleRate,
                       double modFreq, double depth, size_t frameOffset = 0) { // MODIFICADO: Adicionado frameOffset
        for(size_t i = 0; i < samples.size(); i++) {
            size_t frameIndex = (i / numChannels) + frameOffset; // MODIFICADO: Usa o offset global
            double time = static_cast<double>(frameIndex) / sampleRate;

            double modulator = (1.0 - depth) + depth * (0.5 * (1.0 + sin(2.0 * M_PI * modFreq * time)));
            int newValue = static_cast<int>(samples[i] * modulator);
            samples[i] = static_cast<short>(max(-32768, min(32767, newValue)));
        }
    }

    // Distorção: Aplica um ganho e corta o sinal (hard clipping) num limiar.
    static void distortion(vector<short>& samples, double gain, short threshold) {
        for(size_t i = 0; i < samples.size(); i++) {
            int newValue = static_cast<int>(samples[i] * gain);
            if(newValue > threshold) {
                newValue = threshold;
            } else if(newValue < -threshold) {
                newValue = -threshold;
            }
            samples[i] = static_cast<short>(newValue);
        }
    }

    // Filtro Passa-Baixo (IIR de 1ª ordem): y[k] = alpha*x[k] + (1-alpha)*y[k-1]
    static void lowPassFilter(vector<short>& samples, int numChannels, double alpha, vector<short>& lastSamples) {
        for(int ch = 0; ch < numChannels; ++ch) {
            if(samples.size() > (size_t)ch) {
                 samples[ch] = static_cast<short>(alpha * samples[ch] + (1.0 - alpha) * lastSamples[ch]);
            }
        }
        
        for(size_t i = numChannels; i < samples.size(); i++) {
            samples[i] = static_cast<short>(alpha * samples[i] + (1.0 - alpha) * samples[i - numChannels]);
        }

        if(!samples.empty()) {
            for(int ch = 0; ch < numChannels; ++ch) {
                lastSamples[ch] = samples[samples.size() - numChannels + ch];
            }
        }
    }

    // Filtro Passa-Alto (IIR de 1ª ordem): y[k] = alpha*(y[k-1] + x[k] - x[k-1])
    static void highPassFilter(vector<short>& samples, int numChannels, double alpha, vector<short>& lastSamples, vector<short>& lastInputSamples) {
        vector<short> originalSamples = samples; // Cópia das amostras de entrada do bloco atual

        for(int ch = 0; ch < numChannels; ++ch) {
            if(samples.size() > (size_t)ch) {
                 samples[ch] = static_cast<short>(alpha * (lastSamples[ch] + samples[ch] - lastInputSamples[ch]));
            }
        }

        for(size_t i = numChannels; i < samples.size(); i++) {
            samples[i] = static_cast<short>(alpha * (samples[i - numChannels] + originalSamples[i] - originalSamples[i - numChannels]));
        }

        if(!samples.empty()) {
            for(int ch = 0; ch < numChannels; ++ch) {
                lastSamples[ch] = samples[samples.size() - numChannels + ch];
                lastInputSamples[ch] = originalSamples[originalSamples.size() - numChannels + ch];
            }
        }
    }

    // Efeitos complexos (mantidos com processamento em memória)

    // Eco Simples: y[k] = x[k] + g * x[k-D]
    static void addEcho(vector<short>& samples, int numChannels, int sampleRate, 
                       double delaySeconds, double gain) {
        size_t delaySamples = static_cast<size_t>(delaySeconds * sampleRate) * numChannels;
        vector<short> outputSamples(samples.size() + delaySamples, 0);
        for(size_t i = 0; i < samples.size(); i++) { outputSamples[i] = samples[i]; }
        for(size_t i = 0; i < samples.size(); i++) {
            int echoedValue = static_cast<int>(samples[i] * gain);
            int newValue = static_cast<int>(outputSamples[i + delaySamples]) + echoedValue;
            outputSamples[i + delaySamples] = static_cast<short>(max(-32768, min(32767, newValue)));
        }
        samples = move(outputSamples);
    }

    // Eco Múltiplo (com feedback): y[k] = x[k] + g * y[k-D]
    static void addMultipleEchoes(vector<short>& samples, int numChannels, int sampleRate,
                                 double delaySeconds, double gain) {
        size_t delaySamples = static_cast<size_t>(delaySeconds * sampleRate) * numChannels;
        samples.resize(samples.size() + delaySamples, 0);
        for(size_t i = delaySamples; i < samples.size(); i++){
            int echoedValue = static_cast<int>(samples[i - delaySamples] * gain);
            int newValue = static_cast<int>(samples[i]) + echoedValue;
            samples[i] = static_cast<short>(max(-32768, min(32767, newValue)));
        }
    }
    
    // Atraso Variável no Tempo: Eco simples onde o atraso D muda aleatoriamente a cada segundo
    static void timeVaryingDelay(vector<short>& samples, int numChannels, int sampleRate, double gain) {
        srand(time(nullptr));
        size_t minDelaySamples = static_cast<size_t>(0.5 * sampleRate) * numChannels;
        size_t maxDelaySamples = static_cast<size_t>(2.0 * sampleRate) * numChannels;
        vector<short> echoSamples(samples.size() + maxDelaySamples, 0);
        for (size_t i = 0; i < samples.size(); i++) { echoSamples[i] = samples[i]; }
        size_t lastSecond = 0;
        size_t randomDelay = minDelaySamples;
        for (size_t i = maxDelaySamples; i < samples.size() + maxDelaySamples; i++) {
            size_t currentFrame = (i < samples.size()) ? (i / numChannels) : ((samples.size() - 1) / numChannels);
            size_t currentSecond = currentFrame / sampleRate;
            if (currentSecond != lastSecond) {
                randomDelay = minDelaySamples + rand() % (maxDelaySamples - minDelaySamples + 1);
                lastSecond = currentSecond;
            }
            if (i >= randomDelay) {
                int echoedValue = static_cast<int>(echoSamples[i - randomDelay] * gain);
                int newValue = static_cast<int>(echoSamples[i]) + echoedValue;
                echoSamples[i] = static_cast<short>(max(-32768, min(32767, newValue)));
            }
        }
        samples = move(echoSamples);
    }
    
    // Vibrato: Modulação da frequência através de um atraso sinusoidal de baixa frequência.
    static void vibrato(vector<short>& samples, int numChannels, int sampleRate,
                       double modFreq, double depth) {
        vector<short> vibratoSamples(samples.size(), 0);
        for(size_t i = 0; i < samples.size(); i++) {
            size_t frameIndex = i / numChannels;
            double time = static_cast<double>(frameIndex) / sampleRate;
            double delay = (depth / 1000.0) * sin(2.0 * M_PI * modFreq * time);
            int delaySamples = static_cast<int>(delay * sampleRate) * numChannels;
            int srcIndex = static_cast<int>(i) - delaySamples;
            if(srcIndex >= 0 && srcIndex < static_cast<int>(samples.size())) {
                vibratoSamples[i] = samples[srcIndex];
            } else {
                vibratoSamples[i] = 0;
            }
        }
        samples = move(vibratoSamples);
    }
};

void printUsage(const char* programName) {
    cout << "Usage: " << programName << " <input.wav> <output.wav> <effect> [parameters]\n\n";
    cout << "Available effects:\n";
    cout << "  echo <delay_ms> <gain>                         - Single echo\n";
    cout << "  multi_echo <delay_ms> <gain>                   - Multiple echoes with feedback\n";
    cout << "  amp_mod <freq> <depth>                         - Amplitude modulation\n";
    cout << "  time_var_delay <gain>                          - Time-varying delay\n";
    cout << "  tremolo <mod_freq> <depth>                     - Tremolo effect\n";
    cout << "  vibrato <mod_freq> <depth>                     - Vibrato effect\n";
    cout << "  low_pass <alpha>                               - Low-pass filter\n";
    cout << "  high_pass <alpha>                              - High-pass filter\n";
    cout << "  distortion <gain> <threshold>                  - Distortion effect\n\n";
}

int main(int argc, char *argv[]) {
    if(argc < 4) {
        printUsage(argv[0]);
        return 1;
    }

    string inputFile = argv[1];
    string outputFile = argv[2];
    string effect = argv[3];

    SndfileHandle sfhIn { inputFile };
    if(sfhIn.error()) { cerr << "Error: cannot open input file '" << inputFile << "'\n"; return 1; }
    if((sfhIn.format() & SF_FORMAT_TYPEMASK) != SF_FORMAT_WAV) { cerr << "Error: input file is not in WAV format\n"; return 1; }
    if((sfhIn.format() & SF_FORMAT_SUBMASK) != SF_FORMAT_PCM_16) { cerr << "Error: input file is not in PCM_16 format\n"; return 1; }

    SndfileHandle sfhOut { outputFile, SFM_WRITE, sfhIn.format(), sfhIn.channels(), sfhIn.samplerate() };
    if(sfhOut.error()) { cerr << "Error: cannot create output file '" << outputFile << "'\n"; return 1; }

    const set<string> blockProcessableEffects = {
        "amp_mod", "tremolo", "distortion", "low_pass", "high_pass"
    };

    bool isBlockProcessable = blockProcessableEffects.count(effect);

    if (isBlockProcessable) {
        // Lógica de Processamento em Blocos
        cout << "Processing '" << effect << "' in block mode (low memory usage).\n";
        vector<short> samples(FRAMES_BUFFER_SIZE * sfhIn.channels());
        size_t nFrames;
        size_t totalFramesProcessed = 0;
        
        vector<short> lastFilterSamples(sfhIn.channels(), 0);
        vector<short> lastFilterInputSamples(sfhIn.channels(), 0);

        while((nFrames = sfhIn.readf(samples.data(), FRAMES_BUFFER_SIZE))) {
            samples.resize(nFrames * sfhIn.channels());
            
            try {
                if(effect == "amp_mod") {
                    double freq = stod(argv[4]); double depth = stod(argv[5]);
                    AudioEffects::amplitudeModulation(samples, sfhIn.channels(), sfhIn.samplerate(), freq, depth, totalFramesProcessed);
                } else if (effect == "tremolo") {
                    double modFreq = stod(argv[4]); double depth = stod(argv[5]);
                    AudioEffects::tremolo(samples, sfhIn.channels(), sfhIn.samplerate(), modFreq, depth, totalFramesProcessed);
                } else if (effect == "distortion") {
                    double gain = stod(argv[4]); short threshold = static_cast<short>(stoi(argv[5]));
                    AudioEffects::distortion(samples, gain, threshold);
                } else if (effect == "low_pass") {
                    double alpha = stod(argv[4]);
                    AudioEffects::lowPassFilter(samples, sfhIn.channels(), alpha, lastFilterSamples);
                } else if (effect == "high_pass") {
                    double alpha = stod(argv[4]);
                    AudioEffects::highPassFilter(samples, sfhIn.channels(), alpha, lastFilterSamples, lastFilterInputSamples);
                }
            } catch(const exception& e) {
                cerr << "Error parsing parameters: " << e.what() << "\n";
                return 1;
            }

            sfhOut.writef(samples.data(), nFrames);
            totalFramesProcessed += nFrames;
        }
        cout << "Successfully wrote " << totalFramesProcessed << " frames to '" << outputFile << "'\n";

    } else {
        // Lógica de Processamento em Memória
        cout << "Warning: Effect '" << effect << "' requires full file buffering.\n";
        vector<short> samples(sfhIn.frames() * sfhIn.channels());
        size_t nFrames = sfhIn.readf(samples.data(), sfhIn.frames());
        samples.resize(nFrames * sfhIn.channels());

        try {
            if(effect == "echo") {
                if(argc != 6) { cerr << "Error: echo requires <delay_ms> <gain>\n"; return 1; }
                double delayMs = stod(argv[4]); double gain = stod(argv[5]);
                AudioEffects::addEcho(samples, sfhIn.channels(), sfhIn.samplerate(), delayMs / 1000.0, gain);
            } else if(effect == "multi_echo") {
                if(argc != 6) { cerr << "Error: multi_echo requires <delay_ms> <gain>\n"; return 1; }
                double delayMs = stod(argv[4]); double gain = stod(argv[5]);
                AudioEffects::addMultipleEchoes(samples, sfhIn.channels(), sfhIn.samplerate(), delayMs / 1000.0, gain);
            } else if(effect == "time_var_delay") {
                if(argc != 5) { cerr << "Error: time_var_delay requires <gain>\n"; return 1; }
                double gain = stod(argv[4]);
                AudioEffects::timeVaryingDelay(samples, sfhIn.channels(), sfhIn.samplerate(), gain);
            } else if(effect == "vibrato") {
                if(argc != 6) { cerr << "Error: vibrato requires <mod_freq> <depth>\n"; return 1; }
                double modFreq = stod(argv[4]); double depth = stod(argv[5]);
                AudioEffects::vibrato(samples, sfhIn.channels(), sfhIn.samplerate(), modFreq, depth);
            } else {
                cerr << "Error: unknown effect '" << effect << "'\n";
                printUsage(argv[0]);
                return 1;
            }
        } catch(const exception& e) {
            cerr << "Error parsing parameters: " << e.what() << "\n";
            return 1;
        }

        sfhOut.writef(samples.data(), samples.size() / sfhIn.channels());
        cout << "Successfully wrote " << samples.size() / sfhIn.channels() << " frames to '" << outputFile << "'\n";
    }

    return 0;
}