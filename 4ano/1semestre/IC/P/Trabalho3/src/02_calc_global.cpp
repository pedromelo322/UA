// src/02_calc_global.cpp
#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <cstdint>

// Função auxiliar de Entropia de Shannon
double calc_entropy(const std::vector<uint64_t>& counts, uint64_t total) {
    double entropy = 0.0;
    for (const auto& c : counts) {
        if (c > 0) {
            double p = static_cast<double>(c) / total;
            entropy -= p * std::log2(p);
        }
    }
    return entropy;
}

int main() {
    const std::string input_path = "data/model.safetensors";
    std::ifstream file(input_path, std::ios::binary);
    if (!file.is_open()) return 1;

    // Saltar cabeçalho (Ler tamanho e fazer seek)
    uint64_t header_size = 0;
    file.read(reinterpret_cast<char*>(&header_size), sizeof(header_size));
    file.seekg(8 + header_size, std::ios::beg);

    std::cout << "--- Passo 2: Analise Global (Baseline) ---" << std::endl;
    
    // Histogramas
    std::vector<uint64_t> counts(256, 0);
    // Matriz para entropia condicional [anterior][atual]
    std::vector<std::vector<uint64_t>> joint_counts(256, std::vector<uint64_t>(256, 0));
    
    const size_t BUFFER_SIZE = 1024 * 1024;
    std::vector<char> buffer(BUFFER_SIZE);
    
    uint64_t total_bytes = 0;
    uint64_t total_pairs = 0;
    int last_byte = -1;

    while (file.read(buffer.data(), BUFFER_SIZE) || file.gcount() > 0) {
        size_t n = file.gcount();
        for (size_t i = 0; i < n; ++i) {
            unsigned char byte = static_cast<unsigned char>(buffer[i]);
            
            counts[byte]++;
            
            if (last_byte != -1) {
                joint_counts[last_byte][byte]++;
                total_pairs++;
            }
            last_byte = byte;
            total_bytes++;
        }
    }

    // 1. Entropia Global H(X)
    double h_global = calc_entropy(counts, total_bytes);
    std::cout << "Entropia Global H(X): " << h_global << " bits/byte" << std::endl;

    // 2. Entropia Condicional H(X|Y)
    double h_cond = 0.0;
    for (int y = 0; y < 256; ++y) {
        if (counts[y] == 0) continue;
        double p_y = static_cast<double>(counts[y]) / total_pairs; // Prob do contexto
        
        // H(X | Y=y)
        double h_given_y = 0.0;
        for (int x = 0; x < 256; ++x) {
            if (joint_counts[y][x] > 0) {
                double p_xy = static_cast<double>(joint_counts[y][x]) / counts[y];
                h_given_y -= p_xy * std::log2(p_xy);
            }
        }
        h_cond += p_y * h_given_y;
    }

    std::cout << "Entropia Condicional H(X|Previous): " << h_cond << " bits/byte" << std::endl;
    return 0;
}