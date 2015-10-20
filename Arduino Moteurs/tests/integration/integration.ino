/*
  Fichier d'intégration des différents modules présents sur
  l'Arduino MEGA 2560 (Arduino Motor)

  Crédits : Louis Defauw
            Alexis Paques
            Arnaud Iserentant

 * Configuration des pins. 
 * Nous utiliserons :
 * - Roue codeuse gauche ; 
 *            Pin 2 : vert => INT0 -- A
 *            Pin 3 : jaune => INT1 -- B
 * - Roue codeuse droite ; 
 *            Pin 19 : vert => INT4 -- A
 *            Pin 18 : jaune => INT5 -- B
 * - I2C ;
 *            Pin 20 : SDA
 *            Pin 21 : SCL
 * - Moteurs ;
 *            Pin 52 : DIR 1
 *            Pin 53 : DIR 2
 *            Pin 11 : PWM 1
 *            Pin 12 : PWM 2
 * - Ultrasons;
 *            Pin 22 : TRIG avant
 *            Pin 24 : TRIG droit
 *            Pin 26 : TRIG arrière
 *            Pin 28 : TRIG gauche
 *            Pin 23 : ECHO avant
 *            Pin 25 : ECHO droit
 *            Pin 27 : ECHO arrière
 *            Pin 29 : ECHO gauche
 * - Emergency Stop;
 *            Pin 35: 
 * 
 * TODO : REGULATION PWM en fonction des roues codeuses
 *        Gestion des capteurs
 * 
 */

/* LIBRARIES */
#include <Wire.h>
#include "NewPing.h"

/* DEFINES */
#define DEBUG true
#define EMERGENCY_PIN 35 // To choose
// I2C
#define I2CMOTORARDUINO 2
#define MSB(xx) byte(xx >> 8)
#define LSB(xx) byte(xx & 0xFF)
#define FUNCTION(x) byte(x >> 4)
#define DATA(x) byte(x & 0x0F)
#define PACK(x,y) uint16_t(uint16_t(x << 8) + uint16_t(y))
#define LSBTOMSB(x) byte(x << 4)
// MOTOR
#define speed 100
#define DIR1 52
#define PWM1 11
#define DIR2 53
#define PWM2 12
// SENSORS
#define SONAR_NUM 3
#define MAX_DISTANCE 200 // To change? (maximum distance)
#define NO_ECHO 200 // To change? (value returned if there's no ping echo)
// DEBUG
#if DEBUG
#define DEBUG_BEGIN(x); Serial.begin(x);
#define DEBUG_PRINT(x); Serial.print(x);
#define DEBUG_PRINTLN(x); Serial.println(x);
#else
#define DEBUG_BEGIN(x);
#define DEBUG_PRINT(x);
#define DEBUG_PRINTLN(x);
#endif

/* VARS */
// I2C
byte I2CDataOut[2];
// US sensors
NewPing sonar[SONAR_NUM] = {
  NewPing(22,23,MAX_DISTANCE),
  NewPing(24,25,MAX_DISTANCE),
  NewPing(26,27,MAX_DISTANCE)};
// Motors
// Rotary encoder
volatile unsigned long compteurGauche = 0;
volatile unsigned long compteurDroit = 0;
volatile boolean stateGaucheA = 0;
volatile boolean stateGaucheB = 0;
volatile boolean stateDroitA = 0;
volatile boolean stateDroitB = 0;

void setup()
{
  ///
  /// SETUP
  ///
  /* Communications */
  // DEBUG
  DEBUG_BEGIN(9600);
  DEBUG_PRINTLN("You started a debug session");
  DEBUG_PRINTLN("To disable it, change de DEFINE DEBUG to false.");
  // I2C
  Wire.begin(I2CMOTORARDUINO);
  Wire.onRequest(requestEvent); 
  Wire.onReceive(receiveEvent); 
  // EMERGENCY_PIN
  pinMode(EMERGENCY_PIN, OUTPUT);

  /* Régulation */
  // Moteurs
  pinMode(DIR1,OUTPUT);
  pinMode(PWM1,OUTPUT);
  pinMode(DIR2,OUTPUT);
  pinMode(PWM2,OUTPUT);
  // Rotary Encoder
  /*
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(20, INPUT);
  pinMode(21, INPUT);
  attachInterrupt(0, GaucheA, CHANGE);
  attachInterrupt(1, GaucheB, CHANGE);
  attachInterrupt(2, DroitA, CHANGE);
  attachInterrupt(3, DroitB, CHANGE);
  */
}

void loop()
{
  //regulate();
  checkSensors();
  delay(50); // délai minimum de 29ms 
}

// I2C
void requestEvent(){
  Recover();
  DEBUG_PRINT("Sending data via I2C \n");
  Wire.write(I2CDataOut,2);
}
void receiveEvent(int howMany){
  if (howMany = 2) {
    byte funcdata = Wire.read();
    byte datab = Wire.read();
    byte function = FUNCTION(funcdata);
    uint16_t data = PACK(DATA(funcdata), datab);
    HaveToWork(function, data);
  }else {
    while(Wire.available()){
      Wire.read();
    }
  }
}
void HaveToWork(byte function, uint16_t data)
{
  switch(function){
    case 0: 
      Stop();
      break;
    case 1:
      Forward(data);
      break;
    case 2:
      Backward(data);
      break;
    case 3:
      TurnLeft(data);
      break;
    case 4:
      TurnRight(data);
      break;
    default: 
      // Source = 0
      EmergencyStop(function, 0);
      break;
  }
}

// Regulation
void regulate(){
}

// Sensors
void checkSensors(){
  byte detected;
  for (int i = 0; i < SONAR_NUM; i++){
    detected = sonar[i].ping_cm();
    if(detected < 5) EmergencyStop(detected,1);
  }
}

// Rotary encoders interruptions
void GaucheA(){
  // Le HIGH permet de convertir la valeur en booléen
  stateGaucheA=digitalRead(2) == HIGH;
  compteurGauche += (stateGaucheA != stateGaucheB) ? +1 : -1;
}
void GaucheB(){
  stateGaucheB=digitalRead(3) == HIGH;
  compteurGauche += (stateGaucheA == stateGaucheB) ? +1 : -1;
}
void DroitA(){
  stateDroitA=digitalRead(19) == HIGH;
  compteurDroit += (stateDroitA != stateDroitB) ? +1 : -1;
}
void DroitB(){
  stateDroitB=digitalRead(18) == HIGH;
  compteurDroit += (stateDroitA == stateDroitB) ? +1 : -1;
}

// I2C fonctions
void Stop(){
  digitalWrite(DIR1, 0);
  digitalWrite(DIR2, 0);
  digitalWrite(PWM1, 0);
  digitalWrite(PWM2, 0);
}
void Forward(uint16_t data){
  digitalWrite(DIR1, 1);
  digitalWrite(DIR2, 1);
  digitalWrite(PWM1, 0);
  digitalWrite(PWM2, 0);
}
void Backward(uint16_t data){
  digitalWrite(DIR1, 0);
  digitalWrite(DIR2, 0);
  digitalWrite(PWM1, 1);
  digitalWrite(PWM2, 1);
}
void TurnLeft(uint16_t data){
  digitalWrite(DIR1, 1);
  digitalWrite(DIR2, 0);
  digitalWrite(PWM1, 0);
  digitalWrite(PWM2, 1);
}
void TurnRight(uint16_t data){
  digitalWrite(DIR1, 0);
  digitalWrite(DIR2, 1);
  digitalWrite(PWM1, 1);
  digitalWrite(PWM2, 0);
}
inline void Recover(){
  digitalWrite(EMERGENCY_PIN, 0);
}
void EmergencyStop(byte data, int source){
  Stop();
  switch(source){
    case 0:
      DEBUG_PRINT("Emergency stop from I2C undefined function:");
      DEBUG_PRINTLN(data);
      I2CDataOut[0] = byte(0);
      I2CDataOut[1] = data;
      digitalWrite(EMERGENCY_PIN, 1);
      break;
    case 1:
      DEBUG_PRINT("Emergency stop from US sensors:");
      DEBUG_PRINTLN(data);
      I2CDataOut[0] = byte(1);
      I2CDataOut[1] = data;
      digitalWrite(EMERGENCY_PIN, 1);
      break;
    default:
      break;
  }
}
