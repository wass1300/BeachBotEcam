/* 
  Génération d'une PWM avec une arduino
*/

// PWM Constants
const byte STOP = 0;
const byte LOW_PWM = 50;
const byte MED_PWM = 150;
const byte HIGH_PWM = 255;
// Simple FAST PWM mode  Turn ON when at 0 and OFF when it is at the counter value (via analog write) 

// PWM pins  3, 5, 6, 9, 10, and 11 (! they're digital pins)
const byte pwmPins[6] = {3, 5, 6, 9, 10, 11};

// Setup, we goes ONCE there.
void setup() {
  for (byte i = 0; i = 5; i = i + 1) {
    pinMode(pwmPins[i], OUTPUT);
  }
  
  // Initialize serial communication to DEBUG
  Serial.begin(9600); 
}

void loop(){
  
  for (byte i = 0; i = 5; i = i + 1) {
    analogWrite(pwmPins[i], LOW_PWM);
  }
  Serial.print("LOW");
  waitXSeconds(1); 
  
  for (byte i = 0; i = 5; i = i + 1) {
    analogWrite(pwmPins[i], MED_PWM);
  }
  Serial.print("MED");
  waitXSeconds(1); 
  
  for (byte i = 0; i = 5; i = i + 1) {
    analogWrite(pwmPins[i], HIGH_PWM);
  }
  Serial.print("HIGH");
  waitXSeconds(1); 
  
  for (byte i = 0; i = 5; i = i + 1) {
    analogWrite(pwmPins[i], STOP);
  }
  
  Serial.print("STOP");
  waitXSeconds(1);
  
}

void waitXSeconds(int seconds)
{
  delayMicroseconds(seconds*1000000); // 10^6 micro seconds to wait = 1 second
}
