#ifndef GOLOMB_H
#define GOLOMB_H

#include <string>
#include <vector>
#include <cmath>
#include <stdexcept> 

enum class SignHandling {
    SIGN_MAGNITUDE, 
    INTERLEAVING    
};

class Golomb {
public:
    /**
     * @brief Construtor da classe Golomb.
     * @param m O parâmetro 'm' do código Golomb (m > 0).
     * [cite_start]@param mode A estratégia para lidar com números negativos[cite: 678, 679].
     */
    Golomb(int m_param, SignHandling mode_param);

    /**
     * @brief Codifica um inteiro (positivo ou negativo) numa string de bits.
     * @param n O inteiro a codificar.
     * @return Uma std::string contendo '0's e '1's representando o código.
     */
    std::string encode(int n);

    /**
     * @brief Descodifica uma sequência de bits, lendo a partir de um índice.
     * @param bits A string de bits de onde ler.
     * @param index O índice (passado por referência) onde a leitura deve começar.
     * @return O inteiro descodificado.
     */
    int decode(const std::string& bits, size_t& index);

private:
    // --- Mapeamento de negativos ---
    unsigned int map_negative(int n, int& sign_bit);
    int unmap_negative(unsigned int u, int sign_bit);

    // --- Codificação/Descodificação de não-negativos ---
    std::string encode_unsigned(unsigned int i);
    unsigned int decode_unsigned(const std::string& bits, size_t& index);

    // --- Funções auxiliares de bits ---
    std::string int_to_binary_string(unsigned int n, int num_bits);
    unsigned int binary_string_to_int(const std::string& bits, size_t index, int num_bits);

    // --- Parâmetros do código ---
    int m;
    SignHandling mode;
    int b;              // Parâmetro b = ⌈log₂ m⌉
    bool isPowerOfTwo;  // Flag para otimização se m for potência de 2
};

#endif // GOLOMB_H