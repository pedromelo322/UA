package aula06;
import java.util.Objects;

import aula05.DateYMD;




class Contacto{

    int id;
    Pessoa pessoa;
    int numero;
    String Email;





    public Contacto(int id, Pessoa pessoa, int numero, String Email) {
        this.id = id;
        this.pessoa = pessoa;
        this.numero = numero;
        this.Email = Email;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Pessoa getPessoa() {
        return this.pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public int getNumero() {
        return this.numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getEmail() {
        return this.Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Contacto)) {
            return false;
        }
        Contacto contacto = (Contacto) o;
        return id == contacto.id && Objects.equals(pessoa, contacto.pessoa) && numero == contacto.numero && Objects.equals(Email, contacto.Email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pessoa, numero, Email);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", pessoa='" + getPessoa() + "'" +
            ", numero='" + getNumero() + "'" +
            ", Email='" + getEmail() + "'" +
            "}";
    }
    

}


class Contactos{

    private Contacto[] listaContactos = new Contacto[20]; 
    private int id = 0;
    

    public Contactos() {
    }


    public boolean numeroValido(String numeroRcb){
    

        
        if (numeroRcb.matches("\\d{9}") & numeroRcb.charAt(0) == '9'){

            return true;
        
        }else{
            return false;
        }

    }

    public boolean EmailValido(String EmailRcb){
    

        if (EmailRcb != null){
        
            if(EmailRcb.matches("\\w+@\\w+\\.[a-zA-Z]+")){

                return true;

            }else{
                return false;
            }
        }else{
            return false;
        }

    }

    public boolean idValida(int id){

        if (id > 0 & id <= 2){
            return true;
        }else{
            return false;
        }


    }



    public void addContacto(Pessoa pessoa, String numeroRcb, String EmailRcb){

        int numero = 0;
        String Email = null;

        if (numeroValido(numeroRcb)){
            numero = Integer.parseInt(numeroRcb);
        }


        if(EmailValido(EmailRcb)){

            Email = EmailRcb;

        }

        id ++;
        this.listaContactos[this.id-1] = new Contacto(this.id, pessoa, numero, Email);
        System.out.println("Novo contacto: " + this.listaContactos[this.id-1].toString());


    }

    public void alterarcontacto(int id, String numero, String Email){

        if (idValida(id)){

            Contacto contactoAlterar = this.listaContactos[this.id-1];

            if (EmailValido(Email)){

                contactoAlterar.setEmail(Email);

            }

            if (numeroValido(numero)){

                contactoAlterar.setNumero(Integer.parseInt(numero));

            }

            System.out.println("Contacto Alterado: " + contactoAlterar.toString());
        }



    }

    public void ApagarContacto(int id){

        if (idValida(id)){

            this.listaContactos[this.id-1] = null;


            System.out.println("Contacto " + id + " apagado");
        }

    }

    public void ProcurarContacto(String numero, String Email){

        int num = Integer.parseInt(numero);
        int enc = 0;


        if (numeroValido(numero)){

            for (Contacto contacto : listaContactos) {


                if (contacto != null){
                    if (num == contacto.getNumero()){
                        System.out.println(contacto.toString());
                    }
                }
                
            }

        }else if(enc == 0 & EmailValido(Email)){

            for (Contacto contacto : listaContactos) {

                if (contacto != null){
                    if (Email == contacto.getEmail()){
                        System.out.println(contacto.toString());
                    }
                }
                
            }

        }



    }


    public void ListarContactos(){

        for (Contacto contacto : listaContactos) {
            if (contacto != null){
                System.out.println(contacto.toString());
                
            }
        }

    }
}






public class Ex02 {
    public static void main(String[] args) {
        // Criação de instâncias de Pessoa
        Pessoa pessoa1 = new Pessoa("João", 9855678, new DateYMD(18, 7, 1990));
        Pessoa pessoa2 = new Pessoa("Maria", 3467225, new DateYMD(13, 3, 1967));

        // Criação de instância de Contactos
        Contactos contactos = new Contactos();

        // Adicionar contatos usando o método addContacto
        contactos.addContacto(pessoa1, "987654321", "joao@example.com");
        contactos.addContacto(pessoa2, "935545285", "maria@example.com");

        // Listar contatos
        System.out.println("Lista de contatos:");
        contactos.ListarContactos();

        // Alterar contato
        System.out.println("Alterando contato:");
        contactos.alterarcontacto(1, "916724397", "joao.novo@example.com");

        // Procurar contato
        System.out.println("Procurando contato por número:");
        contactos.ProcurarContacto("916724397", null);

        // Apagar contato
        System.out.println("Apagando contato:");
        contactos.ApagarContacto(2);

        // Listar contatos novamente
        System.out.println("Lista de contatos atualizada:");
        contactos.ListarContactos();
    }
}


