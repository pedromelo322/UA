package Builder2;

// TODO: Parte 3
// Crie a classe 'SportsCarBuilder' que implementa 'IVehicleBuilder'.
// No construtor, deve criar uma nova instância de Vehicle("Carro Desportivo").
// Cada método de construção deve adicionar a peça específica ao veículo.
// Ex: no método buildEngine(), chame vehicle.addPart("Motor V8").

// ... sua classe SportsCarBuilder aqui ...

class SportsCarBuilder implements IVehicleBuilder{

    Vehicle vehicle = new Vehicle("SportsCar");

    @Override
    public void buildChassi() {
        vehicle.addPart("Chassi Desportivo");
    }

    @Override
    public void buildMotor() {
        vehicle.addPart("Motor V8");
    }

    @Override
    public void buildRodas() {
        vehicle.addPart("4 Rodas de Liga Leve");
    }

    @Override
    public void buildPintar() {
        vehicle.addPart("Pintura Vermelha Metálica");
    }

    @Override
    public Vehicle getResult() {
        return vehicle;
    }

    

}


// TODO: Parte 4
// Crie a classe 'TruckBuilder' que implementa 'IVehicleBuilder'.
// Siga a mesma lógica, mas para um camião (ex: Motor a Diesel, 8 Rodas).

// ... sua classe TruckBuilder aqui ...



class TruckBuilder implements IVehicleBuilder{

    Vehicle vehicle = new Vehicle("Truck");

    @Override
    public void buildChassi() {
        vehicle.addPart("Chassi Reforçado");
    }

    @Override
    public void buildMotor() {
        vehicle.addPart("Motor a Diesel");
    }

    @Override
    public void buildRodas() {
        vehicle.addPart("8 Rodas para Carga");
    }

    @Override
    public void buildPintar() {
        vehicle.addPart("Pintura Branca Industrial");
    }

    @Override
    public Vehicle getResult() {
        return vehicle;
    }

    

}