/*

This is an example to implement I2C for the arduino

Alexis Paques
& Louis Defauw 

PRESENTS

I2C!

*/

// I2C pins:
// Uno, Ethernet A4 (SDA), A5 (SCL)
// Mega2560      20 (SDA), 21 (SCL)
// Leonardo      2 (SDA), 3 (SCL)
// Due           20 (SDA), 21 (SCL), SDA1, SCL1

// librairie I2C 
#include <Wire.h>

/* Constants */
const byte I2CSDA = A4;
const byte I2CSCL = A5;
byte* dataInPtr = NULL;

/* Setup, executed ONCE */

void setup() 
{
  Wire.begin(10); // Join the but to 0x10
  Wire.onRequest(requestEvent); // We will use Wire.write()
  Wire.onReceive(receiveEvent); // We will use Wire.read()
  Serial.begin(9600); 
}

/* MAIN loop, executed everytime */
void loop(){


}

void requestEvent(){
  Wire.write(0x00);
}
// We can set data in http://arduino.cc/en/Reference/EEPROM
// and get it to write it down here.
void receiveEvent(int numBytes){
  byte dataIn[numBytes];
  for(int i = 0; i<numBytes;i++){
    dataIn[i] = Wire.read();
  }
  dataInPtr = &dataIn[0];
  doWhatMasterWant(dataInPtr, numBytes);
}

// I am using numBytes to avoid to count the data when reading
// And because I give a pointer, not the whole DATA!
void doWhatMasterWant(byte* dataIn, int numBytes){
  // 7 = left, MSB and 0 = right, LSB
  // http://arduino.cc/en/Reference/BitRead
  
  // Je propose que le premier byte donne l'action et le second les infos pour?
  // Sinon, on n'envoie jamais qu'un byte pour les moteurs et c'est tout.
  // Pour les moteurs, 4 états et codés sur 2 bits.
  
  for(int i = 0; i<numBytes;i++){
    Serial.print(*dataIn);
    dataIn+1;
  }  
  
  
  /* Have to test it*/ 
  /*
  if ( bitRead(byte[1],7) & bitRead(byte[1],8) == B10){
    
  }
  //*/
}
