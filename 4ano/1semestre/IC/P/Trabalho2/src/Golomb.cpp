#include "Golomb.h"
#include <iostream> // Para debugging (opcional)

Golomb::Golomb(int m_param, SignHandling mode_param) {
    if (m_param <= 0) {
        throw std::invalid_argument("O parâmetro 'm' do Golomb deve ser > 0.");
    }
    m = m_param;
    mode = mode_param;

    // Verifica se 'm' é uma potência de 2 (otimização Golomb-Rice)
    isPowerOfTwo = (m > 0) && ((m & (m - 1)) == 0);

    if (isPowerOfTwo) {
        b = static_cast<int>(std::log2(m));
    } else {
        // b = ⌈log₂ m⌉
        b = static_cast<int>(std::ceil(std::log2(m)));
    }
}

// --- Funções Públicas ---

std::string Golomb::encode(int n) {
    int sign_bit = 0;
    // Mapeia o 'n' (positivo/negativo) para 'i' (não-negativo)
    unsigned int i = map_negative(n, sign_bit); 
    
    std::string encoded_string = encode_unsigned(i);

    if (mode == SignHandling::SIGN_MAGNITUDE) {
        return (sign_bit == 1 ? '1' : '0') + encoded_string;
    }
    
    return encoded_string;
}

int Golomb::decode(const std::string& bits, size_t& index) {
    int sign_bit = 0;
    if (mode == SignHandling::SIGN_MAGNITUDE) {
        if (index >= bits.length()) {
            throw std::runtime_error("Erro de descodificação: Fim inesperado (a ler bit de sinal).");
        }
        sign_bit = (bits[index] == '1') ? 1 : 0;
        index++;
    }

    // Descodifica o 'i' (não-negativo)
    unsigned int i = decode_unsigned(bits, index);
    // Desmapeia 'i' de volta para 'n' (positivo/negativo)
    return unmap_negative(i, sign_bit);
}

// --- Funções Privadas de Mapeamento de Negativos ---

unsigned int Golomb::map_negative(int n, int& sign_bit) {
    if (mode == SignHandling::SIGN_MAGNITUDE) {
        sign_bit = (n < 0) ? 1 : 0;
        return static_cast<unsigned int>(std::abs(n));
    } else { // INTERLEAVING
        // Mapeia 0 -> 0, -1 -> 1, 1 -> 2, -2 -> 3, 2 -> 4, ...
        return (n >= 0) ? (2 * static_cast<unsigned int>(n)) : (2 * static_cast<unsigned int>(std::abs(n)) - 1);
    }
}

int Golomb::unmap_negative(unsigned int i, int sign_bit) {
    if (mode == SignHandling::SIGN_MAGNITUDE) {
        return (sign_bit == 1) ? -static_cast<int>(i) : static_cast<int>(i);
    } else { // INTERLEAVING
        // Desmapeia 0 -> 0, 1 -> -1, 2 -> 1, 3 -> -2, 4 -> 2, ...
        if (i % 2 == 0) {
            return static_cast<int>(i / 2); // Par -> Positivo ou Zero
        } else {
            return -static_cast<int>((i + 1) / 2); // Ímpar -> Negativo
        }
    }
}

// --- Funções Privadas de Codificação/Descodificação (Usando variáveis do documento) ---

std::string Golomb::encode_unsigned(unsigned int i) {
    // 1. Calcular Quociente (q) e Resto (r)
    unsigned int q = i / m;
    unsigned int r = i % m; // (i - q*m)

    std::string quotient_bits;
    std::string remainder_bits;

    // 2. Codificar Quociente (q) em Unário
    quotient_bits.append(q, '1'); // 'q' uns
    quotient_bits += '0';         // Terminador zero

    // 3. Codificar Resto (r) em Binário
    if (isPowerOfTwo) {
        // Caso Golomb-Rice (m = 2^b)
        // O resto usa 'b' bits
        remainder_bits = int_to_binary_string(r, b);
    } else {
        // Caso Golomb genérico ("truncated binary code")
        unsigned int t = (1 << b) - m; // Equivalente a 2^b - m

        if (r < t) {
            // Se r < t, codifica 'r' com b-1 bits
            remainder_bits = int_to_binary_string(r, b - 1);
        } else {
            // Se r >= t, codifica 'r+t' com b bits
            remainder_bits = int_to_binary_string(r + t, b);
        }
    }
    return quotient_bits + remainder_bits;
}

unsigned int Golomb::decode_unsigned(const std::string& bits, size_t& index) {
    // 1. Descodificar Quociente (q) (Unário)
    unsigned int q = 0;
    while (index < bits.length() && bits[index] == '1') {
        q++;
        index++;
    }
    if (index >= bits.length()) { // Atingiu o fim sem encontrar o '0'
        throw std::runtime_error("Erro de descodificação: Fim inesperado (a ler quociente).");
    }
    index++; // Consome o terminador '0'

    // 2. Descodificar Resto (r) (Binário)
    unsigned int r = 0;
    if (isPowerOfTwo) {
        // Caso Golomb-Rice (m = 2^b)
        r = binary_string_to_int(bits, index, b);
        index += b;
    } else {
        // Caso Golomb genérico ("truncated binary code")
        unsigned int t = (1 << b) - m; // Equivalente a 2^b - m

        // Tenta ler os primeiros b-1 bits
        if (b > 1) { // Só lemos b-1 bits se b > 1
             r = binary_string_to_int(bits, index, b - 1);
             index += (b - 1);
        }

        if (r >= t) {
            // Se r >= t, precisamos de ler mais 1 bit
            if (index >= bits.length()) {
                throw std::runtime_error("Erro de descodificação: Fim inesperado (a ler resto).");
            }
            int extra_bit = (bits[index] == '1') ? 1 : 0;
            index++;
            
            // Reconstrói o número de b bits
            r = (r << 1) | extra_bit;
            // Desmapeia
            r = r - t;
        }
    }

    // 3. Reconstruir número 'i'
    return (q * m) + r;
}

// --- Funções Auxiliares de Bits ---

std::string Golomb::int_to_binary_string(unsigned int n, int num_bits) {
    if (num_bits == 0) return "";
    std::string binary_str;
    binary_str.reserve(num_bits);
    for (int i = num_bits - 1; i >= 0; --i) {
        binary_str += ((n >> i) & 1) ? '1' : '0';
    }
    return binary_str;
}

unsigned int Golomb::binary_string_to_int(const std::string& bits, size_t index, int num_bits) {
    if (index + num_bits > bits.length()) {
        throw std::runtime_error("Erro de descodificação: Fim inesperado (a ler bits do resto).");
    }
    if (num_bits == 0) return 0;
    
    unsigned int value = 0;
    for (int i = 0; i < num_bits; ++i) {
        value = (value << 1) | ((bits[index + i] == '1') ? 1 : 0);
    }
    return value;
}