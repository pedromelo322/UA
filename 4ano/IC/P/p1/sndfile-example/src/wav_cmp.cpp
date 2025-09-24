#include <iostream>
#include <vector>
#include <cmath>
#include <numeric> // Para std::accumulate
#include <sndfile.hh>
#include <algorithm>

using namespace std;

constexpr size_t FRAMES_BUFFER_SIZE = 65536;

int main(int argc, char *argv[]) {
    if (argc < 3){
        cerr << "Uso: " << argv[0] << " <arquivo_original.wav> <arquivo_modificado.wav>\n";
        return 1;
    }

    SndfileHandle originalFile{argv[1]};
    if(originalFile.error()){
        cerr << "Erro: Arquivo original inválido.\n";
        return 1;
    }

    SndfileHandle modifiedFile{argv[2]};
    if(modifiedFile.error()){
        cerr << "Erro: Arquivo modificado inválido.\n";
        return 1;
    }

    if((originalFile.format() & SF_FORMAT_TYPEMASK) != SF_FORMAT_WAV ||
       (modifiedFile.format() & SF_FORMAT_TYPEMASK) != SF_FORMAT_WAV){
        cerr << "Erro: Os arquivos não estão em formato WAV.\n";
        return 1;
    }

    if(originalFile.channels() != modifiedFile.channels()){
        cerr << "Erro: O número de canais não coincide.\n";
        return 1;
    }

    if(originalFile.frames() != modifiedFile.frames()){
        cerr << "Erro: O número de frames não coincide.\n";
        return 1;
    }

    // Se a profundidade de bits não é a mesma, o cálculo pode ser complicado
    if(originalFile.format() != modifiedFile.format()){
        cerr << "Aviso: A profundidade de bits dos arquivos é diferente. Os resultados podem ser inesperados.\n";
    }

    size_t numChannels = originalFile.channels();
    vector<long double> mseSum(numChannels+1, 0.0);  // +1 para canal médio
    vector<long double> ES_Sum(numChannels+1, 0.0);   // +1 para canal médio
    vector<long double> maxErrors(numChannels+1, 0.0); // +1 para canal médio
    vector<short> originalSamples(FRAMES_BUFFER_SIZE * numChannels);
    vector<short> modifiedSamples(FRAMES_BUFFER_SIZE * numChannels);
    sf_count_t originalFramesRead, modifiedFramesRead;
    size_t totalFrames = 0;

    while((originalFramesRead = originalFile.readf(originalSamples.data(), FRAMES_BUFFER_SIZE)) > 0 &&
          (modifiedFramesRead = modifiedFile.readf(modifiedSamples.data(), FRAMES_BUFFER_SIZE)) > 0){
        
        // Assegurar que ambos os arquivos leram o mesmo número de frames no último bloco
        sf_count_t framesToProcess = min(originalFramesRead, modifiedFramesRead);
        totalFrames += framesToProcess;

        for (size_t i = 0; i < static_cast<size_t>(framesToProcess); ++i) {
            // Calcular a média do frame atual
            long double originalMean = 0.0;
            long double modifiedMean = 0.0;
            
            for (size_t j = 0; j < numChannels; ++j) {
                size_t index = i * numChannels + j;
                long double originalSample = static_cast<long double>(originalSamples[index]);
                long double modifiedSample = static_cast<long double>(modifiedSamples[index]);
                
                // Métricas por canal individual
                ES_Sum[j] += originalSample * originalSample;
                long double diff = originalSample - modifiedSample;
                long double currentAbsoluteError = abs(diff);
                if (currentAbsoluteError > maxErrors[j]) {
                    maxErrors[j] = currentAbsoluteError;
                }
                mseSum[j] += diff * diff;
                
                // Acumular para a média do frame
                originalMean += originalSample;
                modifiedMean += modifiedSample;
            }
            
            // Calcular a média do frame
            originalMean /= numChannels;
            modifiedMean /= numChannels;
            
            // Métricas para o canal médio
            ES_Sum[numChannels] += originalMean * originalMean;
            long double diffMean = originalMean - modifiedMean;
            long double currentAbsoluteErrorMean = abs(diffMean);
            if (currentAbsoluteErrorMean > maxErrors[numChannels]) {
                maxErrors[numChannels] = currentAbsoluteErrorMean;
            }
            mseSum[numChannels] += diffMean * diffMean;
        }
    }

    cout << "Número de frames processados: " << totalFrames << "\n";
    if (totalFrames == 0) {
        cerr << "Erro: Nenhum frame foi processado. Os arquivos podem estar vazios.\n";
        return 1;
    }

    // Resultados por canal individual
    for (size_t j = 0; j < numChannels; ++j) {
        long double mse = mseSum[j] / totalFrames;
        long double es = ES_Sum[j] / totalFrames;
        long double snr = (es == 0.0) ? INFINITY : 10.0 * log10(es / mse);
        cout << "SNR canal " << j << ": " << snr << " dB\n";
        cout << "MSE canal " << j << ": " << mse << "\n";
        cout << "Erro máximo canal " << j << ": " << maxErrors[j] << "\n";
    }

    // Resultados para o canal médio
    long double mseMean = mseSum[numChannels] / totalFrames;
    long double esMean = ES_Sum[numChannels] / totalFrames;
    long double snrMean = (esMean == 0.0) ? INFINITY : 10.0 * log10(esMean / mseMean);
    cout << "SNR canal médio: " << snrMean << " dB\n";
    cout << "MSE canal médio: " << mseMean << "\n";
    cout << "Erro máximo canal médio: " << maxErrors[numChannels] << "\n";

    return 0;
}