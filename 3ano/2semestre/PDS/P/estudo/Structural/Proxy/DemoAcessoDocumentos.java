package Structural.Proxy;

// Interface comum para o documento (Subject)
interface Documento {
    String getNomeArquivo();
    String lerConteudo();
    void editarConteudo(String novoConteudo); // Pode ou não ser permitido pelo proxy
}







class ProxyDocumentoConfidencial implements Documento{

    private String documentName;
    private Usuario usuario; 
    private DocumentoConfidencialReal documento;


    @Override
    public String getNomeArquivo(){
        return this.documentName;
    }


    @Override
    public String lerConteudo(){

        if (usuario.getPermissao() != null){
            return documento.lerConteudo();
        }


        System.out.println("Não tem acesso de Leitura");

        return null;
    }


    @Override
    public void editarConteudo(String novoConteudo){
        
        if (usuario.getPermissao() == NivelPermissao.ADMIN || usuario.getPermissao() == NivelPermissao.EDICAO){
            documento.editarConteudo(novoConteudo);
        }else{
            System.out.println("Não tem acesso de edição");
        }

        

    }


    public ProxyDocumentoConfidencial(String documentName, Usuario usuario){
        this.documentName = documentName;
        this.usuario = usuario;
        this.documento = new DocumentoConfidencialReal(documentName);
    }


}



// O objeto real (RealSubject)
class DocumentoConfidencialReal implements Documento {
    private String nomeArquivo;
    private String conteudo;

    public DocumentoConfidencialReal(String nomeArquivo) {
        this.nomeArquivo = nomeArquivo;
        this.conteudo = carregarConteudoDoArquivo(nomeArquivo); // Operação potencialmente custosa
        System.out.println("DocumentoConfidencialReal: Conteúdo de '" + nomeArquivo + "' carregado.");
    }

    private String carregarConteudoDoArquivo(String nome) {
        // Simula o carregamento de um arquivo
        return "Este é o conteúdo super secreto do arquivo: " + nome;
    }

    @Override
    public String getNomeArquivo() {
        return nomeArquivo;
    }

    @Override
    public String lerConteudo() {
        System.out.println("DocumentoConfidencialReal: Acessando conteúdo de '" + nomeArquivo + "'.");
        return conteudo;
    }

    @Override
    public void editarConteudo(String novoConteudo) {
        System.out.println("DocumentoConfidencialReal: Editando conteúdo de '" + nomeArquivo + "'.");
        this.conteudo = novoConteudo;
    }
}


enum NivelPermissao {
    LEITURA, EDICAO, ADMIN
}

class Usuario {
    private String nome;
    private NivelPermissao permissao;

    public Usuario(String nome, NivelPermissao permissao) {
        this.nome = nome;
        this.permissao = permissao;
    }

    public String getNome() { return nome; }
    public NivelPermissao getPermissao() { return permissao; }
}



// (Supondo que você criou a interface Documento, a classe DocumentoConfidencialReal,
// o enum NivelPermissao, a classe Usuario, e a sua classe ProxyDocumentoConfidencial)

public class DemoAcessoDocumentos {

    public static void main(String[] args) {
        // Usuários com diferentes níveis de permissão
        Usuario usuarioLeitura = new Usuario("Leitor inquisitive", NivelPermissao.LEITURA);
        Usuario usuarioEditor = new Usuario("Editor Chefe", NivelPermissao.EDICAO);
        Usuario usuarioAdmin = new Usuario("Admin Sys", NivelPermissao.ADMIN);

        String nomeDoArquivoConfidencial = "planos_secretos.txt";

        System.out.println("--- Cenário 1: Usuário com Permissão de LEITURA ---");
        // O cliente recebe o Proxy, não o objeto real diretamente.
        // O Proxy precisa do usuário para verificar permissões.
        Documento docParaLeitor = new ProxyDocumentoConfidencial(nomeDoArquivoConfidencial, usuarioLeitura);

        System.out.println("Leitor tentando ler o conteúdo:");
        System.out.println("Conteúdo: " + docParaLeitor.lerConteudo()); // Deve funcionar

        System.out.println("\nLeitor tentando editar o conteúdo:");
        docParaLeitor.editarConteudo("Tentativa de alteração maliciosa."); // Não deve funcionar, proxy deve bloquear
        System.out.println("Conteúdo após tentativa de edição do leitor: " + docParaLeitor.lerConteudo()); // Deve mostrar conteúdo original

        System.out.println("\n\n--- Cenário 2: Usuário com Permissão de EDIÇÃO ---");
        Documento docParaEditor = new ProxyDocumentoConfidencial(nomeDoArquivoConfidencial, usuarioEditor);

        System.out.println("Editor lendo o conteúdo inicial:");
        System.out.println("Conteúdo: " + docParaEditor.lerConteudo()); // Deve funcionar (e criar DocumentoReal se for lazy)

        System.out.println("\nEditor editando o conteúdo:");
        String novoConteudo = "Os planos foram atualizados com sucesso pelo editor.";
        docParaEditor.editarConteudo(novoConteudo); // Deve funcionar
        System.out.println("Conteúdo após edição do editor: " + docParaEditor.lerConteudo()); // Deve mostrar novo conteúdo

        System.out.println("\n\n--- Cenário 3: Verificando Lazy Loading (se implementado) ---");
        // Se você implementou lazy loading, o DocumentoConfidencialReal só deve ser
        // instanciado quando lerConteudo() ou editarConteudo() é chamado pela primeira vez.
        // O Proxy pode ser criado sem instanciar o RealSubject imediatamente.
        System.out.println("Criando proxy para 'relatorio_anual.doc' para Admin (sem acesso ainda)...");
        Documento docLazy = new ProxyDocumentoConfidencial("relatorio_anual.doc", usuarioAdmin);
        System.out.println("Proxy criado. Documento real já foi carregado? (Verifique os logs do construtor de DocumentoConfidencialReal)");
        System.out.println("Admin acessando o conteúdo do relatório anual pela primeira vez:");
        docLazy.lerConteudo(); // É aqui que o DocumentoConfidencialReal seria criado se for lazy.

        // Verificando se o objeto real é o mesmo para o mesmo arquivo (se o proxy o gerencia)
        // (Este teste é mais complexo e depende de como você implementa o cache do RealSubject no Proxy,
        // se o proxy não recria o RealSubject toda vez que um novo proxy é criado para o mesmo arquivo)
        // Para este exercício, é suficiente que cada proxy controle o acesso ao seu RealSubject.
    }
}