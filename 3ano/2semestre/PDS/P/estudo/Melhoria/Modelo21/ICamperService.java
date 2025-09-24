public interface ICamperService {
    public void registaUtilizador(Utilizador u);
    public ICamper registaCamper(int lugares, String descricao);
    public String registaAluguer(Cliente u, ICamper c);
    public String terminaAluguer(Cliente u, ICamper c);
}
