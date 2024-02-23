

public class Client {

    private int numeroContribuinte;
    private String nomeClient;
    private ClientType tipo;
    
    public Client(int numeroContribuinte, String nome, ClientType tipo) {
        this.numeroContribuinte = numeroContribuinte;
        this.nomeClient = nome;
        this.tipo = tipo;

    }

    public int getNumeroContribuinte() {
        return numeroContribuinte;
    }

    public void setNumeroContribuinte(int numeroContribuinte) {
        this.numeroContribuinte = numeroContribuinte;
    }

    public String getNome() {
        return nomeClient;
    }

    public void setNome(String nome) {
        this.nomeClient = nome;
    }

    
    public ClientType getTipo() {
        return tipo;
    }

    public void setTipo(ClientType tipo) {
        this.tipo = tipo;
    }

    

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + numeroContribuinte;
        result = prime * result + ((nomeClient == null) ? 0 : nomeClient.hashCode());
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
        Client other = (Client) obj;
        if (numeroContribuinte != other.numeroContribuinte)
            return false;
        if (nomeClient == null) {
            if (other.nomeClient != null)
                return false;
        } else if (!nomeClient.equals(other.nomeClient))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return this.nomeClient + "[" + this.tipo + ": " + this.numeroContribuinte + "]";
    }



    
}
