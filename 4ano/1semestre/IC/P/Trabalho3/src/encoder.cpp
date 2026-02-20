#include <iostream>
#include <fstream>
#include <vector>
#include <cstdint>
#include <cmath>
#include <queue>
#include <map>
#include <memory>
#include <bitset>
#include <iomanip>
#include <string>
#include <cstring>
#include <algorithm>
#include <thread>
#include <future>

// Configurações
const size_t BLOCK_SIZE = 1024 * 1024; // 1 MB por bloco

// ==========================================
// MÓDULO 1: HUFFMAN (modo Fast)
// ==========================================
struct Node {
    uint8_t symbol;
    uint64_t freq;
    std::shared_ptr<Node> left, right;
    Node(uint8_t s, uint64_t f) : symbol(s), freq(f) {}
    Node(uint64_t f, std::shared_ptr<Node> l, std::shared_ptr<Node> r) : symbol(0), freq(f), left(l), right(r) {}
};
struct CompareNode {
    bool operator()(const std::shared_ptr<Node>& a, const std::shared_ptr<Node>& b) { return a->freq > b->freq; }
};

class HuffmanCodec {
    struct Code { uint32_t bits; uint8_t len; };
    Code table[256];
public:
    std::vector<uint32_t> frequencies;
    // array de frequências para 256 símbolos, todos iniciados em 0
    HuffmanCodec() : frequencies(256, 0) {}

    void build(const std::vector<uint8_t>& data) {
        // para cada byte em data, incrementar a frequência correspondente
        std::fill(frequencies.begin(), frequencies.end(), 0);
        for (uint8_t b : data) frequencies[b]++;
        
        // reordena os simbolos por orden de ocorrência e constroi a árvore de Huffman
        std::priority_queue<std::shared_ptr<Node>, std::vector<std::shared_ptr<Node>>, CompareNode> pq;
        for (int i = 0; i < 256; ++i) if (frequencies[i] > 0) pq.push(std::make_shared<Node>((uint8_t)i, frequencies[i]));
        
        if (pq.empty()) return;
        if (pq.size() == 1) { table[pq.top()->symbol] = {0, 1}; return; }
        
        // construir a árvore
        while (pq.size() > 1) {
            auto l = pq.top(); pq.pop(); auto r = pq.top(); pq.pop();
            pq.push(std::make_shared<Node>(l->freq + r->freq, l, r));
        }
        // contém só a raiz da árvore
        gen_lut(pq.top(), 0, 0);
    }

    std::vector<uint8_t> compress(const std::vector<uint8_t>& data) {
        std::vector<uint8_t> out; out.reserve(data.size());
        for (uint32_t f : frequencies) {
            // escrever frequências como 4 bytes little-endian
            out.push_back(f & 0xFF); out.push_back((f >> 8) & 0xFF);
            out.push_back((f >> 16) & 0xFF); out.push_back((f >> 24) & 0xFF);
        }
        // bc = bit counter do buf
        uint64_t buf = 0; int bc = 0;
        for (uint8_t s : data) {
            // obtem o codigo e comprimento do simbolo
            Code c = table[s];
            // concatena no buffer (101 + 101 = 10101)
            buf = (buf << c.len) | c.bits; bc += c.len;
            // escrever bytes completos no output file
            while (bc >= 8) { bc -= 8; out.push_back((buf >> bc) & 0xFF); }
        }
        if (bc > 0) out.push_back((buf << (8 - bc)) & 0xFF);
        return out;
    }
private:
    // gera códigos recursivamente para os nós folha da árvore
    void gen_lut(std::shared_ptr<Node> n, uint32_t c, uint8_t l) {
        if (!n) return;
        if (!n->left && !n->right) { table[n->symbol] = {c, l}; return; }
        gen_lut(n->left, c << 1, l + 1); gen_lut(n->right, (c << 1) | 1, l + 1);
    }
};

// ==========================================
// MÓDULO AUXILIAR: ARITMÉTICA (Modo Best)
// ==========================================

class ArithmeticEncoder {
    static constexpr uint32_t MAX_VAL = 0xFFFFFFFF;
    static constexpr uint32_t HALF = 0x80000000U;
    static constexpr uint32_t QUARTER = 0x40000000U;
    
public:
    std::vector<uint32_t> frequencies;
    
private:
    std::vector<uint64_t> cumulative_freq;
    
    // Buffer grande para minimizar realocações
    std::vector<uint8_t> output;
    uint64_t bit_buffer;
    int bits_in_buffer;
    
public:
    ArithmeticEncoder() : frequencies(256, 0), cumulative_freq(257, 0), bit_buffer(0), bits_in_buffer(0) {}

    void build(const std::vector<uint8_t>& data) {
        // Reset com Laplace smoothing
        std::fill(frequencies.begin(), frequencies.end(), 1);
        
        // Contagem com unrolling manual para melhor vectorização
        const size_t n = data.size();
        const uint8_t* ptr = data.data();
        
        // Processar em blocos de 4 para melhor cache locality
        size_t i = 0;
        for (; i + 4 <= n; i += 4) {
            frequencies[ptr[i]]++;
            frequencies[ptr[i+1]]++;
            frequencies[ptr[i+2]]++;
            frequencies[ptr[i+3]]++;
        }
        for (; i < n; ++i) {
            frequencies[ptr[i]]++;
        }
        
        // Calcular cumulativas
        uint64_t total = 0;
        for (int j = 0; j < 256; ++j) {
            cumulative_freq[j] = total;
            total += frequencies[j];
        }
        cumulative_freq[256] = total;
    }

    std::vector<uint8_t> compress(const std::vector<uint8_t>& data) {
        // Pre-alocar output generosamente
        output.clear();
        output.reserve(1024 + data.size());
        
        // Escrever tabela de frequências (1024 bytes)
        output.resize(1024);
        memcpy(output.data(), frequencies.data(), 1024);
        
        // Reset buffer state
        bit_buffer = 0;
        bits_in_buffer = 0;
        
        uint32_t low = 0, high = MAX_VAL;
        uint64_t pending = 0;
        const uint64_t total = cumulative_freq[256];
        const size_t n = data.size();
        const uint8_t* ptr = data.data();
        
        for (size_t i = 0; i < n; ++i) {
            const uint8_t s = ptr[i];
            const uint64_t range = (uint64_t)(high - low) + 1;
            const uint64_t sym_low = cumulative_freq[s];
            const uint64_t sym_high = cumulative_freq[s + 1];
            
            high = low + (uint32_t)((range * sym_high) / total) - 1;
            low = low + (uint32_t)((range * sym_low) / total);
            
            // Renormalização otimizada
            while (true) {
                if ((high ^ low) < HALF) {
                    // MSB iguais - output bit
                    int bit = high >> 31;
                    output_bits(bit, pending);
                    pending = 0;
                } else if (low >= QUARTER && high < (QUARTER * 3)) {
                    // Underflow - acumular pending
                    pending++;
                    low -= QUARTER;
                    high -= QUARTER;
                } else {
                    break;
                }
                low <<= 1;
                high = (high << 1) | 1;
            }
        }
        
        // Finalizar - garantir que valor final está no intervalo
        pending++;
        if (low < QUARTER) {
            output_bits(0, pending);
        } else {
            output_bits(1, pending);
        }
        
        // Flush final
        if (bits_in_buffer > 0) {
            output.push_back(static_cast<uint8_t>(bit_buffer << (8 - bits_in_buffer)));
        }
        
        return std::move(output);
    }
    
private:
    // Output um bit seguido de pending bits invertidos
    inline void output_bits(int bit, uint64_t pending) {
        // Escrever bit principal
        bit_buffer = (bit_buffer << 1) | bit;
        bits_in_buffer++;
        
        // Escrever pending bits (invertidos)
        int inv_bit = bit ^ 1;
        while (pending > 0) {
            bit_buffer = (bit_buffer << 1) | inv_bit;
            bits_in_buffer++;
            pending--;
            
            // Flush quando buffer cheio
            if (bits_in_buffer >= 8) {
                bits_in_buffer -= 8;
                output.push_back(static_cast<uint8_t>(bit_buffer >> bits_in_buffer));
            }
        }
        
        // Flush quando buffer cheio
        if (bits_in_buffer >= 8) {
            bits_in_buffer -= 8;
            output.push_back(static_cast<uint8_t>(bit_buffer >> bits_in_buffer));
        }
    }
};


// ==========================================
// MAIN LOOP
// ==========================================
int main(int argc, char* argv[]) {
    if (argc < 3) {
        std::cout << "Uso: ./encoder_core <input> <output> [mode: fast|best]" << std::endl;
        return 1;
    }
    std::string in_p = argv[1], out_p = argv[2], mode = (argc > 3) ? argv[3] : "fast";
    bool use_best = (mode == "best");

    std::ifstream in(in_p, std::ios::binary); std::ofstream out(out_p, std::ios::binary);
    if (!in || !out) return 1;

    // 1. Header Global
    uint64_t h_sz = 0; in.read((char*)&h_sz, 8); out.write((char*)&h_sz, 8);
    std::vector<char> h_json(h_sz); in.read(h_json.data(), h_sz); out.write(h_json.data(), h_sz);

    // 2. Gravar Flag Global de Modo
    // 0 = Fast (Huffman + LSB Raw), 1 = Best (Arithmetic)
    uint8_t mode_flag = use_best ? 1 : 0;
    out.write((char*)&mode_flag, 1);

    std::cout << "Modo: " << (use_best ? "BEST (Arithmetic MSB+LSB paralelo)" : "FAST (Huffman + LSB Raw)") << std::endl;

    std::vector<char> buf(BLOCK_SIZE);
    std::vector<uint8_t> msb, lsb;
    msb.reserve(BLOCK_SIZE / 2);
    lsb.reserve(BLOCK_SIZE / 2);
    
    uint64_t tin = 0, tout = 0;
    tout += 8 + h_sz + 1; // Contabilizar header
    int blk = 0;

    while (in.read(buf.data(), BLOCK_SIZE) || in.gcount() > 0) {
        size_t n = in.gcount(), pairs = n / 2;
        
        // Separação MSB/LSB otimizada com acesso sequencial
        msb.resize(pairs);
        lsb.resize(pairs);
        const char* src = buf.data();
        uint8_t* lsb_ptr = lsb.data();
        uint8_t* msb_ptr = msb.data();
        
        for (size_t i = 0; i < pairs; ++i) {
            lsb_ptr[i] = static_cast<uint8_t>(src[i * 2]);
            msb_ptr[i] = static_cast<uint8_t>(src[i * 2 + 1]);
        }

        std::vector<uint8_t> msb_enc, lsb_final;
        
        if (use_best) {
            // Modo best: Arithmetic para MSB e LSB (paralelo)
            auto msb_future = std::async(std::launch::async, [&msb]() {
                ArithmeticEncoder arith;
                arith.build(msb);
                return arith.compress(msb);
            });
            
            auto lsb_future = std::async(std::launch::async, [&lsb]() {
                ArithmeticEncoder arith;
                arith.build(lsb);
                return arith.compress(lsb);
            });
            
            msb_enc = msb_future.get();
            lsb_final = lsb_future.get();
        } else {
            // Modo fast: Huffman para MSB, raw para LSB
            HuffmanCodec hc;
            hc.build(msb);
            msb_enc = hc.compress(msb);
            lsb_final = std::move(lsb);
        }

        // Empacotar
        uint32_t sz_m = msb_enc.size(), sz_l = lsb_final.size();
        out.write((char*)&sz_m, 4); out.write((char*)&sz_l, 4);
        out.write((char*)msb_enc.data(), sz_m); out.write((char*)lsb_final.data(), sz_l);

        tin += n; tout += (8 + sz_m + sz_l);
        if (++blk % 50 == 0) std::cout << "\rBloco " << blk << " Ratio: " << std::fixed << std::setprecision(2) << (double)tin/tout << ":1" << std::flush;
    }
    std::cout << "\nFinal: " << tout / (1024.0*1024.0) << " MB. Ratio: " << std::fixed << std::setprecision(3) << (double)tin/tout << ":1" << std::endl;
    return 0;
}