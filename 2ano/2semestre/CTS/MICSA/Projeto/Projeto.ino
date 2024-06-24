// Inclusão de bibliotecas
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <DHT11.h>

// Definição de pinos
#define MQ2pin A0
#define POTENTIOMETER_PIN A1
#define SWITCH_PIN 7
#define FAN_PIN 10
#define BUZZER_PIN 8

// Definição de limites para temperatura e gás
#define MIN_TEMPERATURE 20
#define MAX_TEMPERATURE 40
#define MIN_GAS 300
#define MAX_GAS 600

// Inicialização de objetos
DHT11 dht11(2);
LiquidCrystal_I2C lcd(0x27, 16, 2);  // Inicializa o LCD com endereço 0x27, 16 colunas e 2 linhas

// Variáveis globais
int forceChange = 0;
int gasSensorValue;
int temperature;  
int humidity;
int temperatureThreshold = 300; // Valor padrão
int gasThreshold = 500; // Valor padrão
bool displayMode = true; // true para temperatura, false para gás

void setup() {
  lcd.init(); 
  lcd.backlight();
  Serial.begin(9600);

  pinMode(BUZZER_PIN, OUTPUT);
  pinMode(FAN_PIN, OUTPUT);
  pinMode(SWITCH_PIN, INPUT);

  Serial.println("MQ2 a aquecer!");
  delay(20000); // Tempo de aquecimento para o sensor de gás
}

void loop() {

  int result = dht11.readTemperatureHumidity(temperature, humidity);

  gasSensorValue = analogRead(MQ2pin);
  int potValue = analogRead(POTENTIOMETER_PIN);
  bool switchState = digitalRead(SWITCH_PIN);

  Serial.print(switchState);

  
  if (switchState == HIGH) {
    displayMode = !displayMode;
  }

  // Mostra os valores apropriados com base no modo de exibição
  if (forceChange == 1 || (forceChange != 2 && displayMode == true)) {
    temperatureThreshold = map(potValue, 0, 1023, MIN_TEMPERATURE, MAX_TEMPERATURE);
    displayTemperatureHumidity(temperature, humidity);
  } else if (forceChange == 2 || (forceChange != 1 && displayMode == false)) {
    gasThreshold = map(potValue, 0, 1023, MIN_GAS, MAX_GAS);
    displayGasValue();
  }

  control();
  delay(250); // Atraso para leitura e atualização de valores

  printDebug(temperature, temperatureThreshold, gasSensorValue, gasThreshold);
}

// Função para mostrar temperatura no LCD
void displayTemperatureHumidity(int temperature, int humidity) {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Temp: ");
  lcd.print(temperature);
  lcd.print(" C");
  lcd.setCursor(0, 1);
  lcd.print("Threshold: ");
  lcd.print(temperatureThreshold);
  lcd.print(" C");
}

// Função para mostrar o valor do gás no LCD
void displayGasValue() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Gas: ");
  lcd.print(gasSensorValue);
  lcd.setCursor(0, 1);
  lcd.print("threshold: ");
  lcd.print(gasThreshold);
}

// Função para controlar o ventilador e buzzer com base na temperatura e no nível de gás
void control() {
  // Define as margens de tolerância
  int temperatureMargin = temperatureThreshold/20;
  int gasMargin = gasThreshold/20;

  // Verifica se a temperatura ou o nível de gás excedem os limiares mais as margens de tolerância
  if (temperature > temperatureThreshold + temperatureMargin || gasSensorValue > gasThreshold + gasMargin) {
    digitalWrite(FAN_PIN, LOW); 
    forceChange = (temperature > temperatureThreshold + temperatureMargin) ? 1 : 2;
    for (int i = 0; i < 3; i++) { // Repete o som 3 vezes
      tone(BUZZER_PIN, 1000); 
      delay(200);
      noTone(BUZZER_PIN);
      if (i < 2) {
        delay(200);
      }
    }
  } else if (temperature < temperatureThreshold - temperatureMargin && gasSensorValue < gasThreshold - gasMargin) {
    // Desliga o ventilador e o buzzer apenas se a temperatura e o nível de gás estiverem abaixo dos limiares menos as margens de tolerância
    digitalWrite(FAN_PIN, HIGH);
    noTone(BUZZER_PIN);
    forceChange = 0;
  }
  // Não altera o estado do ventilador ou buzzer se a temperatura ou o nível de gás estiverem dentro das margens de tolerância
}

// Função para imprimir informações de depuração no Serial
void printDebug(int temperature, int temperatureThreshold, float gasSensorValue, int gasThreshold) {
  Serial.print("--------------------\n");
  Serial.print("Temperatura: ");
  Serial.print(temperature);
  Serial.print(", Limiar de Temperatura: ");
  Serial.print(temperatureThreshold);
  Serial.print(", Gás: ");
  Serial.print(gasSensorValue);
  Serial.print(", Limiar de Gás: ");
  Serial.println(gasThreshold);
}