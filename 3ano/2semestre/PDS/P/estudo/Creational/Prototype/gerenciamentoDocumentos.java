package Creational.Prototype;
import java.util.*;

interface PrototypeCapable extends Cloneable
{
    public PrototypeCapable clone() throws CloneNotSupportedException;
}



class RelatorioMensal implements PrototypeCapable{
    
    private String name = null;
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    @Override
    
    public RelatorioMensal clone() throws CloneNotSupportedException {
        System.out.println("Cloning Album object..");
        return (RelatorioMensal) super.clone();
    }
    
    @Override
    public String toString() {
        return "PropostaProjeto";
    }
}



class PropostaProjeto implements PrototypeCapable{
    
    private String name = null;
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    @Override
    
    public PropostaProjeto clone() throws CloneNotSupportedException {
        System.out.println("Cloning Album object..");
        return (PropostaProjeto) super.clone();
    }
    
    @Override
    public String toString() {
        return "PropostaProjeto";
    }
}



class CartaComercialModelo implements PrototypeCapable{
    
    private String name = null;
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    @Override
    
    public CartaComercialModelo clone() throws CloneNotSupportedException {
        System.out.println("Cloning Album object..");
        return (CartaComercialModelo) super.clone();
    }
    
    @Override
    public String toString() {
        return "CartaComercialModelo";
    }
}




class PrototypeFactory {
    public static enum ModelType{
        PropostaProjeto, RelatorioMensal, CartaComercialModelo;
    }
    private static Map<ModelType, PrototypeCapable> prototypes = new HashMap<>();

    static {
        prototypes.put(ModelType.PropostaProjeto, new PropostaProjeto());
        prototypes.put(ModelType.RelatorioMensal, new RelatorioMensal());
        prototypes.put(ModelType.CartaComercialModelo, new CartaComercialModelo());
    }
    
    
    public static PrototypeCapable getInstance(ModelType s) throws CloneNotSupportedException {
        return (prototypes.get(s)).clone();
    }
}



public class gerenciamentoDocumentos {

    public static void main(String[] args) {
        try {
            // 1. Criando documentos a partir dos protótipos
            System.out.println("==================== CRIANDO DOCUMENTOS A PARTIR DOS PROTÓTIPOS ====================");
            
            // Criando uma carta comercial a partir do protótipo
            CartaComercialModelo cartaComercial1 = (CartaComercialModelo) PrototypeFactory.getInstance(PrototypeFactory.ModelType.CartaComercialModelo);
            cartaComercial1.setName("Carta para Cliente A - Proposta de Serviços");
            System.out.println("Documento criado: " + cartaComercial1.getName());
            
            // Modificando atributos da carta clonada
            System.out.println("\n==================== MODIFICANDO A PRIMEIRA CARTA ====================");
            System.out.println("Modificando o destinatário da carta para 'Empresa ABC Ltda.'");
            System.out.println("Modificando o corpo da carta para incluir desconto especial");
            // Simulando modificações (na implementação real, teríamos mais atributos na classe)
            cartaComercial1.setName(cartaComercial1.getName() + " [MODIFICADA - Destinatário: Empresa ABC Ltda]");
            
            // Exibindo a carta modificada
            System.out.println("\nDocumento modificado: " + cartaComercial1.getName());
            
            // Criando outra carta comercial do mesmo protótipo
            System.out.println("\n==================== CRIANDO UMA SEGUNDA CARTA DO MESMO PROTÓTIPO ====================");
            CartaComercialModelo cartaComercial2 = (CartaComercialModelo) PrototypeFactory.getInstance(PrototypeFactory.ModelType.CartaComercialModelo);
            cartaComercial2.setName("Carta para Cliente B - Proposta de Serviços");
            System.out.println("Nova carta criada: " + cartaComercial2.getName());
            System.out.println("Observe que a segunda carta não herdou as modificações da primeira");
            
            // Demonstração com o Relatório Mensal
            System.out.println("\n==================== DEMONSTRAÇÃO COM RELATÓRIO MENSAL ====================");
            
            // Criando um relatório mensal a partir do protótipo
            RelatorioMensal relatorio1 = (RelatorioMensal) PrototypeFactory.getInstance(PrototypeFactory.ModelType.RelatorioMensal);
            relatorio1.setName("Relatório de Vendas - Janeiro 2023");
            System.out.println("Documento criado: " + relatorio1.getName());
            
            // Modificando atributos do relatório
            System.out.println("\n==================== MODIFICANDO O PRIMEIRO RELATÓRIO ====================");
            System.out.println("Atualizando dados de vendas para incluir região Sul");
            relatorio1.setName(relatorio1.getName() + " [MODIFICADO - Incluída região Sul]");
            System.out.println("Relatório modificado: " + relatorio1.getName());
            
            // Criando outro relatório do mesmo protótipo
            System.out.println("\n==================== CRIANDO UM SEGUNDO RELATÓRIO DO MESMO PROTÓTIPO ====================");
            RelatorioMensal relatorio2 = (RelatorioMensal) PrototypeFactory.getInstance(PrototypeFactory.ModelType.RelatorioMensal);
            relatorio2.setName("Relatório de Vendas - Fevereiro 2023");
            System.out.println("Novo relatório criado: " + relatorio2.getName());
            System.out.println("Observe que o segundo relatório não herdou as modificações do primeiro");
            
            // Demonstrando que os protótipos são clonados, não reutilizados
            System.out.println("\n==================== VERIFICANDO IDENTIDADE DOS OBJETOS ====================");
            System.out.println("cartaComercial1 == cartaComercial2? " + (cartaComercial1 == cartaComercial2));
            System.out.println("relatorio1 == relatorio2? " + (relatorio1 == relatorio2));
            
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
    }
}