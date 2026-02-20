#include <opencv2/opencv.hpp>
#include <iostream>
#include <string>
#include <stdexcept> // Para std::invalid_argument e std::out_of_range

using namespace cv;
using namespace std;

// Função principal que roda uma imagem por múltiplos de 90 graus
int main(int argc, char** argv) {
    // Verificação dos argumentos de linha de comando
    if (argc != 4) {
        cerr << "Uso: " << argv[0] << " <imagem_entrada> <imagem_saida> <angulo>\n";
        cerr << "     angulo: Qualquer múltiplo de 90 (positivo, negativo ou zero).\n";
        return -1;
    }

    string inputFile = argv[1];
    string outputFile = argv[2];
    int angle = 0;

    // Conversão do ângulo com tratamento de erros
    try {
        angle = stoi(argv[3]);
    } catch (const invalid_argument& e) {
        cerr << "Erro: Ângulo inválido. Deve ser um número inteiro.\n";
        return -1;
    } catch (const out_of_range& e) {
        cerr << "Erro: Ângulo fora do intervalo permitido.\n";
        return -1;
    }

    // Validação se o ângulo é múltiplo de 90
    if (angle % 90 != 0) {
        cerr << "Erro: Ângulo inválido. Deve ser um múltiplo de 90 (e.g., -180, 0, 90, 270).\n";
        return -1;
    }

    // Normalização do ângulo para valores entre 0 e 270
    int normalized_angle = (angle % 360 + 360) % 360;

    // Leitura da imagem de entrada
    Mat img = imread(inputFile, IMREAD_COLOR);
    if (img.empty()) {
        cerr << "Erro: Não foi possível abrir a imagem '" << inputFile << "'.\n";
        return -1;
    }

    int inRows = img.rows;
    int inCols = img.cols;
    Mat rotatedImage; // Matriz para a imagem rodada.

    cout << "A rodar a imagem " << angle << " graus (equivalente a " << normalized_angle << " graus horário)...\n";

    // Determinação do tamanho da imagem de saída e criação da matriz
    if (normalized_angle == 90 || normalized_angle == 270) {
        rotatedImage.create(inCols, inRows, img.type());
    } else { // normalized_angle == 0 || normalized_angle == 180
        rotatedImage.create(inRows, inCols, img.type());
    }

    // Caso especial para rotação de 0 graus
    if (normalized_angle == 0) {
        // Se o ângulo for 0, a imagem rodada é uma cópia da original
        img.copyTo(rotatedImage);
    } else {
        // Iteração sobre os píxeis da imagem de saída para calcular a origem
        for (int r = 0; r < rotatedImage.rows; ++r) {
            for (int c = 0; c < rotatedImage.cols; ++c) {
                Vec3b sourcePixel;
                // Cálculo das coordenadas do píxel de origem baseado no ângulo normalizado
                switch (normalized_angle) {
                    case 90:
                        sourcePixel = img.at<Vec3b>(inRows - 1 - c, r);
                        break;
                    case 180:
                        sourcePixel = img.at<Vec3b>(inRows - 1 - r, inCols - 1 - c);
                        break;
                    case 270:
                        sourcePixel = img.at<Vec3b>(c, inCols - 1 - r);
                        break;
                    // O caso 0 já foi tratado.
                }
                // Atribuição da cor do píxel de origem ao píxel de destino
                rotatedImage.at<Vec3b>(r, c) = sourcePixel;
            }
        }
    }

    // Tentativa de guardar a imagem rodada
    if (imwrite(outputFile, rotatedImage)) {
        cout << "Imagem rodada guardada com sucesso em '" << outputFile << "'\n";
    } else {
        cerr << "Erro: Não foi possível guardar a imagem em '" << outputFile << "'.\n";
        return -1;
    }

    return 0;
}