#include <iostream>
#include <string>
#include <vector>
#include "Golomb.h" // Inclui a classe que acabámos de criar

using namespace std;

// Função de teste
void test_codec(Golomb& g, int m, const vector<int>& values, const string& mode_name) {
    cout << "-----------------------------------------\n";
    cout << "Testando Golomb m=" << m << " (Modo: " << mode_name << ")\n";
    cout << "-----------------------------------------\n";

    string full_bitstream;
    
    // --- Teste de Codificação ---
    cout << "Codificando valores:\n";
    for (int val : values) {
        try {
            string bits = g.encode(val);
            cout << "  Valor: " << val << "\t-> Bits: " << bits << "\n";
            full_bitstream += bits;
        } catch (const exception& e) {
            cerr << "  Erro ao codificar " << val << ": " << e.what() << "\n";
        }
    }
    cout << "Stream de bits completo: " << full_bitstream << "\n\n";

    // --- Teste de Descodificação ---
    cout << "Descodificando stream:\n";
    size_t index = 0;
    for (size_t i = 0; i < values.size(); ++i) {
        try {
            int decoded_val = g.decode(full_bitstream, index);
            cout << "  Lido valor: " << decoded_val;
            if (decoded_val == values[i]) {
                cout << " (Correto)\n";
            } else {
                cout << " (ERRO! Esperado: " << values[i] << ")\n";
            }
        } catch (const exception& e) {
            cerr << "  Erro ao descodificar: " << e.what() << "\n";
            break; 
        }
    }
    cout << "-----------------------------------------\n\n";
}

int main() {
    // Valores de teste
    vector<int> test_values = {0, 1, -1, 2, -2, 5, -10, 20};

    try {
        // Teste 1: m=4 (potência de 2), modo Interleaving
        Golomb g_rice(4, SignHandling::INTERLEAVING);
        test_codec(g_rice, 4, test_values, "Interleaving (Golomb-Rice)");

        // Teste 2: m=5 (não potência de 2), modo Interleaving
        Golomb g_interleaving(5, SignHandling::INTERLEAVING);
        test_codec(g_interleaving, 5, test_values, "Interleaving (Golomb Genérico)");

        // Teste 3: m=4 (potência de 2), modo Sign+Magnitude
        Golomb g_rice_signmag(4, SignHandling::SIGN_MAGNITUDE);
        test_codec(g_rice_signmag, 4, test_values, "Sign+Magnitude (Golomb-Rice)");

        // Teste 4: m=5 (não potência de 2), modo Sign+Magnitude
        Golomb g_signmag(5, SignHandling::SIGN_MAGNITUDE);
        test_codec(g_signmag, 5, test_values, "Sign+Magnitude (Golomb Genérico)");

    } catch (const exception& e) {
        cerr << "Erro fatal: " << e.what() << endl;
        return 1;
    }

    return 0;
}