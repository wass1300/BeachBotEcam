/*
  Fichier d'intégration des différents modules présents sur
  l'Arduino MEGA 2560 (Arduino Motor)


  TEST DE LA REGULATION OK !!

  
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
 *            Pin 52 : DIR Gauche 1
 *            Pin 53 : DIR Droit 2
 *            Pin 11 : PWM Gauche 1
 *            Pin 12 : PWM Droit 2
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
#include <Math.h>

/* DEFINES */
#define DEBUG true
#define EMERGENCY_PIN 35 // To choose
#define SUCCESS_PIN 34 // To choose
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
#define DIRGauche 52
#define PWMGauche 11
#define DIRDroit 53
#define PWMDroit 12
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
volatile signed long compteurGauche = 0;
volatile signed long compteurDroit = 0;
volatile boolean stateGaucheA = 0;
volatile boolean stateGaucheB = 0;
volatile boolean stateDroitA = 0;
volatile boolean stateDroitB = 0;
// Regulation
float Error = 0;
float ErrorGlis = 0;
float CMDGauche = 0;
float CMDDroit = 0;
boolean DIRG = true;
boolean DIRD = true;
float MaxSpeed = 127; // 0 to 255
float Consigne = 0;
float ConsigneGlis = 0;
float kp = 0.03125;
float kig = 0.0122;

void setup()
{
  ///
  /// SETUP
  ///
  /* Communications */
  // DEBUG
  DEBUG_BEGIN(9600);
  DEBUG_PRINTLN("You started a debug session");
  DEBUG_PRINTLN("To disable it, change the DEFINE DEBUG to false.");
  /*
  // I2C
  Wire.begin(I2CMOTORARDUINO);
  Wire.onRequest(requestEvent); 
  Wire.onReceive(receiveEvent); 
  */
  // EMERGENCY_PIN
  pinMode(EMERGENCY_PIN, OUTPUT);

  /* Régulation */
  // Moteurs
  pinMode(DIRGauche,OUTPUT);
  pinMode(PWMGauche,OUTPUT);
  pinMode(DIRDroit,OUTPUT);
  pinMode(PWMDroit,OUTPUT);
  // Rotary Encoder
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(18, INPUT);
  pinMode(19, INPUT);
  attachInterrupt(0, GaucheA, CHANGE);
  attachInterrupt(1, GaucheB, CHANGE);
  attachInterrupt(4, DroitA, CHANGE);
  attachInterrupt(5, DroitB, CHANGE);

  regulateInit(4000,0.0);  
}

void loop()
{
  for(int i = 0; i < 50; i++){
    regulate();
    delay(10); 
  }
  DEBUG_PRINTLN("Valeurs : consigne(glis), compteurGauche/Droit");
  DEBUG_PRINTLN(Consigne);
  DEBUG_PRINTLN(ConsigneGlis);
  DEBUG_PRINTLN(compteurGauche);
  DEBUG_PRINTLN(compteurDroit);
  DEBUG_PRINTLN("Valeurs : CMDGauche/Droit, Error(glis)");
  DEBUG_PRINTLN(CMDGauche);
  DEBUG_PRINTLN(CMDDroit);
  DEBUG_PRINTLN(Error);
  DEBUG_PRINTLN(ErrorGlis);
  //checkSensors();
  //delay(50); // délai minimum de 29ms 
}

/*
// I2C
void requestEvent(){
  Recover();
  DEBUG_PRINT("Sending data via I2C \n");
  Wire.write(I2CDataOut,2);
}
void receiveEvent(int howMany){
  FlushRegulation();
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
  data = data*16.0;
  switch(function){
    case 0: // STOP
      stopMotors();
      break;
    case 1: // FORWARD
      regulateInit(data,0.0);      
      break;
    case 2: // BACKWARD
      regulateInit((-1)*data,0.0);
      break;
    case 3: // TURN LEFT
      regulateInit(0.0,(-1)*data);
      break;
    case 4: // TURN RIGHT
      regulateInit(0.0,data);
      break;
    default: 
      // Source = 0
      EmergencyStop(function, 0);
      break;
  }
}
*/

// Regulation
// Regulation
void regulateInit(float Depl, float Glis){
  FlushRegulation();
  Consigne = Depl;
  ConsigneGlis = Glis;
}

void regulate(){
  // CMDGauche : Commande du moteur de gauche
  // CMDDroit : Commande du moteur droit
  // Error,ErrorGlis
  // MaxSpeed : Maximum speed
  // kp,kig
  // Consigne
  // ConsigneGlis
  if(Consigne == 0 and ConsigneGlis == 0){
    stopMotors();
    return;
  }

  ErrorGlis = compteurGauche - compteurDroit;
  if((abs(ErrorGlis - ConsigneGlis))>100*4000) 
    EmergencyStop((ErrorGlis - ConsigneGlis)/200,2);
  //Moyenne = (compteurGauche + compteurDroit) /2;
  Error = Consigne-((compteurGauche + compteurDroit) /2);
  
  // Commande générale
  CMDGauche = kp * Error;
  CMDDroit = kp * Error;
  // Commande de glissement
  // Si ErrorGlis est supérieur à 0, alors le compteur gauche a été plus incrémenté donc la roue droite est en retard
  // Sinon, la roue gauche est en avance
  if(CMDDroit > MaxSpeed) CMDDroit = MaxSpeed;
  if(CMDGauche > MaxSpeed) CMDGauche = MaxSpeed;

  if(ErrorGlis>0){
    CMDDroit += kig * ErrorGlis;
    CMDGauche -= kig * ErrorGlis;
  } else 
  if(ErrorGlis<0){
    CMDDroit -= kig * ErrorGlis;
    CMDGauche += kig * ErrorGlis;
  }
  // Empêcher des commandes trop grandes
  if(CMDGauche < 0){
    CMDGauche = abs(CMDGauche);
    DIRG = false;
  }
  else DIRG = true;
  if(CMDDroit < 0){
    CMDDroit = abs(CMDDroit);
    DIRD = false;
  }
  else DIRD = true;
  
  // Envoi des commandes
  runMotors(DIRG,byte(CMDGauche),DIRD,byte(CMDDroit));
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


// Motor
void runMotors(boolean DirGauche, byte PWMG, boolean DirDroit, byte PWMD){
  digitalWrite(DIRGauche, DirGauche);
  digitalWrite(DIRDroit, DirDroit);
  analogWrite(PWMGauche, PWMG);
  analogWrite(PWMDroit, PWMD);
}

void stopMotors(){
  analogWrite(PWMGauche, 0);
  analogWrite(PWMDroit, 0);
  FlushRegulation();
}

void FlushRegulation(){
  compteurDroit = 0;
  compteurGauche = 0;
  Error = 0;
  ErrorGlis = 0;
  CMDGauche = 0;
  CMDDroit = 0;
  DIRD = true;
  DIRG = true;
  Consigne = 0;
  ConsigneGlis = 0;
}

inline void Recover(){
  digitalWrite(EMERGENCY_PIN, 0);
}

void EmergencyStop(byte data, int source){
  stopMotors();
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
    case 2:
      DEBUG_PRINT("Emergency stop from glissement:");
      DEBUG_PRINTLN(data);
      I2CDataOut[0] = byte(2);
      I2CDataOut[1] = data;
      digitalWrite(EMERGENCY_PIN, 1);
      break;
    default:
      break;
  }
}
