// Inclusão de bibliotecas para entrada/saída, manipulação de ficheiros e cálculos matemáticos
#include <iostream>
#include <fstream>
#include <string>
#include <filesystem>
#include <vector> // Necessário para vector
#include <cmath>  // Necessário para round, log2
#include "utils.h"
#include "Golomb.h"

using namespace std;
namespace fs = std::filesystem;

// Função principal que codifica uma imagem PPM em formato Golomb comprimido
int main(int argc, char** argv) {
    // Verificação dos argumentos de linha de comando
    if (argc != 3) {
        cerr << "Uso: " << argv[0] << " <imagem.ppm> <saida.gol>\n";
        cerr << "     (O 'm' ótimo é calculado automaticamente por bloco)\n";
        return 1;
    }

    string input = argv[1];
    string outArg = argv[2];

    string outputDir = "out/";
    fs::create_directories(outputDir);
    
    
    size_t pos = outArg.find_last_of("/\\");
    string filename = (pos != string::npos) ? outArg.substr(pos + 1) : outArg;
    if (filename.find(".gol") == string::npos) filename += ".gol";
    string outputPath = outputDir + filename;

    // Leitura da imagem PPM e conversão para grayscale
    Image img;
    if (!readPPMtoGray(input, img)) {
        cerr << "Erro: falha a ler/converter PPM -> grayscale\n";
        return 1;
    }

    // Abertura do ficheiro de saída e escrita do cabeçalho
    ofstream fout(outputPath, ios::binary);
    fout.write("GOL1", 4);
    fout.write(reinterpret_cast<const char*>(&img.width), sizeof(img.width));
    fout.write(reinterpret_cast<const char*>(&img.height), sizeof(img.height));
    fout.write(reinterpret_cast<const char*>(&img.maxval), sizeof(img.maxval));
    int channels = 1;
    fout.write(reinterpret_cast<const char*>(&channels), sizeof(channels));

    vector<bool> bitBuffer;
    bitBuffer.reserve(img.width * img.height * 10); // Pre-alocar espaço estimado
    const int blockSize = 16;

    // Ciclo de codificação por blocos: cálculo de resíduos, 'm' ótimo e codificação
    for (int by = 0; by < img.height; by += blockSize) {
        for (int bx = 0; bx < img.width; bx += blockSize) {
            
            vector<int> blockResiduals;
            // Cálculo dos resíduos para o bloco usando predição
            for (int y = by; y < min(by + blockSize, img.height); ++y) {
                for (int x = bx; x < min(bx + blockSize, img.width); ++x) {
                    int a = (x > 0) ? img.data[y][x-1] : 0;
                    int b = (y > 0) ? img.data[y-1][x] : 0;
                    int c = (x > 0 && y > 0) ? img.data[y-1][x-1] : 0;
                    int pred = predict(a, b, c);
                    int residual = img.data[y][x] - pred;
                    blockResiduals.push_back(residual);
                }
            }
            
            // Cálculo do 'm' ótimo para o bloco
            int mToUse = calculate_optimal_m(blockResiduals);
            
            // Converter m para bits e adicionar ao buffer
            for (int i = 15; i >= 0; --i) {
                bitBuffer.push_back((mToUse >> i) & 1);
            }
            
            Golomb golomb(mToUse, SignHandling::INTERLEAVING);
            for (int res : blockResiduals) {
                string encoded = golomb.encode(res);
                for (char c : encoded) {
                    bitBuffer.push_back(c == '1');
                }
            }
        }
    }

    // Escrever bits como bytes
    size_t i = 0;
    while (i + 8 <= bitBuffer.size()) {
        uint8_t byte = 0;
        for (int j = 0; j < 8; ++j) {
            byte = (byte << 1) | (bitBuffer[i++] ? 1 : 0);
        }
        fout.write(reinterpret_cast<const char*>(&byte), 1);
    }
    // Padding dos bits restantes
    if (i < bitBuffer.size()) {
        uint8_t byte = 0;
        int shift = 7;
        while (i < bitBuffer.size()) {
            byte |= (bitBuffer[i++] ? 1 : 0) << shift--;
        }
        fout.write(reinterpret_cast<const char*>(&byte), 1);
    }

    fout.close();
    cout << "Imagem codificada (m adaptativo) e escrita em '" << outputPath << "'\n";
    return 0;
}