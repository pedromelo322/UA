#include <iostream>
#include <vector>
#include <string>
#include <sndfile.hh>

using namespace std;
constexpr size_t FRAMES_BUFFER_SIZE = 65536;

int main(int argc, char *argv[]) {
    if (argc != 4) {
        cerr << "Uso: " << argv[0] << " <ficheiro_original.wav> <ficheiro_processado.wav> <ficheiro_erro_saida.wav>\n";
        cerr << "     Calcula a diferença (erro) entre dois ficheiros de áudio e guarda o resultado.\n";
        return 1;
    }

    const string originalFile = argv[1];
    const string processedFile = argv[2];
    const string errorFile = argv[3];

    // --- Abertura e Validação dos Ficheiros de Entrada ---

    // Abre o ficheiro de áudio original.
    SndfileHandle sfhOriginal { originalFile };
    if (sfhOriginal.error()) {
        cerr << "Erro: Não foi possível abrir o ficheiro original '" << originalFile << "'\n";
        return 1;
    }

    // Abre o ficheiro de áudio processado.
    SndfileHandle sfhProcessed { processedFile };
    if (sfhProcessed.error()) {
        cerr << "Erro: Não foi possível abrir o ficheiro processado '" << processedFile << "'\n";
        return 1;
    }

    // --- Verificação de Compatibilidade ---

    // Garante que os ficheiros têm as mesmas propriedades (canais, taxa de amostragem e duração).
    if (sfhOriginal.channels() != sfhProcessed.channels() ||
        sfhOriginal.samplerate() != sfhProcessed.samplerate() ||
        sfhOriginal.frames() != sfhProcessed.frames()) {
        
        cerr << "Erro: Os ficheiros de entrada não são compatíveis (diferem em número de canais, taxa de amostragem ou duração).\n";
        return 1;
    }

    // --- Preparação do Ficheiro de Saída ---

    // Cria o ficheiro de saída para o sinal de erro, com as mesmas propriedades dos ficheiros de entrada.
    SndfileHandle sfhErrorOut { errorFile, SFM_WRITE, sfhOriginal.format(),
                                sfhOriginal.channels(), sfhOriginal.samplerate() };
    if (sfhErrorOut.error()) {
        cerr << "Erro: Não foi possível criar o ficheiro de saída '" << errorFile << "'\n";
        return 1;
    }

    // --- Processamento em Blocos ---

    int numChannels = sfhOriginal.channels();
    vector<short> samplesOriginal(FRAMES_BUFFER_SIZE * numChannels);
    vector<short> samplesProcessed(FRAMES_BUFFER_SIZE * numChannels);
    vector<short> samplesError(FRAMES_BUFFER_SIZE * numChannels);
    size_t nFrames;

    cout << "A gerar o ficheiro de erro...\n";

    // Lê os ficheiros em blocos até ao final.
    while ((nFrames = sfhOriginal.readf(samplesOriginal.data(), FRAMES_BUFFER_SIZE))) {
        // Ajusta o tamanho do vetor para o número de frames realmente lidas.
        samplesOriginal.resize(nFrames * numChannels);

        // Lê o bloco correspondente do ficheiro processado.
        sfhProcessed.readf(samplesProcessed.data(), nFrames);
        samplesProcessed.resize(nFrames * numChannels);

        // Ajusta o tamanho do vetor de erro.
        samplesError.resize(nFrames * numChannels);

        // Calcula a diferença amostra a amostra.
        for (size_t i = 0; i < samplesOriginal.size(); i++) {
            samplesError[i] = samplesOriginal[i] - samplesProcessed[i];
        }

        // Escreve o bloco de amostras de erro no ficheiro de saída.
        sfhErrorOut.writef(samplesError.data(), nFrames);
    }

    cout << "Ficheiro de erro '" << errorFile << "' gerado com sucesso.\n";

    return 0;
}