// src/03_analyze_split.cpp
#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <cstdint>
#include <string>

void save_csv(const std::string& path, const std::vector<uint64_t>& counts) {
    std::ofstream f(path);
    f << "Byte,Frequency\n";
    for (int i = 0; i < 256; ++i) {
        f << i << "," << counts[i] << "\n";
    }
    std::cout << "CSV salvo: " << path << std::endl;
}

double calc_entropy(const std::vector<uint64_t>& counts, uint64_t total) {
    double ent = 0.0;
    for (auto c : counts) {
        if (c > 0) {
            double p = (double)c / total;
            ent -= p * std::log2(p);
        }
    }
    return ent;
}

int main() {
    const std::string input_path = "data/model.safetensors";
    std::ifstream file(input_path, std::ios::binary);
    if (!file.is_open()) return 1;

    uint64_t header_size = 0;
    file.read(reinterpret_cast<char*>(&header_size), sizeof(header_size));
    file.seekg(8 + header_size, std::ios::beg);

    std::cout << "--- Passo 3: Analise Split (BF16) ---" << std::endl;

    std::vector<uint64_t> lsb_counts(256, 0); // Mantissa
    std::vector<uint64_t> msb_counts(256, 0); // Expoente
    uint64_t total_pairs = 0;

    const size_t BUFFER_SIZE = 1024 * 1024;
    std::vector<char> buffer(BUFFER_SIZE);

    while (file.read(buffer.data(), BUFFER_SIZE) || file.gcount() > 0) {
        size_t n = file.gcount();
        size_t pairs = n / 2; 
        
        for (size_t i = 0; i < pairs * 2; i += 2) {
            unsigned char lsb = (unsigned char)buffer[i];
            unsigned char msb = (unsigned char)buffer[i+1];
            
            lsb_counts[lsb]++;
            msb_counts[msb]++;
            total_pairs++;
        }
    }

    double h_lsb = calc_entropy(lsb_counts, total_pairs);
    double h_msb = calc_entropy(msb_counts, total_pairs);

    std::cout << "Entropia LSB (Ruido): " << h_lsb << " bits/byte" << std::endl;
    std::cout << "Entropia MSB (Estrutura): " << h_msb << " bits/byte" << std::endl;
    std::cout << "Media (Split): " << (h_lsb + h_msb)/2.0 << " bits/byte" << std::endl;

    // Exportar dados para gráficos do relatório
    save_csv("output/hist_lsb.csv", lsb_counts);
    save_csv("output/hist_msb.csv", msb_counts);

    return 0;
}