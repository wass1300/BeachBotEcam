// 
#include <Wire.h>

void setup()
{
  Serial.begin(9600);
  Wire.begin(); // join i2c bus (address optional for master)
}

byte x = 0;

void loop()
{
  // Ecriture sur l'I2C
  Wire.beginTransmission(2); // transmit to device #2
  Wire.write("x is ");        // sends five bytes
  Wire.write(x);              // sends one byte  
  Wire.endTransmission();    // stop transmitting
  // print for debug
  Serial.print("x est ");
  Serial.print(x);
  Serial.print("\n");  
  x++;
  
  // Ne pas oublier de mettre un delai entre les opérations sur l'I2C
  delay(1000);
  
  // Request on IC2C
  Wire.requestFrom(2, 6);    // request 6 bytes from slave device #2

  while(Wire.available())    // slave may send less than requested
  { 
    char c = Wire.read(); // receive a byte as character
    Serial.print(c);         // print the character
  }
  Serial.print("\n");
  
  delay(1000);
}


