package aula05;



class imovel{

    String localizacao;
    int quartos;
    int preco;
    boolean disponibilidade;


    public imovel() {
    }

    public imovel(String localizacao, int quartos, int preco) {
        this.localizacao = localizacao;
        this.quartos = quartos;
        this.preco = preco;
        this.disponibilidade = true;
    }


    public void setdispolibilidade(boolean disponibilidade) {

        this.disponibilidade = disponibilidade;

    }

    public String getLocalizacao() {
        return this.localizacao;
    }

    public int getQuartos() {
        return this.quartos;
    }

    public int getPreco() {
        return this.preco;
    }

    public boolean getDisponibilidade() {
        return this.disponibilidade;
    }

    public boolean isDisponibilidade() {
        return this.disponibilidade;
    }



    @Override
    public String toString() {
        return "{" +
            " localizacao='" + getLocalizacao() + "'" +
            ", quartos='" + getQuartos() + "'" +
            ", preco='" + getPreco() + "'" +
            ", disponível='" + getDisponibilidade() +"'" +
            "}";
    }


}


class RealEstate{

    imovel[] imoveis = new imovel[20];
    DateYMD[][] leilao = new DateYMD[20][2];

    int id = 999;
    DateYMD datainicio;
    DateYMD datafim;
    int duracao;

    


    public RealEstate() {

    }

    public void newProperty(String localidade, int quartos, int preco){

        this.id++;

        imoveis[this.id-1000] = new imovel(localidade, quartos, preco);
        System.out.println("Novo imovel disponivel:");
        System.out.println(imoveis[this.id-1000].toString());

    }


    public void setAuction(int id, DateYMD datainicio, int duracao) {

        imovel vdd = imoveis[id - 1000];

        if (vdd == null){

            System.out.printf("Imóvel %d não existe\n", id);

        }else if(vdd.disponibilidade == false){
            
            System.out.printf("O imóvel %d não está disponivel\n", id);

        }else{

            DateYMD datafim = new DateYMD(datainicio.getDay(), datainicio.getMonth(), datainicio.getYear());

            for (int i=0; i<duracao; i++){
                datafim.increment();
            }

            leilao[id - 1000][0] = datainicio;
            leilao[id - 1000][1] = datafim;


        }


    }

    public void sell(int id) {

        imoveis[id - 1000].setdispolibilidade(false);
        System.out.printf("Imóvel %d vendido", id);
        System.out.printf("Imóvel %d não está disponível", id);

    }


    @Override
    public String toString() {

        String catalgo = "Propriedades: \n";

        for (int i = 0; i < this.id - 1000; i++){


            if (leilao[i][0] == null){
                catalgo += String.valueOf(1000+i) + " " + imoveis[i].toString() + "\n";
            }else{
                catalgo += String.valueOf(1000+i) + " " + imoveis[i].toString() + " leilão " + leilao[i][0] + " : " + leilao[i][1] + "\n";
            }

        }

        return catalgo;
        
    }


}


public class Ex3 {
    public static void main(String[] args) {
        RealEstate imobiliaria = new RealEstate();
        imobiliaria.newProperty("Glória", 2, 30000);
        imobiliaria.newProperty("Vera Cruz", 1, 25000);
        imobiliaria.newProperty("Santa Joana", 3, 32000);
        imobiliaria.newProperty("Aradas", 2, 24000);
        imobiliaria.newProperty("São Bernardo", 2, 20000);

        imobiliaria.sell(1001);
        imobiliaria.setAuction(1002, new DateYMD(21, 3, 2023), 4);
        imobiliaria.setAuction(1003, new DateYMD(1, 4, 2023), 3);
        imobiliaria.setAuction(1001, new DateYMD(1, 4, 2023), 4);
        imobiliaria.setAuction(1010, new DateYMD(1, 4, 2023), 4);

        System.out.println(imobiliaria);

    }
}
