#include <opencv2/opencv.hpp>
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc, char** argv)
{
    if (argc != 4) {
        cout << "Uso: " << argv[0] << " <imagem_entrada> <imagem_saida> <numero_canal>\n";
        cout << "Canais: 0 = Azul, 1 = Verde, 2 = Vermelho\n";
        return -1;
    }

    string inputFile = argv[1];
    string outputFile = argv[2];
    int channel = atoi(argv[3]);

    if (channel < 0 || channel > 2) {
        cerr << "Erro: o canal deve ser 0 (Azul), 1 (Verde) ou 2 (Vermelho).\n";
        return -1;
    }

    // Lê a imagem
    Mat img = imread(inputFile, IMREAD_COLOR);
    if (img.empty()) {
        cerr << "Erro: não foi possível abrir a imagem.\n";
        return -1;
    }

    int height = img.rows;
    int width = img.cols;

    // Cria uma imagem de um único canal
    Mat singleChannel(height, width, CV_8UC1);

    // Percorre pixel a pixel
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            Vec3b pixel = img.at<Vec3b>(i, j);
            singleChannel.at<uchar>(i, j) = pixel[channel];
        }
    }

    // Salva o resultado
    bool success = imwrite(outputFile, singleChannel);

    if (success) {
        cout << "Canal " << channel << " extraído e salvo como '" << outputFile << "'\n";
    } else {
        // Se falhou, imprime uma mensagem de erro no cerr e retorna um código de erro
        cerr << "Erro: Não foi possível guardar a imagem em '" << outputFile << "'. Verifique as permissões ou o formato do ficheiro.\n";
        return -1; // Retorna erro
    }

    return 0;
}
