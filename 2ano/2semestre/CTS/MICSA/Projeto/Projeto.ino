//Carrega a biblioteca LiquidCrystal
#include <LiquidCrystal.h>
#include <DHT11.h>

#define MQ2pin 0

DHT11 dht11(2);
//Define os pinos que serão utilizados para ligação ao display
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
 
float sensorValue;  // variable to store sensor value

const int buzzer = 8; //buzzer to arduino pin 8

void setup()
{
  //Define o número de colunas e linhas do LCD
  lcd.begin(16, 2);

  Serial.begin(9600);
  Serial.println("MQ2 warming up!");
  delay(20000);

  pinMode(buzzer, OUTPUT);  // Set buzzer - pin 8 as an output
}

void loop()
{
  int temperature = 0;
  int humidity = 0;

  int result = dht11.readTemperatureHumidity(temperature, humidity);

  if (result == 0) {
        Serial.print("Temperature: ");
        Serial.print(temperature);
        Serial.print(" °C\tHumidity: ");
        Serial.print(humidity);
        Serial.println(" %");
  } else {
      // Print error message based on the error code.
      Serial.println(DHT11::getErrorString(result));
  }
  //Limpa a tela
  lcd.clear();
  //Posiciona o cursor na coluna 3, linha 0;
  lcd.setCursor(2, 0);
  //Envia o texto entre aspas para o LCD
  lcd.print(temperature);
  lcd.setCursor(2, 1);
  lcd.print(humidity);
  delay(3000);

  sensorValue = analogRead(MQ2pin);

  Serial.print("Sensor Value: ");
  Serial.println(sensorValue);

  delay(100);

  if (sensorValue >= 170) {
    tone(buzzer, 1000); // Send 1KHz sound signal...
    delay(1000);         // ...for 1 sec
    noTone(buzzer);     // Stop sound...
    delay(1000);         // ...for 1sec
  }
}
