package aula08;
import java.util.ArrayList;
import java.util.Objects;

public class Ex02 {
    public static void main(String[] args) {
		Ementa ementa = new Ementa("Especial Primavera", "Snack da UA");
		Prato[] pratos = new Prato[DiaSemana.values().length];
		for (int i = 0; i < pratos.length; i++) {
			pratos[i] = randPrato(i + 1);
			System.out.println("A sair .. " + pratos[i]);

			// Adiciona 2 ingredientes a cada prato
			int ingred = 1;
			do {
				Alimento aux = randAlimento();
				if (pratos[i].addIngrediente(aux)) {
					System.out.println("\tIngrediente " + ingred + " adicionado: " + aux);
					ingred++;
				} else
					System.out.println("\tERRO: não é possível adicionar Ingrediente " + ingred + ": " + aux);
			} while (ingred < 3);

			ementa.addPrato(pratos[i], DiaSemana.values()[i]);
		}
		System.out.println("\nEmenta final\n--------------------");
		System.out.println(ementa);
	}

	public static Alimento randAlimento() {
		Alimento res = null;
		switch ((int) (Math.random() * 4)) {
		case 0:
			res = new Carne(VariedadeCarne.FRANGO, 22.3, 345.3, 300);
			break;
		case 1:
			res = new Peixe(TipoPeixe.CONGELADO, 31.3, 25.3, 200);
			break;
		case 2:
			res = new Legume("Couve Flor", 21.3, 22.4, 150);
			break;
		case 3:
			res = new Cereal("Milho", 19.3, 32.4, 110);
			break;
		}
		return res;
	}

	public static Prato randPrato(int i) {
		Prato res = null;
		switch ((int) (Math.random() * 3)) {
		case 0:
			res = new Prato("combinado n." + i);
			break;
		case 1:
			res = new PratoVegetariano("combinado n." + i);
			break;
		case 2:
			res = new PratoDieta("combinado n." + i, 90.8);
			break;
		}
		return res;
	}
}

enum DiaSemana{
    SEGUNDA, TERCA, QUARTA, QUINTA, SEXTA, SABADO, DOMINGO
}


abstract class Alimento{

    double proteinas;
    double calorias;
    double peso;


    public Alimento(double proteinas, double calorias, double peso) {
        this.proteinas = proteinas;
        this.calorias = calorias;
        this.peso = peso;
    }

    public double getProteinas() {
        return this.proteinas;
    }

    public void setProteinas(double proteinas) {
        this.proteinas = proteinas;
    }

    public double getCalorias() {
        return this.calorias;
    }

    public void setCalorias(double calorias) {
        this.calorias = calorias;
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
        if (!(o instanceof Alimento)) {
            return false;
        }
        Alimento alimento = (Alimento) o;
        return proteinas == alimento.proteinas && calorias == alimento.calorias && peso == alimento.peso;
    }

    @Override
    public int hashCode() {
        return Objects.hash(proteinas, calorias, peso);
    }

    @Override
    public String toString() {
        return "{" +
            " proteinas='" + getProteinas() + "'" +
            ", calorias='" + getCalorias() + "'" +
            ", peso='" + getPeso() + "'" +
            "}";
    }
    

}

enum VariedadeCarne{

    VACA, PORCO, PERU, FRANGO, OUTRA

}


enum TipoPeixe{

    CONGELADO, FRESCO

}


class Carne extends Alimento{

    VariedadeCarne tipo;



    public Carne(VariedadeCarne tipo, double proteinas, double calorias, double peso) {
        super(proteinas, calorias, peso);
        this.tipo = tipo;
    }

    public VariedadeCarne getTipo() {
        return this.tipo;
    }

    public void setTipo(VariedadeCarne tipo) {
        this.tipo = tipo;
    }

    public Carne tipo(VariedadeCarne tipo) {
        setTipo(tipo);
        return this;
    }


    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        Carne other = (Carne) obj;
        if (tipo != other.tipo)
            return false;
        return true;
    }


    @Override
    public String toString() {
        return "{" +
            " tipo='" + getTipo() + "," + super.toString() + "'" +
            "}";
    }


}




class Peixe extends Alimento{

    TipoPeixe tipo;

    public Peixe(TipoPeixe tipo, double proteinas, double calorias, double peso) {
        super(proteinas, calorias, peso);
        this.tipo = tipo;
    }

    public TipoPeixe getTipo() {
        return tipo;
    }

    public void setTipo(TipoPeixe tipo) {
        this.tipo = tipo;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        Peixe other = (Peixe) obj;
        if (tipo != other.tipo)
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Peixe [tipo=" + tipo + "," + super.toString() + "]";
    }


}


abstract class AlimentoVegetariano extends Alimento{

    String nome;

    public AlimentoVegetariano(String nome, double proteinas, double calorias, double peso) {
        super(proteinas, calorias, peso);
        this.nome = nome;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }


    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        Cereal other = (Cereal) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Cereal [nome=" + nome + "," + super.toString() + "]";
    }

}


class Cereal extends AlimentoVegetariano{


    public Cereal(String nome, double proteinas, double calorias, double peso) {
        super(nome,proteinas, calorias, peso);
    }


    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        Cereal other = (Cereal) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Cereal [nome=" + super.getNome() + "," + super.toString() + "]";
    }

}


class Legume extends AlimentoVegetariano{

    public Legume(String nome, double proteinas, double calorias, double peso) {
        super(nome,proteinas, calorias, peso);
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        Cereal other = (Cereal) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Legume [nome=" + super.getNome() + "," + super.toString() + "]";
    }

}



class Prato {
    ArrayList<Alimento> alimentos;
    String nome;

    public Prato(String nome) {
        this.alimentos = new ArrayList<>();
        this.nome = nome;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public ArrayList<Alimento> getAlimentos() {
        return alimentos;
    }

    public void setAlimentos(ArrayList<Alimento> alimentos) {
        this.alimentos = alimentos;
    }

    public boolean addIngrediente(Alimento alimento){

        if (this instanceof PratoDieta) {
            PratoDieta pratoDieta = (PratoDieta) this;
            double totalCalorias = 0.0;

            for (Alimento a : this.alimentos) {
                totalCalorias += a.getCalorias();
            }

            totalCalorias += alimento.getCalorias();

            if (totalCalorias <= pratoDieta.getLimiteMax()){
                alimentos.add(alimento);
                return true;
            }else{
                return false;
            }
            
        }

        return true;
        

        

    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((alimentos == null) ? 0 : alimentos.hashCode());
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Prato other = (Prato) obj;
        if (alimentos == null) {
            if (other.alimentos != null)
                return false;
        } else if (!alimentos.equals(other.alimentos))
            return false;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Prato [alimentos=" + alimentos + ", nome=" + nome + "]";
    }

}


class PratoVegetariano extends Prato{


    public PratoVegetariano(String nome) {
        super(nome);
    }

    @Override
    public String toString() {
        return "PratoVegetariano [" + super.toString() + "]";
    }



}


class PratoDieta extends Prato{

    double limiteMax;


    public PratoDieta(String nome, double limiteMax) {
        super(nome);
        this.limiteMax = limiteMax;
    }


    public double getLimiteMax() {
        return limiteMax;
    }

    public void setLimiteMax(double limiteMax) {
        this.limiteMax = limiteMax;
    }


    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        long temp;
        temp = Double.doubleToLongBits(limiteMax);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        return result;
    }


    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        PratoDieta other = (PratoDieta) obj;
        if (Double.doubleToLongBits(limiteMax) != Double.doubleToLongBits(other.limiteMax))
            return false;
        return true;
    }


    @Override
    public String toString() {
        return "PratoDieta [limiteMax=" + limiteMax + "," + super.toString() + "]";
    }






}


class Ementa{

    String nome;
    String local;
    ArrayList<Prato> pratos = new ArrayList<>();


    public Ementa(String nome, String local) {
        this.nome = nome;
        this.local = local;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLocal() {
        return this.local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public void addPrato(Prato prato, DiaSemana diaSemana){
        this.pratos.add(prato);
    }

    public ArrayList<Prato> getPratos() {
        return pratos;
    }

    public void setPratos(ArrayList<Prato> pratos) {
        this.pratos = pratos;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        result = prime * result + ((local == null) ? 0 : local.hashCode());
        result = prime * result + ((pratos == null) ? 0 : pratos.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Ementa other = (Ementa) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        if (local == null) {
            if (other.local != null)
                return false;
        } else if (!local.equals(other.local))
            return false;
        if (pratos == null) {
            if (other.pratos != null)
                return false;
        } else if (!pratos.equals(other.pratos))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Ementa [nome=" + nome + ", local=" + local + ", pratos=" + pratos + "]";
    }


}



