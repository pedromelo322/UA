package Builder2;

// O "Director". Conhece a sequência de construção, mas não os detalhes.
public class AssemblyLineDirector {

    // TODO: Parte 5
    // Crie um método 'construct' que recebe um objeto IVehicleBuilder.
    // Dentro deste método, chame os métodos do builder na ordem correta
    // para construir o veículo (chassi -> motor -> rodas -> pintura).
    
    // ... seu método construct aqui ...
    public void construct(IVehicleBuilder i){
        i.buildChassi();
        i.buildMotor();
        i.buildRodas();
        i.buildPintar();
    } 
    
}