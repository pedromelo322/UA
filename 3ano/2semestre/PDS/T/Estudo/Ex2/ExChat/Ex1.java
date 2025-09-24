public class Grade { // Nota de uma disciplina
    private String courseName;
    private double score; // e.g., 15.5
    // Construtores, getters...
    public double getScore() { return score; }
}

public class Student {
    private String name;
    private List<Grade> grades;
    // Construtores, getters...
    public double calculateAverageGrade(){
        double sum = 0;
                
        if (grades.isEmpty()) {
            return 0;
        }

        for (Grade grade : grades) {
            sum += grade.getScore(); // Faz o cálculo externamente
        }
        return sum / grades.size();
    };
    private List<Grade> getGrades() { return grades; } // Expõe a lista interna
}

public class ReportService {
    // Serviço que calcula a média do aluno
    public double calculateAverageGrade(Student student) {
        return student.calculateAverageGrade();
    }

}

/*
 * A responsabilidade de calcular a média foi movida para a classe Student, 
 * que é o Information Expert. Isto aumenta a High Cohesion da classe Student, 
 * pois os dados (notas) e o comportamento que os utiliza (cálculo da média) estão agora juntos. 
 * O encapsulamento é reforçado, pois a lista interna de notas já não precisa de ser exposta.
 *  A classe ReportService fica mais simples e desacoplada, atuando apenas como um coordenador.
 */