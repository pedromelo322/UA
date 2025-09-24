package FlyWeight;

import java.util.HashMap;
import java.util.Map;

// A "FlyweightFactory". Garante a partilha dos objetos Flyweight.
public class TreeFactory {
    
    // TODO: Parte 3
    // Crie uma pool (um Map) para armazenar os TreeTypes já criados.
    // A chave pode ser o nome do tipo de árvore (ex: "Carvalho").
    // Ex: private static final Map<String, TreeType> treeTypes = new HashMap<>();
    
    // ... seu Map aqui ...

    private static final Map<String, TreeType> treeTypes = new HashMap<>();
    
    
    // TODO: Parte 4
    // Crie o método 'getTreeType(String name, String model3D, ...)'
    // Este método é o coração do padrão.
    // 1. Verifique se um TreeType com o 'name' fornecido já existe na pool.
    // 2. Se existir, retorne-o.
    // 3. Se não existir:
    //    a. Crie uma nova instância de TreeType.
    //    b. Adicione-a à pool.
    //    c. Retorne a nova instância.
    
    // ... seu método getTreeType aqui ...


    public static TreeType getTreeType(String name, String model3D, String bark, String leaves){


        if (treeTypes.containsKey(name)){
            return treeTypes.get(name);
        }else{
            TreeType tree = new TreeType(name, model3D, bark, leaves);
            treeTypes.put(name, tree);
            return tree;
        }



    }
    
}