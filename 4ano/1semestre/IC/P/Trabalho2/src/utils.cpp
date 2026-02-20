#include "utils.h"
#include <fstream>
#include <iostream>
#include <limits>
#include <cmath>

using namespace std;

// Função que converte um inteiro para uma string binária com um número específico de bits
string int_to_binary_string(unsigned int n, int num_bits) {
    if (num_bits == 0) return "";
    string binary_str;
    binary_str.reserve(num_bits);
    for (int i = num_bits - 1; i >= 0; --i) {
        binary_str += ((n >> i) & 1) ? '1' : '0';
    }
    return binary_str;
}

// Função que converte uma string binária para um inteiro, lendo um número específico de bits a partir de um índice
unsigned int binary_string_to_int(const string& bits, size_t& index, int num_bits) {
    if (index + num_bits > bits.length()) {
        throw std::runtime_error("Erro de descodificação: Fim inesperado (a ler m do bloco).");
    }
    if (num_bits == 0) return 0;
    
    unsigned int value = 0;
    for (int i = 0; i < num_bits; ++i) {
        value = (value << 1) | ((bits[index + i] == '1') ? 1 : 0);
    }
    index += num_bits; 
    return value;
}

// Função que calcula o valor ótimo de m para codificação Golomb baseado nos resíduos
int calculate_optimal_m(const vector<int>& residuals) {
    if (residuals.empty()) return 1;

    double sum = 0.0;
    for (int res : residuals) {
        sum += (res >= 0) ? (2.0 * res) : (2.0 * abs(res) - 1.0);
    }
    double mean = sum / residuals.size();

    if (mean < 1.0) return 1; 


    int m = static_cast<int>(round(mean * log(2)));


    if (m <= 0) m = 1;
    
    return m;
}

// Função que realiza predição linear simples para compressão de imagem
int predict(int a, int b, int c) {
    if (c >= max(a, b)) return min(a, b);
    else if (c <= min(a, b)) return max(a, b);
    else return a + b - c;
}

// Função que lê uma imagem PPM colorida e converte para grayscale
bool readPPMtoGray(const string& filename, Image& img) {

    // abrir ficheiro
    ifstream in(filename, ios::binary);
    if (!in.is_open()) {
        cerr << "Erro: não foi possível abrir " << filename << endl;
        return false;
    }

    // ler cabeçalho PPM
    string magic;
    in >> magic;
    if (magic != "P6") {
        cerr << "Erro: só está suportado PPM binário (P6). Encontrado: " << magic << endl;
        return false;
    }

    // Ignorar comentários
    while (in.peek() == '#') in.ignore(numeric_limits<streamsize>::max(), '\n');

    // ler largura, altura, maxval
    in >> img.width >> img.height >> img.maxval;
    in.get(); 

    if (img.width <= 0 || img.height <= 0) {    
        cerr << "Erro: dimensões inválidas no ficheiro PPM\n";
        return false;
    }
    if (img.maxval <= 0 || img.maxval > 255) {
        cerr << "Aviso: maxval fora de 1..255 — será tratado como 255\n";
        img.maxval = 255;
    }

    img.channels = 1; 
    img.data.assign(img.height, vector<int>(img.width, 0)); 

    for (int y = 0; y < img.height; ++y) {
        for (int x = 0; x < img.width; ++x) {
            unsigned char rgb[3]; 
            in.read(reinterpret_cast<char*>(rgb), 3); 
            if (!in) {
                cerr << "Erro: leitura PPM truncada\n";
                return false;
            }

            double yval = 0.299 * rgb[0] + 0.587 * rgb[1] + 0.114 * rgb[2];
            int iv = static_cast<int>(round(yval)); 

            // garantir dentro de [0, maxval]
            if (iv < 0) iv = 0; 
            if (iv > img.maxval) iv = img.maxval;

            // armazenar valor grayscale
            img.data[y][x] = iv;
        }
    }

    in.close();
    return true;
}

// Função que escreve uma imagem grayscale como PPM colorida (replicando o canal)
bool writeGrayAsPPM(const string& filename, const Image& img) {
    if (img.width <= 0 || img.height <= 0 || img.data.empty()) {
        cerr << "Erro: imagem inválida para escrita\n";
        return false;
    }

    ofstream out(filename, ios::binary);
    if (!out.is_open()) {
        cerr << "Erro: não foi possível criar " << filename << endl;
        return false;
    }


    out << "P6\n" << img.width << " " << img.height << "\n" << img.maxval << "\n";

    for (int y = 0; y < img.height; ++y) {
        for (int x = 0; x < img.width; ++x) {
            unsigned char v = static_cast<unsigned char>(img.data[y][x]);
            out.write(reinterpret_cast<const char*>(&v), 1);
            out.write(reinterpret_cast<const char*>(&v), 1);
            out.write(reinterpret_cast<const char*>(&v), 1);
        }
    }

    out.close();
    return true;
}