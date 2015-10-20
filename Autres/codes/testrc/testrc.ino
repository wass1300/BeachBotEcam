/* Test des roues codeuses (via de0 nano)
 *
 * Auteurs : Louis Defauw, Alexis Paques
 * Dates : 19/03/2015
 * Etat : fonctionnel
 */

/* LIBRARIES */
#include <Wire.h>
#include <Math.h>

/* DEFINES */
#define DEBUG true
// I2C
#define I2CMOTORARDUINO 8
#define MSB(xx) byte(xx >> 8)
#define LSB(xx) byte(xx & 0xFF)
#define FUNCTION(x) byte(x >> 4)
#define DATA(x) byte(x & 0x0F)
#define PACK(x,y) uint16_t(uint16_t(x << 8) + uint16_t(y))
#define LSBTOMSB(x) byte(x << 4)
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
byte regs[4];
// Rotary encoder
volatile unsigned int distX = 0;
volatile unsigned int distY = 0;
volatile unsigned long compteurGauche = 0;
volatile unsigned long compteurDroit = 0;
volatile boolean stateGaucheA = 0;
volatile boolean stateGaucheB = 0;
volatile boolean stateDroitA = 0;
volatile boolean stateDroitB = 0;

/* SETUP */
void setup()
{
  // DEBUG
  DEBUG_BEGIN(9600);
  DEBUG_PRINTLN("You started a debug session");
  DEBUG_PRINTLN("To disable it, change de DEFINE DEBUG to false.");
  // I2C
  regs[0] = 0x09;
  regs[1] = 0x09;
  regs[2] = 0x04;
  regs[3] = 0x08;
  Wire.begin(I2CMOTORARDUINO);
  Wire.onRequest(requestEvent); 
  Wire.onReceive(receiveEvent); 
  // Rotary Encoder
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(18, INPUT);
  pinMode(19, INPUT);
  attachInterrupt(0, GaucheA, CHANGE);
  attachInterrupt(1, GaucheB, CHANGE);
  attachInterrupt(4, DroitA, CHANGE);
  attachInterrupt(5, DroitB, CHANGE);
}

/* LOOP */
void loop()
{
  DEBUG_PRINTLN("Valeurs des roues codeuse:");
  DEBUG_PRINT(compteurGauche);
  DEBUG_PRINT(" ");
  DEBUG_PRINTLN(compteurDroit);
  delay(1000); // Définit la rapidité de la régulation
}

/* FUNCTIONS */
// I2C
void requestEvent(){
  DEBUG_PRINT("Sending data via I2C:");
  DEBUG_PRINTLN(4);
  Wire.write(regs,4);
}

void receiveEvent(int howMany){
  int byteCounter = 0;
  DEBUG_PRINT("Receiving bytes via I2C:");
  DEBUG_PRINTLN(howMany);
  byte temp = 0;
  while(byteCounter < howMany){
    byte b = Wire.read();
    byteCounter++;
    DEBUG_PRINTLN(b);
    if(byteCounter == 1) temp = b;
    else{
        byte funcdata = temp;
        byte datab = b;
        byte function = FUNCTION(funcdata);
        uint16_t data = PACK(DATA(funcdata), datab);
        HaveToWork(function, data);
    }
  }
}

void HaveToWork(byte function, uint16_t data)
{
  data = data*16.0; // !!! on recoit des cm ou des degrés => il faut les transformer !!!
  switch(function){
    case 1: // STOP
      DEBUG_PRINTLN("stop");
      break;
    case 2: // FORWARD
      DEBUG_PRINTLN("forward");
      break;
    case 3: // BACKWARD
      DEBUG_PRINTLN("back");
      break;
    case 4: // TURN LEFT
      DEBUG_PRINTLN("left");
      break;
    case 5: // TURN RIGHT
      DEBUG_PRINTLN("right");
      break;
    default: 
      // Source = 0
      DEBUG_PRINTLN("!!!!stop");
      break;
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
