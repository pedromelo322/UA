#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <DHT11.h>

#define MQ2pin A0
#define POTENTIOMETER_PIN A1
#define SWITCH_PIN 7
#define LED_PIN 9
#define FAN_PIN 10
#define BUZZER_PIN 8

#define MIN_TEMPERATURE 20
#define MAX_TEMPERATURE 40
#define MIN_GAS 150
#define MAX_GAS 350

DHT11 dht11(2);
LiquidCrystal_I2C lcd(0x27, 16, 2);  // Initialize LCD with address 0x27, 16 columns and 2 rows

int forceChange = 0;
float gasSensorValue;
int temperatureThreshold = 300; // Default value
int gasThreshold = 250; // Default value
bool displayMode = true; // true for temperature/humidity, false for gas

void setup() {
  lcd.init();  // Initialize the LCD
  lcd.backlight();  // Turn on the LCD backlight
  Serial.begin(9600);

  pinMode(BUZZER_PIN, OUTPUT);
  pinMode(LED_PIN, OUTPUT);
  pinMode(FAN_PIN, OUTPUT);
  pinMode(SWITCH_PIN, INPUT); // Set as INPUT

  Serial.println("MQ2 warming up!");
  delay(20000); // Warm-up time for the gas sensor
}

void loop() {
  int temperature = 0;
  int humidity = 0;
  int result = dht11.readTemperatureHumidity(temperature, humidity);

  gasSensorValue = analogRead(MQ2pin);
  int potValue = analogRead(POTENTIOMETER_PIN);
  bool switchState = digitalRead(SWITCH_PIN);

  // Clear the screen
  lcd.clear();

  // Toggle display mode
  if (forceChange == 1 || (forceChange != 2 && switchState == HIGH)) {
    temperatureThreshold = map(potValue, 0, 1023, MIN_TEMPERATURE, MAX_TEMPERATURE);
    displayTemperatureHumidity(temperature, humidity);
  } else if (forceChange == 2 || (forceChange != 1 && switchState == LOW)) {
    gasThreshold = map(potValue, 0, 1023, MIN_GAS, MAX_GAS);
    displayGasValue();
  }

  controlFanAndLed(temperature);
  delay(1000); // Delay for reading and updating values

  printDebug(temperature, temperatureThreshold, gasSensorValue, gasThreshold);
}

void displayTemperatureHumidity(int temperature, int humidity) {
  lcd.setCursor(0, 0);
  lcd.print("Temp: ");
  lcd.print(temperature);
  lcd.print(" C");
  lcd.setCursor(0, 1);
  lcd.print("Thresh: ");
  lcd.print(temperatureThreshold);
}

void displayGasValue() {
  lcd.setCursor(0, 0);
  lcd.print("Gas: ");
  lcd.print(gasSensorValue);
  lcd.setCursor(0, 1);
  lcd.print("Thresh: ");
  lcd.print(gasThreshold);
}

void controlFanAndLed(int temperature) {
  if (temperature >= temperatureThreshold || gasSensorValue >= gasThreshold) {
    digitalWrite(LED_PIN, HIGH);
    digitalWrite(FAN_PIN, LOW); // Corrected logic to turn on the fan
    forceChange = (temperature >= temperatureThreshold) ? 1 : 2;
    for (int i = 0; i < 3; i++) { // Repete o som 3 vezes
      tone(BUZZER_PIN, 1000); // Inicia o som
      delay(200); // Duração do som
      noTone(BUZZER_PIN); // Para o som
      if (i < 2) { // Evita a pausa após o último som
        delay(200); // Intervalo entre os sons
      }
    }
  } else {
    digitalWrite(LED_PIN, LOW);
    digitalWrite(FAN_PIN, HIGH); // Corrected logic to turn off the fan
    noTone(BUZZER_PIN); // Stop the buzzer
    forceChange=0;
  }
}

void printDebug(int temperature, int temperatureThreshold, float gasSensorValue, int gasThreshold) {
  Serial.print("--------------------\n");
  Serial.print("Temperature: ");
  Serial.print(temperature);
  Serial.print(", Temperature Threshold: ");
  Serial.print(temperatureThreshold);
  Serial.print(", Gas: ");
  Serial.print(gasSensorValue);
  Serial.print(", Gas Threshold: ");
  Serial.println(gasThreshold);
}