// src/01_extract_header.cpp
#include <iostream>
#include <fstream>
#include <vector>
#include <cstdint>
#include <string>

int main() {
    const std::string input_path = "data/model.safetensors";
    const std::string output_path = "output/header.json";

    std::ifstream file(input_path, std::ios::binary);
    if (!file.is_open()) {
        std::cerr << "[Erro] Nao foi possivel abrir: " << input_path << std::endl;
        return 1;
    }

    // 1. Ler o tamanho do cabeçalho (primeiros 8 bytes - uint64)
    uint64_t header_size = 0;
    file.read(reinterpret_cast<char*>(&header_size), sizeof(header_size));

    std::cout << "--- Passo 1: Extracao de Header ---" << std::endl;
    std::cout << "Tamanho do Cabecalho: " << header_size << " bytes." << std::endl;

    // 2. Ler o JSON
    std::vector<char> buffer(header_size);
    file.read(buffer.data(), header_size);

    // 3. Guardar em ficheiro
    std::ofstream out_file(output_path);
    out_file.write(buffer.data(), header_size);
    out_file.close();

    std::cout << "JSON guardado em: " << output_path << std::endl;
    std::cout << "Verifique o campo 'dtype' no ficheiro JSON." << std::endl;

    return 0;
}