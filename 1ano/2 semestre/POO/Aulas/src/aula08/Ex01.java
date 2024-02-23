package aula08;
import java.util.ArrayList;
import java.util.Objects;


interface KmPercorridosInterface {
    void trajeto(int quilometros);
    int ultimoTrajeto();
    int distanciaTotal();
}

abstract class veiculo implements KmPercorridosInterface{


    ArrayList<Integer> trajeto = new ArrayList<>();
    int total;
    String matricula;
    String marca;
    String modelo;
    int potencia;

    public void trajeto(int quilometros){
        trajeto.add(quilometros);
        total += quilometros;
    }

    public int ultimoTrajeto(){
        return trajeto.get(trajeto.size() - 1);
    }

    public int distanciaTotal(){

        return total;


    }


    public veiculo(String matricula, String marca, String modelo, int potencia) {
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
        this.potencia = potencia;
    }


    public ArrayList<Integer> getTrajeto() {
        return this.trajeto;
    }

    public void setTrajeto(ArrayList<Integer> trajeto) {
        this.trajeto = trajeto;
    }

    public int getTotal() {
        return this.total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getMatricula() {
        return this.matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getMarca() {
        return this.marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return this.modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getPotencia() {
        return this.potencia;
    }

    public void setPotencia(int potencia) {
        this.potencia = potencia;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof veiculo)) {
            return false;
        }
        veiculo veiculo = (veiculo) o;
        return Objects.equals(matricula, veiculo.matricula) && Objects.equals(marca, veiculo.marca) && Objects.equals(modelo, veiculo.modelo) && potencia == veiculo.potencia;
    }

    @Override
    public int hashCode() {
        return Objects.hash(matricula, marca, modelo, potencia);
    }


    @Override
    public String toString() {
        return "{" +
            " trajeto='" + getTrajeto() + "'" +
            ", total='" + getTotal() + "'" +
            ", matricula='" + getMatricula() + "'" +
            ", marca='" + getMarca() + "'" +
            ", modelo='" + getModelo() + "'" +
            ", potencia='" + getPotencia() + "'" +
            "}";
    }

    

}


enum TipoMotociclo{

    Desportivo, Estrada

}


class Motociclo extends veiculo{

    TipoMotociclo tipo;

    public Motociclo(TipoMotociclo tipo, String matricula, String marca, String modelo, int potencia) {
        super(matricula, marca, modelo, potencia);
        this.tipo = tipo;
    }

    public TipoMotociclo getTipo() {
        return this.tipo;
    }

    public void setTipo(TipoMotociclo tipo) {
        this.tipo = tipo;
    }

    public Motociclo tipo(TipoMotociclo tipo) {
        setTipo(tipo);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Motociclo)) {
            return false;
        }

        if (!super.equals(o)) {
            return false;
        }

        Motociclo motociclo = (Motociclo) o;
        return Objects.equals(tipo, motociclo.tipo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), this.tipo);
    }

    @Override
    public String toString() {
        return "{" + super.toString() +
            " tipo='" + getTipo() + "'" +
            "}";
    }


}

class AutomovelLigeiro extends veiculo{

    int numeroQuadro;
    double capacidadeBagageira;



    public AutomovelLigeiro(int numeroQuadro,double capacidadeBagageira, String matricula, String marca, String modelo, int potencia) {
        super(matricula, marca, modelo, potencia);
        this.numeroQuadro = numeroQuadro;
        this.capacidadeBagageira = capacidadeBagageira;
    }

    public int getNumeroQuadro() {
        return this.numeroQuadro;
    }

    public void setNumeroQuadro(int numeroQuadro) {
        this.numeroQuadro = numeroQuadro;
    }

    public double getCapacidadeBagageira() {
        return this.capacidadeBagageira;
    }

    public void setCapacidadeBagageira(double capacidadeBagageira) {
        this.capacidadeBagageira = capacidadeBagageira;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof AutomovelLigeiro)) {
            return false;
        }

        if (!super.equals(o)) {
            return false;
        }

        AutomovelLigeiro automovelLigeiro = (AutomovelLigeiro) o;
        return numeroQuadro == automovelLigeiro.numeroQuadro && capacidadeBagageira == automovelLigeiro.capacidadeBagageira;
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), numeroQuadro, capacidadeBagageira);
    }

    @Override
    public String toString() {
        return "{" + super.toString() +
            " numeroQuadro='" + getNumeroQuadro() + "'" +
            ", capacidadeBagageira='" + getCapacidadeBagageira() + "'" +
            "}";
    }


}

class Taxi extends AutomovelLigeiro{

    int numeroLicenca;



    public Taxi(int numeroLicenca, int numeroQuadro, double capacidadeBagageira, String matricula, String marca, String modelo, int potencia) {
        super(numeroQuadro, capacidadeBagageira, matricula, marca, modelo, potencia);
        this.numeroLicenca = numeroLicenca;
    }

    public int getNumeroLicenca() {
        return this.numeroLicenca;
    }

    public void setNumeroLicenca(int numeroLicenca) {
        this.numeroLicenca = numeroLicenca;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Taxi)) {
            return false;
        }

        if(!super.equals(o)){
            return false;
        }

        Taxi taxi = (Taxi) o;
        return numeroLicenca == taxi.numeroLicenca;
    }

    @Override
    public int hashCode() {
        int prime = 31;
        int result = super.hashCode();
        result = prime * result + Objects.hashCode(numeroLicenca);
        return result;
    }

    @Override
    public String toString() {
        return "{" + super.toString() +
            " numeroLicenca='" + getNumeroLicenca() + "'" +
            "}";
    }

}


class PesadoMercadorias extends veiculo{

    int numeroQuadro;
    double peso;


    public PesadoMercadorias(int numeroQuadro, double peso, String matricula, String marca, String modelo, int potencia) {
        super(matricula, marca, modelo, potencia);
        this.numeroQuadro = numeroQuadro;
        this.peso = peso;
    }

    public int getNumeroQuadro() {
        return this.numeroQuadro;
    }

    public void setNumeroQuadro(int numeroQuadro) {
        this.numeroQuadro = numeroQuadro;
    }

    public double getPeso() {
        return this.peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof PesadoMercadorias)) {
            return false;
        }
        PesadoMercadorias pesadoMercadorias = (PesadoMercadorias) o;
        return numeroQuadro == pesadoMercadorias.numeroQuadro && peso == pesadoMercadorias.peso;
    }

    @Override
    public int hashCode() {
        return Objects.hash(numeroQuadro, peso);
    }

    @Override
    public String toString() {
        return "{" + super.toString() +
            " numeroQuadro='" + getNumeroQuadro() + "'" +
            ", peso='" + getPeso() + "'" +
            "}";
    }

}

class PesadoPassageiros extends veiculo{

    int numeroQuadro;
    double peso;
    int numeroMaxPassageiros;



    public PesadoPassageiros(int numeroQuadro, double peso, int numeroMaxPassageiros, String matricula, String marca, String modelo, int potencia) {
        super(matricula, marca, modelo, potencia);
        this.numeroQuadro = numeroQuadro;
        this.peso = peso;
        this.numeroMaxPassageiros = numeroMaxPassageiros;
    }

    public int getNumeroQuadro() {
        return this.numeroQuadro;
    }

    public void setNumeroQuadro(int numeroQuadro) {
        this.numeroQuadro = numeroQuadro;
    }

    public double getPeso() {
        return this.peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public int getNumeroMaxPassageiros() {
        return this.numeroMaxPassageiros;
    }

    public void setNumeroMaxPassageiros(int numeroMaxPassageiros) {
        this.numeroMaxPassageiros = numeroMaxPassageiros;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof PesadoPassageiros)) {
            return false;
        }
        PesadoPassageiros pesadoPassageiros = (PesadoPassageiros) o;
        return numeroQuadro == pesadoPassageiros.numeroQuadro && peso == pesadoPassageiros.peso && numeroMaxPassageiros == pesadoPassageiros.numeroMaxPassageiros;
    }

    @Override
    public int hashCode() {
        return Objects.hash(numeroQuadro, peso, numeroMaxPassageiros);
    }

    @Override
    public String toString() {
        return "{" + super.toString() +
            " numeroQuadro='" + getNumeroQuadro() + "'" +
            ", peso='" + getPeso() + "'" +
            ", numeroMaxPassageiros='" + getNumeroMaxPassageiros() + "'" +
            "}";
    }


}


class EmpresaAluguerViaturas{

    String nome;
    String codigoPostal;
    String email;
    veiculo[] veiculos = new veiculo[20];


    public EmpresaAluguerViaturas(String nome, String codigoPostal, String email) {
        this.nome = nome;

        if (CodigoPostalValido(codigoPostal)){
            this.codigoPostal = codigoPostal;
        }


        if (EmailValido(email)){
            this.email = email;
        }
    }


    boolean CodigoPostalValido(String CodigoPostalRcb){
    

        if (CodigoPostalRcb != null){
        
            if(CodigoPostalRcb.matches("\\d{4}-\\d{3}")){

                return true;

            }else{
                return false;
            }
        }else{
            return false;
        }

    }


    boolean EmailValido(String EmailRcb){
    

        if (EmailRcb != null){
        
            if(EmailRcb.matches("\\w+@\\w+\\.[a-zA-Z]+")){

                return true;

            }else{
                return false;
            }
        }else{
            return false;
        }

    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCodigoPostal() {
        return this.codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public veiculo[] getVeiculos() {
        return this.veiculos;
    }

    public void setVeiculos(veiculo[] veiculos) {
        this.veiculos = veiculos;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof EmpresaAluguerViaturas)) {
            return false;
        }
        EmpresaAluguerViaturas empresaAluguerViaturas = (EmpresaAluguerViaturas) o;
        return Objects.equals(nome, empresaAluguerViaturas.nome) && Objects.equals(codigoPostal, empresaAluguerViaturas.codigoPostal) && Objects.equals(email, empresaAluguerViaturas.email) && Objects.equals(veiculos, empresaAluguerViaturas.veiculos);
    }

    @Override
    public int hashCode() {
        return Objects.hash(nome, codigoPostal, email, veiculos);
    }

    @Override
    public String toString() {
        return "{" +
            " nome='" + getNome() + "'" +
            ", codigoPostal='" + getCodigoPostal() + "'" +
            ", email='" + getEmail() + "'" +
            ", veiculos='" + getVeiculos() + "'" +
            "}";
    }

}



public class Ex01 {
    public static void main(String[] args) {
        // Criar uma empresa
        EmpresaAluguerViaturas empresa = new EmpresaAluguerViaturas("Empresa ABC", "1234-567", "empresa@abc.com");

        // Criar veículos e adicioná-los à empresa
        Motociclo motociclo = new Motociclo(TipoMotociclo.Desportivo, "AB-12-34", "Marca A", "Modelo X", 100);
        empresa.getVeiculos()[0] = motociclo;

        AutomovelLigeiro automovelLigeiro = new AutomovelLigeiro(12345, 500.0, "CD-56-78", "Marca B", "Modelo Y", 150);
        empresa.getVeiculos()[1] = automovelLigeiro;


        Taxi taxi = new Taxi(1000, 12345, 400.0, "EF-90-12", "Marca C", "Modelo Z", 200);
        empresa.getVeiculos()[2] = taxi;

        PesadoMercadorias pesadoMercadorias = new PesadoMercadorias(54321, 5000.0, "GH-34-56", "Marca D", "Modelo W", 300);
        empresa.getVeiculos()[3] = pesadoMercadorias;

        PesadoPassageiros pesadoPassageiros = new PesadoPassageiros(54321, 5000.0, 50, "IJ-78-90", "Marca E", "Modelo V", 400);
        empresa.getVeiculos()[4] = pesadoPassageiros;

        // Testar métodos
        System.out.println("Nome da empresa: " + empresa.getNome());
        System.out.println("Código Postal da empresa: " + empresa.getCodigoPostal());
        System.out.println("Email da empresa: " + empresa.getEmail());

        for (veiculo v : empresa.getVeiculos()) {
            if (v != null) {
                System.out.println(v.getClass().toGenericString() + " = " + v.toString());
            }
        }

        // Adicionar trajetos gradualmente
        motociclo.trajeto(100);
        System.out.println("Último trajeto do motociclo: " + motociclo.ultimoTrajeto());

        automovelLigeiro.trajeto(100);
        System.out.println("Último trajeto do automóvel ligeiro: " + automovelLigeiro.ultimoTrajeto());

        automovelLigeiro.trajeto(100);
        System.out.println("Último trajeto do automóvel ligeiro: " + automovelLigeiro.ultimoTrajeto());

        taxi.trajeto(100);
        System.out.println("Último trajeto do taxi: " + taxi.ultimoTrajeto());

        taxi.trajeto(100);
        System.out.println("Último trajeto do taxi: " + taxi.ultimoTrajeto());

        taxi.trajeto(100);
        System.out.println("Último trajeto do taxi: " + taxi.ultimoTrajeto());

        pesadoMercadorias.trajeto(100);
        System.out.println("Último trajeto do pesado de mercadorias: " + pesadoMercadorias.ultimoTrajeto());

        pesadoMercadorias.trajeto(100);
        System.out.println("Último trajeto do pesado de mercadorias: " + pesadoMercadorias.ultimoTrajeto());

        pesadoMercadorias.trajeto(100);
        System.out.println("Último trajeto do pesado de mercadorias: " + pesadoMercadorias.ultimoTrajeto());

        pesadoMercadorias.trajeto(100);
        System.out.println("Último trajeto do pesado de mercadorias: " + pesadoMercadorias.ultimoTrajeto());

        pesadoPassageiros.trajeto(100);
        System.out.println("Último trajeto do pesado de passageiros: " + pesadoPassageiros.ultimoTrajeto());

        pesadoPassageiros.trajeto(100);
        System.out.println("Último trajeto do pesado de passageiros: " + pesadoPassageiros.ultimoTrajeto());

        pesadoPassageiros.trajeto(100);
        System.out.println("Último trajeto do pesado de passageiros: " + pesadoPassageiros.ultimoTrajeto());

        pesadoPassageiros.trajeto(100);
        System.out.println("Último trajeto do pesado de passageiros: " + pesadoPassageiros.ultimoTrajeto());


        System.out.println("Último trajeto do motociclo: " + motociclo.ultimoTrajeto());
        System.out.println("Distância total percorrida pelo automóvel ligeiro: " + automovelLigeiro.distanciaTotal());

        // Encontrar veículo com maior quilômetros percorridos
        veiculo veiculoComMaiorKm = null;
        int maiorKm = 0;
        for (veiculo v : empresa.getVeiculos()) {
            if (v != null && v.distanciaTotal() > maiorKm) {
                veiculoComMaiorKm = v;
                maiorKm = v.distanciaTotal();
            }
        }

        if (veiculoComMaiorKm != null) {
            System.out.println("Veículo com maior quilômetros percorridos: " + veiculoComMaiorKm.getClass().toGenericString() + " = " + veiculoComMaiorKm.toString());
        }
    }
}

