#include <iostream>
#include <vector>
#include <cmath>
#include <numeric> // Para std::accumulate
#include <sndfile.hh>
#include <algorithm>

using namespace std;

constexpr size_t FRAMES_BUFFER_SIZE = 65536;

int main(int argc, char *argv[]) {
    if (argc < 6){
        cerr << "Uso: " << argv[0] << " <arquivo_original.wav> <arquivo_out.wav> <delay_ms> <decay> <mod_freq_hz>\n";
        return 1;
    }

    SndfileHandle sndFile{argv[1]};
    if(sndFile.error()){
        cerr << "Erro: Arquivo original inválido.\n";
        return 1;
    }

    if((sndFile.format() & SF_FORMAT_TYPEMASK) != SF_FORMAT_WAV){
        cerr << "Erro: O arquivo não está em formato WAV.\n";
        return 1;
    }

    if ((sndFile.format() & SF_FORMAT_SUBMASK) != SF_FORMAT_PCM_16) {
        cerr << "Erro: O arquivo não está em formato PCM 16 bits.\n";
        return 1;
    }

    std::string singleEcoFile = std::string(argv[2]) + "Single_Eco.wav";
    SndfileHandle outFileSingle{singleEcoFile, SFM_WRITE, sndFile.format(), sndFile.channels(), sndFile.samplerate()};
    if(outFileSingle.error()){
        cerr << "Erro: Não foi possível criar o arquivo de saída Single_Eco.\n";
        return 1;
    }

    std::string multiEcoFile = std::string(argv[2]) + "Multi_Eco.wav";
    SndfileHandle outFileMulti{multiEcoFile, SFM_WRITE, sndFile.format(), sndFile.channels(), sndFile.samplerate()};
    if(outFileMulti.error()){
        cerr << "Erro: Não foi possível criar o arquivo de saída Multi_Eco.\n";
        return 1;
    }

    std::string amplitudeModFile = std::string(argv[2]) + "AM.wav";
    SndfileHandle outFileAM{amplitudeModFile, SFM_WRITE, sndFile.format(), sndFile.channels(), sndFile.samplerate()};
    if(outFileAM.error()){
        cerr << "Erro: Não foi possível criar o arquivo de saída AM.\n";
        return 1;
    }

    double delay_ms = stod(argv[3]);
    double decay = stod(argv[4]);
    double mod_freq = stod(argv[5]);

    size_t numChannels = sndFile.channels();
    int sampleRate = sndFile.samplerate();
    size_t delay_samples = static_cast<size_t>((delay_ms / 1000.0) * sampleRate);

    vector<vector<short>> delayBufferSingle(numChannels, vector<short>(delay_samples, 0));
    vector<vector<short>> delayBufferMulti(numChannels, vector<short>(delay_samples, 0));
    size_t delayIndex = 0;

    vector<short> samples(FRAMES_BUFFER_SIZE * numChannels);
    size_t nFrames;

    size_t totalSamplesProcessed = 0;

    while ((nFrames = sndFile.readf(samples.data(), FRAMES_BUFFER_SIZE)) > 0)
    {
        samples.resize(nFrames * numChannels);
        vector<short> samplesSingle = samples;  // Cópia para single echo
        vector<short> samplesMulti = samples;   // Cópia para multi echo
        vector<short> samplesAM = samples;      // Cópia para AM

        for (size_t i = 0; i < static_cast<size_t>(nFrames); ++i) {
            // Calcular o índice temporal atual
            double time_sec = static_cast<double>(totalSamplesProcessed + i) / sampleRate;
            
            // Calcular a modulação AM: (1 + m * cos(2π * fm * t))
            double modulation_index = 0.5;
            double am_factor = 1.0 + modulation_index * cos(2.0 * M_PI * mod_freq * time_sec);

            for (size_t ch = 0; ch < numChannels; ++ch) {
                size_t sampleIndex = i * numChannels + ch;
                short currentSample = samples[sampleIndex];

                // Amplitude Modulation
                int modulatedSample = static_cast<int>(currentSample * am_factor);
                modulatedSample = max(-32768, min(32767, modulatedSample));
                samplesAM[sampleIndex] = static_cast<short>(modulatedSample);

                // Single Echo
                short delaySampleSingle = delayBufferSingle[ch][delayIndex];
                int combinedSingle = currentSample + static_cast<int>(delaySampleSingle * decay);
                combinedSingle = max(-32768, min(32767, combinedSingle));
                samplesSingle[sampleIndex] = static_cast<short>(combinedSingle);
                delayBufferSingle[ch][delayIndex] = currentSample;

                // Multi Echo
                short delaySampleMulti = delayBufferMulti[ch][delayIndex];
                int combinedMulti = currentSample + static_cast<int>(delaySampleMulti * decay);
                combinedMulti = max(-32768, min(32767, combinedMulti));
                samplesMulti[sampleIndex] = static_cast<short>(combinedMulti);
                delayBufferMulti[ch][delayIndex] = static_cast<short>(combinedMulti);
            }

            delayIndex = (delayIndex + 1) % delay_samples;
        }

        totalSamplesProcessed += nFrames;

        // Escrever uma vez por buffer, fora dos loops
        outFileSingle.writef(samplesSingle.data(), nFrames);
        outFileMulti.writef(samplesMulti.data(), nFrames);
        outFileAM.writef(samplesAM.data(), nFrames);
    }

    return 0;
}