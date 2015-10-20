#include "I2CBusMaster.h"
#include <Wire.h>

I2CBusMaster::I2CBusMaster(){
}

void I2CBusMaster::Begin()
{
  // Join as Master
  Wire.begin();
}

void I2CBusMaster::Send(byte adress, byte function, byte data)
{
  if(adress > 127) adress = 127;
  if(function > 255) function = 255;
  if(data > 255) data = 255;
  Wire.beginTransmission(adress);
  Wire.write(function);
  Wire.write(data);
  Wire.endTransmission();
}

void I2CBusMaster::Request(byte adress)
{
  // Flush the buffer ... we do not need this!
  Flush();
  Wire.requestFrom(adress, (byte)2);
  if (Wire.available() == 2){
    inBuffer[0] = Wire.read();
    inBuffer[2] = Wire.read();
  }
}

inline void I2CBusMaster::Flush(){
  while(Wire.available()){
    Wire.read();
  }
}
