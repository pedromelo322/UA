
public class TentSpace extends CampingSpace{

    final int tempoMax = 10;

    public TentSpace(String localizacao, int[] dimensoes, int precoDia){
        super(localizacao, dimensoes, precoDia);
    }

    public int getTempoMax() {
        return tempoMax;
    }

    public SpaceType getType(){
        return SpaceType.TENT;
    }

}
