/* 
 * Test fonctionnant avec le fichier testi2c.py pour la Raspberry Pi 
 */
#include <Wire.h>

/*
 * The communication address bewteen the Raspberry and the Arduino. It has to be the same in each file.
 */
#define MYADRESS 8

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

// Motors
#define DIR1 31
#define PWM1 11
#define DIR2 30
#define PWM2 10

/*
 * Gobal variable
 */
byte actionToDo = 1;

/*
 * Setup the i2c communication
 */
void setup()
{
  DEBUG_BEGIN(9600);
  Wire.begin(MYADRESS);
  Wire.onRequest(Answer);
  Wire.onReceive(GotBytes);
  
  pinMode(13, OUTPUT);
  
  // Motor command connections
  pinMode(DIR1,OUTPUT);
  pinMode(PWM1,OUTPUT);
  pinMode(DIR2,OUTPUT);
  pinMode(PWM2,OUTPUT);
}

void loop()
{
  switch(actionToDo){
    // Stop the motor
    case 1:
      LedOff();
      DEBUG_MSGLN("Motor stopped");
      delay(100);
      
       // Motor command : forward
      analogWrite(PWM1, 0);
      analogWrite(PWM2, 0);
      break;
      
    // Going forwards
    case 2:
      blinkLed(1000);
      DEBUG_MSGLN("Going forwards");
      
       // Motor command : forward
      digitalWrite(DIR1, 1);
      digitalWrite(DIR2, 1);
      analogWrite(PWM1, 127);
      analogWrite(PWM2, 127);
      break;
      
    // Going backwards
    case 3:
      blinkLed(500);
      DEBUG_MSGLN("Going backwards");
      
      // Motor Command : Right
      digitalWrite(DIR1, 0);
      digitalWrite(DIR2, 0);
      analogWrite(PWM1, 127);
      analogWrite(PWM2, 127);
      break;
      
    // Turning left
    case 4:
      blinkLed(250);
      DEBUG_MSGLN("Turning left");
      
      // Motor Command : Left
      digitalWrite(DIR1, 1);
      digitalWrite(DIR2, 0);
      analogWrite(PWM1, 127);
      analogWrite(PWM2, 127);
      break;
      
    // Turning right
    case 5:
      blinkLed(100);
      DEBUG_MSGLN("Turning right");
      
      // Motor Command : Stop
      digitalWrite(DIR1, 0);
      digitalWrite(DIR2, 1);
      analogWrite(PWM1, 127);
      analogWrite(PWM2, 127);
      break;
      
    // In case of any other action
    default:
      DEBUG_MSGLN("Invalid action");
      delay(25);
      break;
  }
}

void Answer(){
}

/* 
 *  Function handled when a communication is established
 *  int howMany contains the number of bytes we have received for that communication
 *  @return void
 */
void GotBytes(int howMany)
{
  /*
   * If there are 2 exactly bytes
   */
  if (howMany = 2) {
    byte funcdata = Wire.read(); // Get the first byte of the communication
    byte datab = Wire.read(); // Get the second byte of the communication
    
    byte function = FUNCTION(funcdata); // Get the 4 bits of the action to do of the first byte
    uint16_t data = PACK(DATA(funcdata), datab); // Pack the 2 bytes into 16 bits
    
    actionToDo = function;
    
    DEBUG_MSGLN(function);
    DEBUG_MSGLN(funcdata);
    DEBUG_MSGLN(data);
    DEBUG_MSGLN(datab);
  } else { // If more than 2 bytes received, we read doing nothing
    while(Wire.available()){
      Wire.read();
    }
  }
}

void LedOn()
{
  digitalWrite(13, HIGH);
}

void LedOff()
{
  digitalWrite(13, LOW);
}

void blinkLed(int delayTime)
{
  LedOn();
  delay(delayTime);
  LedOff();
  delay(delayTime);
}

