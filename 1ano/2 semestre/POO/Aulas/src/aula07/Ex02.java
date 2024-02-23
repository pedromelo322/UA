package aula07;

import java.util.Objects;

abstract class Date {

    int day, month, year;

    public Date(int day, int month, int year) {

        this.day = day;
        this.month = month;
        this.year = year;

    }

    public Date(){
        
    }

    public int getDay() {
        return this.day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getMonth() {
        return this.month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return this.year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public static boolean validDate(int month) {
        return month > 0 && month < 13;
    }

    public static int monthDays(int month, int year) {
        if (month > 0 && month < 13) {
            switch (month) {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    return 31;
                case 2:
                    if (leapYear(year)) {
                        return 29;
                    } else {
                        return 28;
                    }
                default:
                    return 30;
            }
        } else {
            return 0;
        }
    }

    public static boolean leapYear(int year) {
        if (year % 4 == 0 && year >= 0) {
            if (year % 100 == 0) {
                return year % 400 == 0;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    public static boolean valid(int day, int month, int year) {
        if (day > 0 && day <= monthDays(month, year)) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof DateYMD)) {
            return false;
        }
        DateYMD dateYMD = (DateYMD) o;
        return day == dateYMD.day && month == dateYMD.month && year == dateYMD.year;
    }

    @Override
    public int hashCode() {
        return Objects.hash(day, month, year);
    }

    public void increment() {
        if (this.day == monthDays(this.month, this.year)) {
            if (this.month == 12) {
                this.month = 1;
                this.year += 1;
            } else {
                this.month += 1;
            }
            this.day = 1;
        } else {
            this.day += 1;
        }
    }

    public void decrement() {
        if (this.day == 1) {
            if (this.month == 1) {
                this.month = 12;
                this.year -= 1;
            } else {
                this.month -= 1;
            }
            this.day = monthDays(this.month, this.year);
        } else {
            this.day -= 1;
        }
    }

    @Override
    public String toString() {
        return getYear() + "-" + getMonth() + "-" + getDay();
    }
}

class DateND extends Date {

    int distancia;
    DateYMD data;

    public DateND(DateYMD data) {
        super(data.getDay(), data.getMonth(), data.getYear());
        this.distancia = calcularDistancia(data);
    }

    public int getDistancia() {
        return this.distancia;
    }

    int calcularDistancia(DateYMD date) {
        int resultado = 0;
        if (valid(date.getDay(), date.getMonth(), date.getYear())) {
            if (date.getYear() > 2000) {
                for (int i = 2000; i < date.getYear(); i++) {
                    if (leapYear(i)) {
                        resultado += 366;
                    } else {
                        resultado += 365;
                    }
                }
                for (int i = 1; i < date.getMonth(); i++) {
                    resultado += monthDays(i, date.getYear());
                }
                resultado += date.getDay();
            } else {
                for (int i = date.getYear(); i < 2000; i++) {
                    if (leapYear(i)) {
                        resultado += 366;
                    } else {
                        resultado += 365;
                    }
                }
                for (int i = 1; i < date.getMonth(); i++) {
                    resultado += monthDays(i, date.getYear());
                }
                resultado += date.getDay();
            }
        }
        return resultado;
    }

    @Override
    public String toString() {
        return super.toString() + ", Distancia: " + this.distancia;
    }
}

class DateYMD extends Date {
    public DateYMD(int day, int month, int year) {
        super();
        if (valid(day, month, year)) {
            setDay(day);
            setMonth(month);
            setYear(year);
        }
    }
}


public class Ex02 {

    public static void main(String[] args) {
        // Teste de Data YMD
        DateYMD dateYMD = new DateYMD(23, 6, 2023);
        System.out.println("Data YMD: " + dateYMD);

        // Teste de Data ND
        DateND dateND = new DateND(dateYMD);
        System.out.println("Data ND: " + dateND);
        System.out.println("Distância: " + dateND.getDistancia());

        // Teste de incremento
        System.out.println("Data ND antes do incremento: " + dateND);
        dateND.increment();
        System.out.println("Data ND após o incremento: " + dateND);

        // Teste de decremento
        System.out.println("Data ND antes do decremento: " + dateND);
        dateND.decrement();
        System.out.println("Data ND após o decremento: " + dateND);
    }
}
