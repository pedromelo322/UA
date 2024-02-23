
def isLeapYear(year):
   if year%4 == 0 and year%100 != 0 or year%4 == 0 and year%100 == 0 and year%400 == 0:
      return True
   else:
      return False


def monthDays(year, month):
   MONTHDAYS = (0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
   days = MONTHDAYS[month]
   if month == 2 and isLeapYear(year) == True:
      days += 1
   return days


def nextDay(year, month, day):
   if dateIsValid(year, month, day) == True:
      if day == monthDays(year, month) and month == 12:
         year += 1
         month = 1
         day = 1
      elif day == monthDays(year, month):
         month += 1
         day = 1
      else:
         day += 1

      return year, month, day


def dateIsValid(year, month, day):
   valor = True
   if month <= 0 or month > 12 or day > monthDays(year, month) or day < 1 or year < 0:
      valor = False
   return valor


def previousDay(year, month, day):
   if dateIsValid(year, month, day) == True:
      if day == 1 and month == 1:
         year -= 1
         month = 12
         day = 31
      elif day == 1:
         month -= 1
         day = monthDays(year, month)
      else:
         day -= 1
      return year, month, day




if __name__ == '__main__':
   print(isLeapYear(1900))
   print(monthDays(2004, 2))
   print(nextDay(2017, 2, 29))
   print(dateIsValid(1980, 2, 29))
   print(dateIsValid(1980, 2, 30))
   print(previousDay(1980, 3, 1))
