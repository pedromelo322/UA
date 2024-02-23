import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CampingService implements CampingServiceInterface{
    
    private String nome;
    private String endereco;
    List<CampingSpace> espacos = new ArrayList<>();
    List<Client> clients = new ArrayList<>();
    Map<Client,List<Booking>> clientBooking = new HashMap<>();


    public CampingService(String nome, String endereco) {
        this.nome = nome;
        this.endereco = endereco;
    }

    //Fazer depois

    public boolean registerClient(int taxId, String name, ClientType type){
        Client client = new Client(taxId, name, type);
        if (!clients.contains(client)){
            clients.add(client);
            return true;
        }else{
            return false;
        }
    }

    public Client getClient(int taxId){

        for (Client client : clients) {
            if (client.getNumeroContribuinte() == taxId){

                return client;
            }
        }

        return null;

    }

    public void addCampingSpace(CampingSpace campingSpace){
        espacos.add(campingSpace);
    }

    public void addCampingSpaces(Collection<CampingSpace> campingSpaces){
        espacos.addAll(campingSpaces);
    }

    public boolean checkAvailability(CampingSpace campingSpace, LocalDate startDate, LocalDate endDate){

        

        if (espacos.contains(campingSpace)){
            for (List<Booking> lista : clientBooking.values()) {
                for (Booking booking : lista) {
                    if  (booking.getEspaco().equals(campingSpace)){
                        if ((startDate.isBefore(booking.getDataIncio()) & endDate.isBefore(booking.getDataFinal())) || (startDate.isAfter(booking.getDataFinal()) & endDate.isAfter(booking.getDataFinal()))){
                            return true;
                        }else{
                            return false;
                        }
                    }
                }
            }
            return true;
        }else{
            return false;
        }

    }

    public List<CampingSpace> findAvailableCampingSpaces(SpaceType spaceType, LocalDate fromDate, int duration, int[] minDimensions){

        List<CampingSpace> disponiveis = new ArrayList<>();

        for (CampingSpace espaco : espacos) {
            if (espaco.getType() == spaceType){
                if (checkAvailability(espaco, fromDate, fromDate.plusDays(duration))){
                    if (duration <= espaco.getTempoMax() && minDimensions[0] * minDimensions[1] <= espaco.getDimensoes()[0]*espaco.getDimensoes()[1]){
                        disponiveis.add(espaco);
                    }
                }
            }            
        }

        return disponiveis;

    }

    public List<CampingSpace> getAvailableSpacesByTotalArea(LocalDate fromDate, int duration) {
        
        List<CampingSpace> disponiveis = new ArrayList<>();

        for (CampingSpace espaco : espacos) {
            if (checkAvailability(espaco, fromDate, fromDate.plusDays(duration))){
                disponiveis.add(espaco);
            }
            
        }

        Collections.sort(disponiveis, new Comparator<CampingSpace>() {
            @Override
            public int compare(CampingSpace o1, CampingSpace o2) {

                Integer valor1 = o1.getDimensoes()[0] * o1.getDimensoes()[1];
                Integer valor2 = o2.getDimensoes()[0] * o2.getDimensoes()[1];


                return valor1.compareTo(valor2);
            }
        });

        //disponiveis.stream().sorted(Comparator)

        return  disponiveis;

    }

    public boolean bookCampingSpace(Client client, CampingSpace campingSpace, LocalDate startDate, int duration){
        if (!checkAvailability(campingSpace, startDate, startDate.plusDays(duration))){
            return false;
        }else{
            if (campingSpace.getType() == SpaceType.CARAVAN && client.getTipo() != ClientType.MEMBER){
                return false;
            }else{


                if (clientBooking.keySet().contains(client)){
                    clientBooking.get(client).add(new Booking(campingSpace, startDate, startDate.plusDays(duration)));
                
                }else{
                    List<Booking> lista = new ArrayList<>();

                    lista.add(new Booking(campingSpace, startDate, startDate.plusDays(duration)));
                    clientBooking.put(client, lista);
                }
                return true;
            }
            
        }
    }

    public double calculateTotalCost(CampingSpace campingSpace, int duration){

        if (duration <= campingSpace.getTempoMax()){
            return campingSpace.getPrecoDia() * duration;
        }else{
            return 0.0;
        }

    }

    public List<String> listBookings(){

        List<String> listaBooking = new ArrayList<>();
        String str = "";

        for (Client client : clientBooking.keySet()){
            for (Booking booking : clientBooking.get(client))
            str = client.toString() + " - " + booking.toString() + ", total cost "+ calculateTotalCost(booking.getEspaco(), (int) ChronoUnit.DAYS.between(booking.getDataIncio(), booking.getDataFinal()))+ "\n";
            listaBooking.add(str); 
        }

        return listaBooking;


    }

    public List<String> listBookings(SpaceType spaceType){


        List<String> listaBooking = new ArrayList<>();
        String str = "";

        for (Client client : clientBooking.keySet()){
            for (Booking booking : clientBooking.get(client)){
                if (booking.getEspaco().getType() == spaceType){
                    str = client.toString() + " - " + booking.toString() + ", total cost "+ calculateTotalCost(booking.getEspaco(), (int) ChronoUnit.DAYS.between(booking.getDataIncio(), booking.getDataFinal()))+ "\n";
                    listaBooking.add(str);
                }
            }
        }

        return listaBooking;

    }

    



    public String getNome() {
        return nome;
    }


    public String getEndereco() {
        return endereco;
    }




    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        result = prime * result + ((endereco == null) ? 0 : endereco.hashCode());
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
        CampingService other = (CampingService) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        if (endereco == null) {
            if (other.endereco != null)
                return false;
        } else if (!endereco.equals(other.endereco))
            return false;
        return true;
    }


    @Override
    public String toString() {
        return "CampingService [nome=" + nome + ", endereco=" + endereco + "]";
    }


    


}
