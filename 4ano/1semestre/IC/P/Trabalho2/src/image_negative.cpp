#include <opencv2/opencv.hpp>
#include <iostream>

/*
g++ negativo.cpp -o negativo `pkg-config --cflags --libs opencv4`
./negativo imagens\ PPM/airplane.ppm negative.jpg view
*/

// Função principal que cria o negativo de uma imagem
int main(int argc, char** argv) {
    // Verificação dos argumentos de linha de comando
    if (argc < 3) {    
        std::cerr << "Uso: " << argv[0] << " <arquivo_entrada> <arquivo_saida> [view]" << std::endl;
        return 1;
    }

    std::string inputFile = argv[1];
    std::string outputFile = argv[2];
    bool viewImage = (argc >= 4 && std::string(argv[3]) == "view");

    // Leitura da imagem de entrada
    cv::Mat img = cv::imread(inputFile);
    if (img.empty()) {
        std::cerr << "Não foi possível abrir a imagem: " << inputFile << std::endl;
        return -1;
    }

    // Criação da matriz para a imagem negativa
    cv::Mat negative(img.rows, img.cols, img.type());
    // Iteração sobre os píxeis para calcular o negativo
    for (int i = 0; i < img.rows; ++i) {
        for (int j = 0; j < img.cols; ++j) {
            // Obtenção da cor do píxel original
            cv::Vec3b color = img.at<cv::Vec3b>(i, j);
            cv::Vec3b negColor;
            // Cálculo do negativo para cada canal (B, G, R)
            negColor[0] = 255 - color[0];
            negColor[1] = 255 - color[1];
            negColor[2] = 255 - color[2];
            negative.at<cv::Vec3b>(i, j) = negColor;
        }
    }

    // Salvamento da imagem negativa
    if (!cv::imwrite(outputFile, negative)) {
        std::cerr << "Erro ao salvar a imagem: " << outputFile << std::endl;
        return -1;
    }

    // Exibição opcional da imagem
    if (viewImage) {
        cv::imshow("Imagem Negativa", negative);
        cv::waitKey(0);
    }

    std::cout << "Imagem negativa salva como: " << outputFile << std::endl;

    return 0;
}