public enum SpaceType {
    CARAVAN, CAR, TENT;


    public static SpaceType getSpaceType(String tipo){

        switch(tipo){
            case "CARVAN": return SpaceType.CARAVAN;
            case "CAR": return SpaceType.CAR;
            default : return SpaceType.TENT;
        }

        
    }

}
