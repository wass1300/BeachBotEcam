/* 
   Comportement de l'arduino comprenant la gestion des moteurs, du 
   (ou des) capteur(s) ultrason (US), et des roues codeuse

   Reste à faire :
      * Gestion des moteurs
      * Définition de ce qu'il y aura dans dataIn et dans dataOut
      * Gestion des roues codeuses
      * Définition des pins qui restent à faire 
      * Gestion de l'arrêt d'urgence (interruption ?)
      
   A vérifier avant d'utiliser (sans compter la RPi) :
      * L'assignation des pins
      * L'adresse de l'arduino
      * Le délai de loop()
      * Le nombre de bytes à envoyer lors de Wire.write()
      
   created 2014/10/16
   by Louis Defauw & Alexis Paques
*/

#include <Wire.h>

// Pour l'écriture de données sur l'I2C (write data)
const int lengthOut = 1; // nombre de bytes à envoyer à la RPi
byte dataOut[lengthOut]; // tableau des bytes à envoyer
// dataOut[0] = distance mesurée aux US
// ...

// Pour la lecture de données sur l'I2C (read data)
byte* dataInPtr = NULL; // Pointeur vers le tableau dataIn[]

// Définition des pins :
// ! Ne pas utiliser les pins A4 et A5 (car I2C)
const int pinInt = 6; // Interruption vers la RPi
const int pinUSvcc = 2; // Capteur US : vcc (directement sur du 5V sinon)
const int pinUStrig = 3; // Capteur US : triger
const int pinUSecho = 4; // Capteur US : echo
const int pinUSgnd = 5; // Capteur US : gnd (directement sur GND sinon)

void setup() {
  // Initialize pins
  pinMode (pinInt,OUTPUT);
  pinMode (pinUSvcc,OUTPUT);
  pinMode (pinUStrig,OUTPUT); 
  pinMode (pinUSecho,INPUT); 
  pinMode (pinUSgnd,OUTPUT); 
 
  // Initialize I2C
  Wire.begin(9); // join i2c bus with address #9
  Wire.onRequest(requestEvent); // register event
  Wire.onReceive(receiveEvent);  // receive event
  
  // Initialize serial communication
  Serial.begin(9600); 
}


void loop(){
  /* Gestion du capteur US */
  long duration;

  // US Sensor triggered by a HIGH pulse (au moins 2 ms)
  digitalWrite(pinUStrig, LOW); // short LOW pulse beforehand to ensure a clean HIGH pulse
  delayMicroseconds(2);
  digitalWrite(pinUStrig, HIGH);
  delayMicroseconds(5);
  digitalWrite(pinUStrig, LOW);

  // The same pin is used to read the signal from the US Sensor: a HIGH
  // pulse whose duration is the time (in microseconds) from the sending
  // of the ping to the reception of its echo off of an object.
  duration = pulseIn(pinUSecho, HIGH);

  // Convert the time into a distance
  dataOut[0] = (byte) microsecondsToCentimeters(duration);
  // Interruption pour la RPi ?
  if(dataOut[0] < 10){
    digitalWrite(pinInt, HIGH);
    // Il faut aussi arrêter les moteurs !
  }
  else{
    digitalWrite(pinInt, LOW);
  }
  
  // Print pour debug
 // Serial.print(dataOut[0]);
 // Serial.print(" cm, ");
  
    
  /* Gestion des roues codeuses */
  
  
  // Délai avant de recommencer 
  delay(500); // délai à regler !
}

long microsecondsToCentimeters(long microseconds){
  // The speed of sound is 340 m/s or 29 microseconds per centimeter.
  // The ping travels out and back, so to find the distance of the
  // object we take half of the distance travelled.
  return microseconds / 29 / 2;
}

void requestEvent(){
  Wire.write(dataOut,lengthOut); // Définir le nombre de bytes !
  Serial.print("requestEvent");
}

void receiveEvent(int numBytes){
  byte dataIn[numBytes];
  for(int i = 0; i < numBytes; i++){
    dataIn[i] = Wire.read();
  }
  Serial.print("receiveEvent");
  dataInPtr = &dataIn[0]; // Assignation du pointeur vers dataIn[0]
  doWhatMasterWant(dataInPtr, numBytes); // Principalement (uniquement ?) 
                                         // la gestion des moteurs
}

void doWhatMasterWant(byte* dataIn, int numBytes){
  /* Gestion des moteurs */
  // Directement en fonction de dataIn sauf si arret d'urgence
  
  // Utiliser la fonction analogWrite(pin, value) :
  //     value [0;255]
  //     duty cycle (DC) de la PWM : DC*256 - 1
  // http://arduino.cc/en/Reference/analogWrite
  
  // Je propose que le premier byte donne l'action et le second les infos pour
  // Sinon, on n'envoie jamais qu'un byte pour les moteurs et c'est tout.
  // Pour les moteurs, 4 états et codés sur 2 bits. (Alexis)
  //    => Pour moi on peut envoyer plus qu'un byte si besoin, ca posera pas
  //       de problème. (Louis)
  for(int i = 0; i < numBytes; i++){
    Serial.print(*dataIn);
    dataIn + 1;
  }  
  
  /* Have to test it*/ 
  // utiliser bitRead(byte, bit) 
  // http://arduino.cc/en/Reference/BitRead
  
}
