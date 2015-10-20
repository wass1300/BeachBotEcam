// Test : ok

#include <Wire.h>

#define MYADRESS 2

#define DEBUG true

/* DEBUG */
#if DEBUG
#define DEBUG_MSG(m); Serial.print(m);
#define DEBUG_MSGLN(m); Serial.println(m);
#define DEBUG_BEGIN(d); Serial.begin(d);
#else
#define DEBUG_MSG(m);
#define DEBUG_MSGLN(m); 
#define DEBUG_BEGIN(d);
#endif

/* MACROS I2C */
// Most significant byte of uint16_t
#define MSB(xx) byte(xx >> 8)
// Least significant byte of uint16_t
#define LSB(xx) byte(xx & 0xFF)
// Function from the MSB of uint16_t
#define FUNCTION(x) byte(x >> 4)
// Data from MSB
#define DATA(x) byte(x & 0x0F)
// Two bytes to an uint16_t
#define PACK(x,y) uint16_t(uint16_t(x << 8) + uint16_t(y))
// Send LSB to MSB
#define LSBTOMSB(x) byte(x << 4)

void setup()
{
  DEBUG_BEGIN(9600);
  Wire.begin(MYADRESS);
  pinMode(13, OUTPUT);
  Wire.onRequest(Answer);
  Wire.onReceive(GotBytes);
}

void loop()
{
  delay(25);
}


void Answer(){
}

void GotBytes(int howMany)
{
  if (howMany = 2) {
    byte funcdata = Wire.read();
    byte datab = Wire.read();
    byte function = FUNCTION(funcdata);
    uint16_t data = PACK(DATA(funcdata), datab);
    HaveToWork(function, data);
    DEBUG_MSGLN(function);
    DEBUG_MSGLN(data);
    DEBUG_MSGLN(datab);
    DEBUG_MSGLN(funcdata);
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
      LedOn(data);
      break;
    case 1:
      LedOff(data);
      break;
    default: 
      break;
  }
}

void LedOn(uint16_t data)
{
  digitalWrite(13, HIGH);
  DEBUG_MSGLN("N");
}
void LedOff(uint16_t data)
{
  digitalWrite(13, LOW);
  DEBUG_MSGLN("F");
}
