/*
  Fichier d'intégration des différents modules présents sur
  l'Arduino UNO (Arduino Bras)

  Crédits : Louis Defauw et Nabil Nehri 

 */

/* LIBRARIES */
#include <Wire.h>
#include <Math.h>
#include "DynamixelSerial.h" // Librairie des dynamixels

/* DEFINES */
#define DEBUG true
#define EMERGENCY_PIN 11
#define SUCCESS_PIN 13
#define RECOVER_PIN 12
#define CONTACT_BAS_PIN 9
#define CONTACT_HAUT_PIN 8
// I2C
#define I2CMOTORARDUINO 4
#define MSB(xx) byte(xx >> 8)
#define LSB(xx) byte(xx & 0xFF)
#define FUNCTION(x) byte(x >> 4)
#define DATA(x) byte(x & 0x0F)
#define PACK(x,y) uint16_t(uint16_t(x << 8) + uint16_t(y))
#define LSBTOMSB(x) byte(x << 4)
// DYNAMIXEL
// 512 = milieu
#define GRABPLOT_LEFT 530 //
#define GRABPLOT_RIGHT 510 //
#define GRABGLASS_LEFT 600 //
#define GRABGLASS_RIGHT 500 //
#define HITCLAP_1 412 //
#define HITCLAP_0 762 //
#define READY_TO_HITCLAP_RIGHT 712 //
#define READY_TO_HITCLAP_LEFT 312 //
#define ANGLE_AMORCAGE_RIGHT 612
#define ANGLE_AMORCAGE_LEFT 412
#define ANGLE_TUBE_FERME 355
#define ANGLE_TUBE_OUVERT 90
#define DYN_GAUCHE 2
#define DYN_DROITE 4
#define DYN_LEVAGE 10
#define DYN_TUBE 8
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
// Rotary Encoder
volatile int compteur = 0;

/* SETUP */
void setup()
{
  // DEBUG
  DEBUG_BEGIN(9600);
  DEBUG_PRINTLN("You started a debug session");
  DEBUG_PRINTLN("To disable it, change de DEFINE DEBUG to false.");
  // I2C
  Wire.begin(I2CMOTORARDUINO);
  Wire.onRequest(requestEvent); 
  Wire.onReceive(receiveEvent); 
  // Emergency, succes, recover
  pinMode(EMERGENCY_PIN, OUTPUT);
  pinMode(SUCCESS_PIN, OUTPUT);
  digitalWrite(EMERGENCY_PIN,0);
  digitalWrite(SUCCESS_PIN,0);
  pinMode(RECOVER_PIN, INPUT_PULLUP);
  // Rotary Encoder
  pinMode(2, INPUT);
  attachInterrupt(0, interrupt, CHANGE);
  pinMode(CONTACT_BAS_PIN, INPUT_PULLUP);
  pinMode(CONTACT_HAUT_PIN, INPUT_PULLUP);
  // Dynamixel 
  pinMode(4, OUTPUT);
  digitalWrite(4, HIGH);
  Dynamixel.begin(1000000, 7); //initialise la transmission série entre le Dynamixel et l’Arduino.

  //delay(1000);
  AmorcagePince();
  FermeTube();
  //delay(1000);
  //GrabBall();
  //AscensseurPlot(1);
  //delay(1000);
  //PutPlotOnOtherPlot();
  //delay(1000);
  //HITCLAP(1); 
}

/* LOOP */
void loop(){
  delay(10);
  //delay(1000);
  //GrabPlot();
  //delay(1000);
  //PutPlotOnOtherPlot();
  //GrabGlass();
  //delay(1000);
  //ReleasePlot();
  //delay(1000);
  //AmorcagePince();
}

/* FUNCTIONS */
// I2C
void requestEvent(){
  // Nothing to send
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

void HaveToWork(byte function, uint16_t data){ // Que faire en fonction des bits recus
  digitalWrite(SUCCESS_PIN,0);
  switch(function){
    case 0: // Réinitialisation
      DEBUG_PRINTLN("AmorcagePince");
      AmorcagePince();
      break;
    case 1: // Grab
      DEBUG_PRINTLN("GrabPlot");
      GrabPlot();
      break;
    case 2:
      DEBUG_PRINTLN("PutPlotOnOtherPlot");
      PutPlotOnOtherPlot();
      break;
    case 3:
      DEBUG_PRINTLN("GrabGlass");
      GrabGlass();
      break;
    case 4:
      DEBUG_PRINTLN("GrabBall");
      GrabPlot();
      break;
    case 5:
      DEBUG_PRINTLN("Release");
      Release();
      break;
    case 6:
      DEBUG_PRINTLN("FermeTube");
      FermeTube();
      break;
    case 7:
      DEBUG_PRINTLN("OuvrirTube");
      OuvrirTube();
      break;
    case 8:
      DEBUG_PRINTLN("Hit clap");
      if(data == 1) HITCLAP(1);
      else HITCLAP(0); 
      break;
    case 9:
      DEBUG_PRINTLN("Prepa hit");
      if(data == 1){
        AnglePince(READY_TO_HITCLAP_LEFT,DYN_GAUCHE);
        AnglePince(READY_TO_HITCLAP_RIGHT,DYN_DROITE);
      }
      else{
        AnglePince(512,DYN_GAUCHE);
        AnglePince(512,DYN_DROITE);
      }
      AscensseurPlot(1);
    default: 
      break;
  }
}

void Success(){
  digitalWrite(SUCCESS_PIN, 1);
  // On attend une réponse de la RPi
  while(true) if(digitalRead(RECOVER_PIN) == 1) break;
  // Recover 
  digitalWrite(SUCCESS_PIN, 0);
  DEBUG_PRINTLN("Succes recover");
}

// I2C fonctions, Motor management
void AmorcagePince(){
  AnglePince(ANGLE_AMORCAGE_RIGHT,DYN_DROITE);
  AnglePince(ANGLE_AMORCAGE_LEFT,DYN_GAUCHE);
  //delay(200); //
  AscensseurPlot(0);
  //delay(200); //
  Success();
}

void Release(){
  AnglePince(ANGLE_AMORCAGE_RIGHT,DYN_DROITE);
  AnglePince(ANGLE_AMORCAGE_LEFT,DYN_GAUCHE);
  delay(200); //
  Success();
}

void FermeTube(){
  AnglePince(ANGLE_TUBE_FERME,DYN_TUBE);
  //delay(100); //
  Success();
}

void OuvrirTube(){
  AnglePince(ANGLE_TUBE_OUVERT,DYN_TUBE);
  //delay(100); //
  Success();
}

void AscensseurPlot(bool sens){
  // sens = 1 -> monter
  while(true){
    if(sens){
      Dynamixel.turn(DYN_LEVAGE, RIGTH, 700);
      if(digitalRead(CONTACT_HAUT_PIN) == 0) break;
    }
    else{
      Dynamixel.turn(DYN_LEVAGE, LEFT, 700);
      if(digitalRead(CONTACT_BAS_PIN) == 0) break;
    }
  }
  Dynamixel.turn(DYN_LEVAGE, LEFT, 0);  // Arrêt du levage
}

void AscensseurTransport(bool sens){
  // sens = 1 -> monter
  compteur = 0;
  int NombreTics = 20;
  while(true){
    if(sens){
      Dynamixel.turn(DYN_LEVAGE, RIGTH, 700);
      if(compteur >= NombreTics) break;
    }
    else{
      Dynamixel.turn(DYN_LEVAGE, LEFT, 700);
      if(digitalRead(CONTACT_BAS_PIN) == 0) break;
    }
  }
  Dynamixel.turn(DYN_LEVAGE, LEFT, 0);  
}

void AscensseurBall(bool sens){
  // sens = 1 -> monter
  compteur = 0;
  int NombreTics = 70;
  while(true){
    if(sens){
      Dynamixel.turn(DYN_LEVAGE, RIGTH, 700);
      if(compteur >= NombreTics) break;
    }
    else{
      Dynamixel.turn(DYN_LEVAGE, LEFT, 700);
      if(digitalRead(CONTACT_BAS_PIN) == 0) break;
    }
  }
  Dynamixel.turn(DYN_LEVAGE, LEFT, 0);  
}

void AnglePince(int angle, int ID){
  Dynamixel.moveSpeed(ID, angle, 700); // vitesse de 500
}

void HITCLAP(int side){
  if(side == 1) AnglePince(HITCLAP_1,DYN_DROITE);
  else AnglePince(HITCLAP_0,DYN_DROITE);
  delay(300); //
  Success();
}

/* Logique pour plot : 
On attrape le premier plot : AmorcagePince puis GrabPlot
On monte à hauteur voulue
Puis on se place devant un autre plot -> Utilise PutPlotOnOtherPlot
Puis on utilise GrapPlot
Etc.. 
*/
void GrabPlot(){
  AnglePince(GRABPLOT_LEFT,DYN_GAUCHE);
  AnglePince(GRABPLOT_RIGHT,DYN_DROITE);
  delay(300); //
  AscensseurPlot(1);
  Success();
}

void GrabBall(){
  AnglePince(GRABPLOT_LEFT,DYN_GAUCHE);
  AnglePince(GRABPLOT_RIGHT,DYN_DROITE);
  delay(300); //
  AscensseurBall(1);
  Success();
}

void GrabGlass(){
  AnglePince(GRABPLOT_LEFT,DYN_GAUCHE);
  AnglePince(GRABPLOT_RIGHT,DYN_DROITE);
  delay(300); //
  AscensseurTransport(1);
  Success();
}

void ReleasePlot(){
  AscensseurPlot(0);
  Release();
  Success();
}

void PutPlotOnOtherPlot(){
  Release();
  AscensseurPlot(0);
  Success();
}

// Rotary encoders interruptions
void interrupt(){
  compteur ++;
}
