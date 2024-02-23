package aula05;

import java.util.Objects;

public class DateYMD{

    int day, month, year;
    
    public DateYMD(){

    }
    
    public DateYMD(int day, int month, int year) {

        if (valid(day, month, year)){
            this.day = day;
            this.month = month;
            this.year = year;
        }
    }

    public static boolean validDate(int month){

        if (month > 0 & month < 13){
            return true;
        }


        return false;
    }

    public static int monthDays(int month, int year){

        if (month > 0 & month < 13){


            switch(month) {

                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    return 31;
                case 2:
                    if (leapYear(year)){
                        return 29;
                    }else{
                        return 28;
                    } 
                default:
                    return 30;

            }

        }else{
            return 0;
        }

    }

    public static boolean leapYear(int year){

        if (year % 4 == 0 & year >= 0) {
            if (year % 100 == 0) {
                if (year % 400 == 0) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return true;
            }
        } else {
            return false;
        }

    }

    public static boolean valid(int day, int month, int year){

        if (day > 0 & day < monthDays(month, year)){
            return true;
        }else{
            return false;
        }

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

    public DateYMD day(int day) {
        setDay(day);
        return this;
    }

    public DateYMD month(int month) {
        setMonth(month);
        return this;
    }

    public DateYMD year(int year) {
        setYear(year);
        return this;
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

    @Override
    public String toString() {
        return getYear() + "-" + getMonth() + "-" + getDay();
    }


    public void increment(){
        
        if (this.day == monthDays(this.month, this.year)){
            if (this.month == 12){
                this.month = 0;
                this.year += 1;
            }
            this.month += 1;
            this.day = 0;
        }

        this.day += 1;

    }

    public void decrement(){

        if (this.day == 1){
            if (this.month == 1){
                this.month = 13;
                this.year -= 1;
            }
            this.month -= 1;
            this.day = monthDays(this.month, this.year)+1;
        }

        this.day -= 1;

    }

}
