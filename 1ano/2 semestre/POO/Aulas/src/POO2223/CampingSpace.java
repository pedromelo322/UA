import java.util.Arrays;

public abstract class CampingSpace {
    
    String localizacao;
    int[] dimensoes;
    double precoDia;
    
    public CampingSpace(String localizacao, int[] dimensoes, double precoDia) {
        this.localizacao = localizacao;
        this.dimensoes = dimensoes;
        this.precoDia = precoDia;


    }
    public String getLocalizacao() {
        return localizacao;
    }
    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }
    public int[] getDimensoes() {
        return dimensoes;
    }
    public void setDimensoes(int[] dimensoes) {
        this.dimensoes = dimensoes;
    }
    public double getPrecoDia() {
        return precoDia;
    }
    public void setPrecoDia(double precoDia) {
        this.precoDia = precoDia;
    }

    abstract public int getTempoMax();
    abstract public SpaceType getType();


    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        CampingSpace other = (CampingSpace) obj;
        if (localizacao == null) {
            if (other.localizacao != null)
                return false;
        } else if (!localizacao.equals(other.localizacao))
            return false;
        if (!Arrays.equals(dimensoes, other.dimensoes))
            return false;
        if (precoDia != other.precoDia)
            return false;
        return true;
    }
    @Override
    public String toString() {
        return getType().toString() + " located in " + localizacao + ", with dimension " + dimensoes[0] + "x" + dimensoes[1] + ", " + precoDia + "/day";
    }


}
