package aula11;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Gradebook {

    List<Student> lista = new ArrayList<>();

    
    public Gradebook(){

    }

    public void load(String ficheiro){

        try(Scanner sc = new Scanner(new File(ficheiro))){

            while(sc.hasNextLine()){

                String linhas = sc.nextLine();
                String[] valores = linhas.split("\\|", 2);

                String nome = valores[0];
                String notas = valores[1];


                List<Double> notasDouble = new ArrayList<>();

                for(String e : notas.split("\\|")){

                    notasDouble.add(Double.parseDouble(e));

                }

                Student student = new Student(nome, notasDouble);


                addStudent(student);

            }            

        } catch (FileNotFoundException e) {
            System.out.println(e);
        }


    }

    public void addStudent(Student student){

        
       lista.add(student);

    }

    public void removeStudent(String nome){

        
       lista.remove(getStudent(nome));

    }

    public Student getStudent(String nome){

        for (Student e : this.lista){

            if (e.getName().equals(nome)){
                return e;
            }

        }

        return null;
    }

    public double calculateAverageGrade(String nome){

        Student student = getStudent(nome);

        List<Double> notas = student.getGrades();

        double avg = 0.0;

        for (double e : notas){
            avg += e;
        }

        return avg/3;
    }


    public void printAllStudents(){

        for (Student student : this.lista) {
            System.out.println(student);
        }

    }

}
