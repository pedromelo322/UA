import java.time.LocalDate;

public class Booking {
    CampingSpace espaco;
    LocalDate dataIncio;
    LocalDate dataFinal;

    public Booking(CampingSpace espaco, LocalDate dataIncio, LocalDate dataFinal) {
        this.espaco = espaco;
        this.dataIncio = dataIncio;
        this.dataFinal = dataFinal;
    }
    public CampingSpace getEspaco() {
        return espaco;
    }
    public void setEspaco(CampingSpace espaco) {
        this.espaco = espaco;
    }
    public LocalDate getDataIncio() {
        return dataIncio;
    }
    public void setDataIncio(LocalDate dataIncio) {
        this.dataIncio = dataIncio;
    }
    public LocalDate getDataFinal() {
        return dataFinal;
    }
    public void setDataFinal(LocalDate dataFinal) {
        this.dataFinal = dataFinal;
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((espaco == null) ? 0 : espaco.hashCode());
        result = prime * result + ((dataIncio == null) ? 0 : dataIncio.hashCode());
        result = prime * result + ((dataFinal == null) ? 0 : dataFinal.hashCode());
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
        Booking other = (Booking) obj;
        if (espaco == null) {
            if (other.espaco != null)
                return false;
        } else if (!espaco.equals(other.espaco))
            return false;
        if (dataIncio == null) {
            if (other.dataIncio != null)
                return false;
        } else if (!dataIncio.equals(other.dataIncio))
            return false;
        if (dataFinal == null) {
            if (other.dataFinal != null)
                return false;
        } else if (!dataFinal.equals(other.dataFinal))
            return false;
        return true;
    }
    @Override
    public String toString() {
        return "["+ dataIncio + " : " + dataFinal + "]" + espaco.toString();
    }
    
}
