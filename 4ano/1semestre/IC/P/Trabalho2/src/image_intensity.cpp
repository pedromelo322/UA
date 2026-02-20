#include <opencv2/opencv.hpp>
#include <iostream>
#include <string>
#include <stdexcept> // Para std::invalid_argument e std::out_of_range
#include <algorithm> // Para std::max e std::min
#include <cmath>     // Para std::round

using namespace cv;
using namespace std;

// Função principal que ajusta a intensidade de uma imagem por percentagem
int main(int argc, char** argv) {
    // Verificação dos argumentos de linha de comando
    if (argc != 4) {
        cerr << "Uso: " << argv[0] << " <imagem_entrada> <imagem_saida> <percentagem_ajuste>\n";
        cerr << "     percentagem_ajuste: inteiro entre -100 e 100 (0 = sem alteração).\n"; // Mensagem atualizada
        return -1;
    }

    string inputFile = argv[1];
    string outputFile = argv[2];
    int percentageValue = 0;

    // Conversão do valor percentual com tratamento de erros
    try {
        percentageValue = stoi(argv[3]);
    } catch (const invalid_argument& e) {
        cerr << "Erro: Valor percentual inválido. Deve ser um número inteiro.\n";
        return -1;
    } catch (const out_of_range& e) {
        cerr << "Erro: Valor percentual fora do intervalo permitido [-100, 100].\n";
        return -1;
    }

    // Validação do intervalo do valor percentual
    if (percentageValue < -100 || percentageValue > 100) {
        cerr << "Erro: Valor percentual fora do intervalo permitido [-100, 100].\n";
        return -1;
    }

    // Mapeamento da percentagem para valor aditivo
    int adjustmentValue = static_cast<int>(round(percentageValue * 2.55));

    // Leitura da imagem de entrada
    Mat img = imread(inputFile, IMREAD_COLOR);
    if (img.empty()) {
        cerr << "Erro: Não foi possível abrir a imagem '" << inputFile << "'.\n";
        return -1;
    }

    // Criação da matriz para a imagem ajustada
    Mat adjustedImage = Mat::zeros(img.size(), img.type());

    cout << "A ajustar a intensidade em " << percentageValue << "% (valor aditivo: " << adjustmentValue << ")...\n"; // Mensagem atualizada

    // Iteração sobre os píxeis para ajustar a intensidade
    for (int r = 0; r < img.rows; ++r) {
        for (int c = 0; c < img.cols; ++c) {
            // Obtenção do píxel original
            Vec3b originalPixel = img.at<Vec3b>(r, c);
            Vec3b adjustedPixel;

            // Ajuste de cada canal de cor
            for (int channel = 0; channel < 3; ++channel) {
                // Cálculo do novo valor com ajuste
                int newValue = originalPixel[channel] + adjustmentValue;

                // Limitação do valor ao intervalo [0, 255]
                adjustedPixel[channel] = saturate_cast<uchar>(newValue);
            }
            // Atribuição do píxel ajustado
            adjustedImage.at<Vec3b>(r, c) = adjustedPixel;
        }
    }

    // Tentativa de guardar a imagem ajustada
    if (imwrite(outputFile, adjustedImage)) {
        cout << "Imagem com intensidade ajustada guardada com sucesso em '" << outputFile << "'\n";
    } else {
        cerr << "Erro: Não foi possível guardar a imagem em '" << outputFile << "'.\n";
        return -1;
    }

    return 0;
}