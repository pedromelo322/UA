#include <iostream>
#include <fstream>
#include <vector>
#include <cstdint>
#include <cmath>
#include <queue>
#include <memory>
#include <algorithm>
#include <cstring>
#include <iomanip>
#include <functional>
#include <thread>
#include <future>

// ==========================================
// DECODER HUFFMAN OTIMIZADO COM LUT
// ==========================================
// Usa tabela de lookup para descodificar até 12 bits de uma vez

class HuffmanDecoder {
    static constexpr int LUT_BITS = 12;  // Tamanho da LUT (4096 entradas)
    static constexpr int LUT_SIZE = 1 << LUT_BITS;
    
    struct LUTEntry {
        uint8_t symbol;   // Símbolo descodificado
        uint8_t bits;     // Número de bits consumidos (0 = código mais longo que LUT_BITS)
    };
    
    std::vector<LUTEntry> lut;
    
    // Para códigos mais longos que LUT_BITS, usamos árvore tradicional
    struct Node {
        uint8_t symbol;
        bool is_leaf;
        int left, right;  // Índices na pool de nós
    };
    std::vector<Node> nodes;
    int root_idx;
    bool single_symbol;
    uint8_t single_sym;

public:
    HuffmanDecoder() : lut(LUT_SIZE), single_symbol(false) {}

    void rebuild(const std::vector<uint32_t>& frequencies) {
        // 1. Construir árvore de Huffman e extrair códigos
        struct BuildNode {
            uint64_t freq;
            int idx;
            bool operator>(const BuildNode& o) const { return freq > o.freq; }
        };
        
        nodes.clear();
        std::priority_queue<BuildNode, std::vector<BuildNode>, std::greater<BuildNode>> pq;
        
        // Criar nós folha
        for (int i = 0; i < 256; ++i) {
            if (frequencies[i] > 0) {
                int idx = nodes.size();
                nodes.push_back({(uint8_t)i, true, -1, -1});
                pq.push({frequencies[i], idx});
            }
        }
        
        if (pq.empty()) { root_idx = -1; return; }
        
        // Caso especial: único símbolo
        if (pq.size() == 1) {
            single_symbol = true;
            single_sym = nodes[pq.top().idx].symbol;
            root_idx = pq.top().idx;
            return;
        }
        single_symbol = false;
        
        // Construir árvore
        while (pq.size() > 1) {
            auto l = pq.top(); pq.pop();
            auto r = pq.top(); pq.pop();
            int idx = nodes.size();
            nodes.push_back({0, false, l.idx, r.idx});
            pq.push({l.freq + r.freq, idx});
        }
        root_idx = pq.top().idx;
        
        // 2. Gerar códigos canónicos
        struct CodeInfo { uint8_t symbol; uint32_t code; uint8_t len; };
        std::vector<CodeInfo> codes;
        
        // DFS para extrair códigos
        std::function<void(int, uint32_t, uint8_t)> extract = [&](int idx, uint32_t code, uint8_t len) {
            if (idx < 0) return;
            const Node& n = nodes[idx];
            if (n.is_leaf) {
                codes.push_back({n.symbol, code, len});
                return;
            }
            extract(n.left, code << 1, len + 1);
            extract(n.right, (code << 1) | 1, len + 1);
        };
        extract(root_idx, 0, 0);
        
        // 3. Preencher LUT
        for (auto& e : lut) { e.symbol = 0; e.bits = 0; }
        
        for (const auto& c : codes) {
            if (c.len <= LUT_BITS) {
                // Preencher todas as entradas que começam com este código
                int prefix = c.code << (LUT_BITS - c.len);
                int count = 1 << (LUT_BITS - c.len);
                for (int i = 0; i < count; ++i) {
                    lut[prefix + i] = {c.symbol, c.len};
                }
            }
        }
    }

    void decompress(const std::vector<uint8_t>& in_bits, std::vector<uint8_t>& out_data, size_t original_size) {
        out_data.clear();
        out_data.resize(original_size);
        
        if (original_size == 0 || root_idx < 0) return;
        
        // Caso especial: único símbolo
        if (single_symbol) {
            std::fill(out_data.begin(), out_data.end(), single_sym);
            return;
        }
        
        // Buffer de bits para leitura rápida
        uint64_t bit_buf = 0;
        int bits_in_buf = 0;
        size_t byte_pos = 0;
        size_t out_pos = 0;
        
        // Pré-carregar buffer
        while (bits_in_buf <= 56 && byte_pos < in_bits.size()) {
            bit_buf |= (uint64_t)in_bits[byte_pos++] << (56 - bits_in_buf);
            bits_in_buf += 8;
        }
        
        while (out_pos < original_size) {
            // Extrair LUT_BITS do topo do buffer
            uint32_t lookup = (bit_buf >> (64 - LUT_BITS)) & (LUT_SIZE - 1);
            const LUTEntry& entry = lut[lookup];
            
            if (entry.bits > 0) {
                // Descodificação rápida via LUT
                out_data[out_pos++] = entry.symbol;
                bit_buf <<= entry.bits;
                bits_in_buf -= entry.bits;
            } else {
                // Código mais longo que LUT_BITS - fallback para travessia
                int idx = root_idx;
                while (!nodes[idx].is_leaf) {
                    bool bit = (bit_buf >> 63) & 1;
                    bit_buf <<= 1;
                    bits_in_buf--;
                    idx = bit ? nodes[idx].right : nodes[idx].left;
                    
                    // Recarregar se necessário
                    if (bits_in_buf < 16 && byte_pos < in_bits.size()) {
                        while (bits_in_buf <= 56 && byte_pos < in_bits.size()) {
                            bit_buf |= (uint64_t)in_bits[byte_pos++] << (56 - bits_in_buf);
                            bits_in_buf += 8;
                        }
                    }
                }
                out_data[out_pos++] = nodes[idx].symbol;
            }
            
            // Recarregar buffer
            while (bits_in_buf <= 56 && byte_pos < in_bits.size()) {
                bit_buf |= (uint64_t)in_bits[byte_pos++] << (56 - bits_in_buf);
                bits_in_buf += 8;
            }
        }
    }
};

// ============================================================================
// CLASSE: DESCODIFICADOR ARITMÉTICO OTIMIZADO (Modo Best)
// ============================================================================

/**
 * @brief Descodificador aritmético otimizado com buffer de 64 bits
 * 
 * Otimizações:
 * - Buffer de 64 bits para leitura de bits mais eficiente
 * - Busca binária para encontrar símbolos
 * - Menos branches no loop principal
 * - Acesso direto a ponteiros para frequências cumulativas
 */
class ArithmeticDecoder {
    static constexpr uint64_t MAX_VALUE = 0xFFFFFFFF;
    static constexpr uint64_t ONE_QUARTER = 0x40000000;
    static constexpr uint64_t HALF = 0x80000000;
    static constexpr uint64_t THREE_QUARTERS = 0xC0000000;

public:
    ArithmeticDecoder() : cumulativeFreq(257, 0) {}

    void rebuildModel(const uint8_t* freqTableData) {
        const uint32_t* frequencies = reinterpret_cast<const uint32_t*>(freqTableData);
        uint64_t total = 0;
        for (int i = 0; i < 256; ++i) {
            cumulativeFreq[i] = total;
            total += frequencies[i];
        }
        cumulativeFreq[256] = total;
    }

    std::vector<uint8_t> decode(const uint8_t* data, size_t size, size_t expectedSymbols) {
        std::vector<uint8_t> output(expectedSymbols);
        if (expectedSymbols == 0) return output;

        const uint64_t totalCount = cumulativeFreq[256];
        const uint64_t* cumFreq = cumulativeFreq.data();
        
        // Buffer de 64 bits para leitura eficiente
        uint64_t bitBuffer = 0;
        int bitsInBuffer = 0;
        size_t bytePos = 0;
        
        // Pré-carregar buffer
        while (bitsInBuffer <= 56 && bytePos < size) {
            bitBuffer |= static_cast<uint64_t>(data[bytePos++]) << (56 - bitsInBuffer);
            bitsInBuffer += 8;
        }
        
        // Carregar primeiros 32 bits para value
        uint64_t value = (bitBuffer >> 32) & 0xFFFFFFFF;
        bitBuffer <<= 32;
        bitsInBuffer -= 32;
        
        // Recarregar buffer
        while (bitsInBuffer <= 56 && bytePos < size) {
            bitBuffer |= static_cast<uint64_t>(data[bytePos++]) << (56 - bitsInBuffer);
            bitsInBuffer += 8;
        }

        uint64_t low = 0;
        uint64_t high = MAX_VALUE;
        uint8_t* outPtr = output.data();

        for (size_t i = 0; i < expectedSymbols; ++i) {
            const uint64_t range = high - low + 1;
            const uint64_t scaledValue = ((value - low + 1) * totalCount - 1) / range;

            // Busca binária otimizada
            int sym = 0;
            int lo = 0, hi = 255;
            while (lo < hi) {
                int mid = (lo + hi + 1) >> 1;
                if (cumFreq[mid] <= scaledValue) {
                    lo = mid;
                } else {
                    hi = mid - 1;
                }
            }
            sym = lo;
            outPtr[i] = static_cast<uint8_t>(sym);

            const uint64_t symLow = cumFreq[sym];
            const uint64_t symHigh = cumFreq[sym + 1];

            high = low + (range * symHigh) / totalCount - 1;
            low = low + (range * symLow) / totalCount;

            // Renormalização otimizada
            while (true) {
                if (high < HALF) {
                    // Nada
                } else if (low >= HALF) {
                    value -= HALF;
                    low -= HALF;
                    high -= HALF;
                } else if (low >= ONE_QUARTER && high < THREE_QUARTERS) {
                    value -= ONE_QUARTER;
                    low -= ONE_QUARTER;
                    high -= ONE_QUARTER;
                } else {
                    break;
                }
                
                low <<= 1;
                high = (high << 1) | 1;
                
                // Ler próximo bit do buffer
                value = (value << 1) | ((bitBuffer >> 63) & 1);
                bitBuffer <<= 1;
                bitsInBuffer--;
                
                // Recarregar buffer quando necessário
                if (bitsInBuffer <= 56 && bytePos < size) {
                    bitBuffer |= static_cast<uint64_t>(data[bytePos++]) << (56 - bitsInBuffer);
                    bitsInBuffer += 8;
                }
            }
        }

        return output;
    }

private:
    std::vector<uint64_t> cumulativeFreq;
};


// ==========================================
// MAIN
// ==========================================
int main(int argc, char* argv[]) {
    std::ios_base::sync_with_stdio(false); // Otimização IO

    if (argc < 3) {
        std::cout << "Uso: ./decoder <input.sc> <output.safetensors>" << std::endl;
        return 1;
    }
    std::string in_p = argv[1], out_p = argv[2];

    std::ifstream in(in_p, std::ios::binary); 
    std::ofstream out(out_p, std::ios::binary);
    if (!in || !out) return 1;

    // 1. Ler Header Global
    uint64_t h_sz = 0; in.read((char*)&h_sz, 8); out.write((char*)&h_sz, 8);
    std::vector<char> h_json(h_sz); in.read(h_json.data(), h_sz); out.write(h_json.data(), h_sz);

    // 2. Ler Flag de Modo
    uint8_t mode_flag = 0;
    in.read((char*)&mode_flag, 1);
    bool use_best = (mode_flag == 1);
    
    std::cout << "A descodificar... Modo: " << (use_best ? "BEST (Arithmetic)" : "FAST (Huffman)") << std::endl;

    HuffmanDecoder hd;

    // 3. Loop de Blocos
    while (in.peek() != EOF) {
        uint32_t sz_m = 0, sz_l = 0;
        in.read((char*)&sz_m, 4);
        if (in.eof()) break; 
        in.read((char*)&sz_l, 4);

        // Ler MSB e LSB
        std::vector<uint8_t> msb_packet(sz_m), lsb_packet(sz_l);
        in.read((char*)msb_packet.data(), sz_m);
        in.read((char*)lsb_packet.data(), sz_l);

        // --- Recuperar Tabela de Frequências (1024 bytes) ---
        if (sz_m < 1024) { std::cerr << "Erro: Bloco inválido." << std::endl; return 1; }
        
        std::vector<uint8_t> msb, lsb_decoded;
        size_t num_pairs;
        
        if (use_best) {
            // Modo best: MSB e LSB com Arithmetic (paralelo)
            if (sz_l < 1024) { std::cerr << "Erro: Bloco LSB inválido." << std::endl; return 1; }
            
            // Calcular tamanho original a partir das frequências LSB
            const uint32_t* lsb_freqs = reinterpret_cast<const uint32_t*>(lsb_packet.data());
            uint64_t lsb_total = 0;
            for (int i = 0; i < 256; ++i) lsb_total += lsb_freqs[i];
            num_pairs = lsb_total - 256;  // -256 por causa do Laplace smoothing
            
            // Descodificação paralela de MSB e LSB
            auto msb_future = std::async(std::launch::async, [&]() {
                ArithmeticDecoder arith_msb;
                arith_msb.rebuildModel(msb_packet.data());
                return arith_msb.decode(msb_packet.data() + 1024, sz_m - 1024, num_pairs);
            });
            
            auto lsb_future = std::async(std::launch::async, [&]() {
                ArithmeticDecoder arith_lsb;
                arith_lsb.rebuildModel(lsb_packet.data());
                return arith_lsb.decode(lsb_packet.data() + 1024, sz_l - 1024, num_pairs);
            });
            
            msb = msb_future.get();
            lsb_decoded = lsb_future.get();
        } else {
            lsb_decoded = std::move(lsb_packet);
            num_pairs = lsb_decoded.size();
            
            std::vector<uint32_t> freqs(256);
            memcpy(freqs.data(), msb_packet.data(), 1024);
            hd.rebuild(freqs);
            hd.decompress(std::vector<uint8_t>(msb_packet.begin() + 1024, msb_packet.end()), msb, num_pairs);
        }

        // --- Merge (LSB, MSB, LSB, MSB...) ---
        std::vector<char> buffer(num_pairs * 2);
        char* buf_ptr = buffer.data();
        const uint8_t* lsb_ptr = lsb_decoded.data();
        const uint8_t* msb_ptr = msb.data();
        
        for (size_t i = 0; i < num_pairs; ++i) {
            buf_ptr[i * 2] = static_cast<char>(lsb_ptr[i]);
            buf_ptr[i * 2 + 1] = static_cast<char>(msb_ptr[i]);
        }
        out.write(buffer.data(), buffer.size());
    }

    std::cout << "Concluído." << std::endl;
    return 0;
}