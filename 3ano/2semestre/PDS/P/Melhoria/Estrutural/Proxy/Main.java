package Proxy;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println("--- A inicializar a galeria de imagens (usando Proxies) ---");
        
        // Criar proxies é rápido e não carrega as imagens
        List<IImage> gallery = new ArrayList<>();
        gallery.add(new ImageProxy("foto_ferias_2023.jpg"));
        gallery.add(new ImageProxy("relatorio_graficos.png"));
        gallery.add(new ImageProxy("logo_empresa.svg"));

        System.out.println("\nGaleria inicializada. Nenhuma imagem foi carregada do disco ainda.");
        System.out.println("------------------------------------------------------------");

        // O utilizador decide ver a primeira imagem
        System.out.println("\nUtilizador pede para ver a primeira imagem...");
        gallery.get(0).display(); // O carregamento real acontece aqui!

        System.out.println("\nUtilizador pede para ver a primeira imagem NOVAMENTE...");
        gallery.get(0).display(); // Agora não deve carregar, apenas exibir.

        System.out.println("\nUtilizador decide ver a terceira imagem...");
        gallery.get(2).display(); // Carrega a terceira imagem.
    }
}