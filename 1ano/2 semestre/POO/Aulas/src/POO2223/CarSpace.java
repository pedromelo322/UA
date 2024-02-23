
public class CarSpace extends CampingSpace{

    final int tempoMax = 3*30;

    public CarSpace(String localizacao, int[] dimensoes, int precoDia){
        super(localizacao, dimensoes, precoDia);
    }

    public int getTempoMax() {
        return tempoMax;
    }

    public SpaceType getType(){
        return SpaceType.CAR;
    }

}
