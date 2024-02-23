public class CaravanSpace extends CampingSpace{
    
    final int tempoMax = 3*365;

    public CaravanSpace(String localizacao, int[] dimensoes, int precoDia){
        super(localizacao, dimensoes, precoDia);
    }

    public int getTempoMax() {
        return tempoMax;
    }

    public SpaceType getType(){
        return SpaceType.CARAVAN;
    }

}
