package Creational.AbstractFactory;
interface CPU{

    String getDescricao();

}



interface RAM{

    String getDescricao();

}


interface Armazenamento{

    String getDescricao();

}




class CPUGAMER implements CPU{

    @Override
    public String getDescricao(){
        return "CPU GAMER";
    }

}


class RAMGAMER implements RAM{

    @Override
    public String getDescricao(){
        return "RAM GAMER";
    }

}

class ArmazenamentoGAMER implements Armazenamento{

    @Override
    public String getDescricao(){
        return "Armazenamento GAMER";
    }

}




class CPUBasico implements CPU{

    @Override
    public String getDescricao(){
        return "CPU BASICO";
    }

}


class RAMBasico implements RAM{

    @Override
    public String getDescricao(){
        return "RAM BASICO";
    }

}

class ArmazenamentoBasico implements Armazenamento{

    @Override
    public String getDescricao(){
        return "Armazenamento BASICO";
    }

}



interface FabricaComponentesComputador{

    CPU criarCPU();

    RAM criarRAM();

    Armazenamento criarArmazenamento();


}



class FabricaComponentesGamer implements FabricaComponentesComputador{

    public CPU criarCPU(){

        return new CPUGAMER();


    }


    public RAM criarRAM(){

        return new RAMGAMER();


    }


    public Armazenamento criarArmazenamento(){

        return new ArmazenamentoGAMER();


    }

}






class FabricaComponentesBasica implements FabricaComponentesComputador{

    public CPU criarCPU(){

        return new CPUBasico();


    }


    public RAM criarRAM(){

        return new RAMBasico();


    }


    public Armazenamento criarArmazenamento(){

        return new ArmazenamentoBasico();


    }

}




class MontadorComputador{


    public void montarEExibirEspecificacoes(FabricaComponentesComputador fabrica){


        Armazenamento armazenamento = fabrica.criarArmazenamento();
        System.out.println(armazenamento.getDescricao());

        CPU cpu = fabrica.criarCPU();
        System.out.println(cpu.getDescricao());

        RAM ram = fabrica.criarRAM();
        System.out.println(ram.getDescricao());

    }


}


public class Abstract{
    public static void main(String[] args) {

        MontadorComputador montador = new MontadorComputador();

        FabricaComponentesComputador fabricaGamer = new FabricaComponentesGamer();
        FabricaComponentesComputador fabricaBasica = new FabricaComponentesBasica();


        montador.montarEExibirEspecificacoes(fabricaGamer);
        montador.montarEExibirEspecificacoes(fabricaBasica);


    }
}