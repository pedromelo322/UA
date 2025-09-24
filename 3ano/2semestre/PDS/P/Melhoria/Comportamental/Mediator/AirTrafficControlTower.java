package Mediator;

import java.util.ArrayList;


// O "ConcreteMediator". Centraliza a comunicação.
public class AirTrafficControlTower implements IAirTrafficControl {

    // TODO: Parte 4
    // Crie uma lista para manter o registo de todos os aviões que estão
    // sob o controlo desta torre.
    
    // ... sua lista aqui ...

    ArrayList<Aircraft> lista = new ArrayList<>();


    // TODO: Parte 5
    // Implemente os métodos da interface 'IAirTrafficControl'.
    // 1. 'registerAircraft': deve adicionar o avião à lista de aviões.
    // 2. 'sendMessage': esta é a lógica central. Deve iterar por todos
    //    os aviões registados e retransmitir a mensagem para todos,
    //    EXCETO para o avião que enviou a mensagem originalmente.
    
    // ... implementação dos seus métodos aqui ...
    
    @Override
    public void registerAircraft(Aircraft aircraft){
        lista.add(aircraft);
    }
    @Override
    public void sendMessage(String message, Aircraft sender){
        for (Aircraft x : lista) {
            if (x == sender){
                continue;
            }
            x.receive(message);
        }
    }
}