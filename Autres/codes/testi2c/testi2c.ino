/* Test de la communication i2c RPi2 <-> Arduino
 *
 * Auteurs : Louis Defauw, Alexis Paques
 * Dates : 18/03/2015
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
}

/* LOOP */
void loop()
{
  delay(30); // Définit la rapidité de la régulation
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