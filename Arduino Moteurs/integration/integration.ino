/*
  Fichier d'intégration des différents modules présents sur
  l'Arduino MEGA 2560 (Arduino Motor)

  Crédits : Louis Defauw
            Alexis Paques
            Arnaud Iserentant

 * Configuration des pins.
 * Nous utiliserons :
 * - Roue codeuse gauche;
 *            Pin 3 : imp
 *            Pin 5 : sens
 * - Roue codeuse droite;
 *            Pin 2 : imp
 *            Pin 4 : sens
 * - I2C;
 *            Pin 20 : SDA
 *            Pin 21 : SCL
 * - Moteurs;
 *            Pin 31 : DIR G
 *            Pin 30 : DIR D
 *            Pin 11 : PWM G
 *            Pin 10 : PWM D
 * - Emergency/Success/Recover;
 *            Pin 34 : Success
 *            Pin 35 : Emergency
 *            Pin 36 : Recover
 *
 * TODO : regler les paramètres de la régulation + utilisation de la succes pin
 *        vérifier qu'il n'y a pas de conflit avec les différentes utilisation des timers
 */

/* LIBRARIES */
#include <Wire.h>
#include <Math.h>

/* DEFINES */
#define DEBUG false
#define SUCCESS_PIN 34
#define EMERGENCY_PIN 35
#define RECOVER_PIN 36
#define STOP_PIN 37
// I2C
#define I2CMOTORARDUINO 8
#define MSB(xx) byte(xx >> 8)
#define LSB(xx) byte(xx & 0xFF)
#define FUNCTION(x) byte(x >> 4)
#define DATA(x) byte(x & 0x0F)
#define PACK(x,y) uint16_t(uint16_t(x << 8) + uint16_t(y))
#define LSBTOMSB(x) byte(x << 4)
// Motors
#define DIRGauche_PIN 30
#define PWMGauche_PIN 11
#define DIRDroit_PIN 31
#define PWMDroit_PIN 10
// Regulation
#define codG_PIN 2
#define codD_PIN 3
#define sensD_PIN 4
#define sensG_PIN 5
#define PWMmin 30
#define PI 3.14159265358979323846
#define imp 409.6
#define rayon 4.02 // (cm)
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
// Rotary encoder
volatile long compteurGauche = 0; // int : limite à +/-32,767 imp
volatile long compteurDroit = 0; // -> si 500imp/tour pas plus de 1280cm !!!!
volatile boolean sensD = 0; // long : on est large -> >>2 avant d'envoyer
volatile boolean impD = 0; // et faire <<2 sur la RPI !!!!!!!!
volatile boolean sensG = 0;
volatile boolean impG = 0;
// Regulation
int prevCompD = 1000;
int prevCompG = 1000;
volatile boolean timer = true;
volatile boolean contact = false;
volatile boolean finished = false;
float ErreurRot = 0;
float ErreurAvance = 0;
float SumErreurRot = 0;
float SumErreurAvance = 0;
float RegulRot = 0;
float RegulAvance = 0;
float ConsigneRot = 0;
float ConsigneAvance = 0;
float CMDGauche = 0;
float CMDDroit = 0;
boolean DIRG = true;
boolean DIRD = true;
int MaxSpeedAvance = 100; // 50 to 200
int MaxSpeedRot = 130;
float kpAvance = 0.41; // correct 0.410
float kpRot = 0.475; // correct 0.475
float kiAvance = 0.0057; // correct 0.0057
float kiRot = 0.0161; // correct 0.0161
int deltaCMD = 4;
int AntiEmballementAvance = 60; // au dessus de 40
int AntiEmballementRot = 60;

/* SETUP */
void setup()
{
  // DEBUG
  pinMode(13, OUTPUT);
  DEBUG_BEGIN(115200);
  DEBUG_PRINTLN("You started a debug session");
  DEBUG_PRINTLN("To disable it, change de DEFINE DEBUG to false.");
  // I2C
  Wire.begin(I2CMOTORARDUINO); // debut communication adresse 8
  Wire.onRequest(requestEvent);
  Wire.onReceive(receiveEvent);
  // Emergency, succes, recover
  pinMode(EMERGENCY_PIN, OUTPUT);
  pinMode(SUCCESS_PIN, OUTPUT);
  digitalWrite(EMERGENCY_PIN, 0);
  digitalWrite(SUCCESS_PIN, 0);
  pinMode(RECOVER_PIN, INPUT_PULLUP);
  pinMode(STOP_PIN, INPUT_PULLUP);
  // Moteurs (changement de la fréquence pwm à 31.3 kHz)
  TCCR1B = TCCR1B & B11111000 | B00000001; // D11 et D12
  TCCR2B = TCCR2B & B11111000 | B00000001; // D9 et D10
  pinMode(DIRGauche_PIN, OUTPUT);
  pinMode(PWMGauche_PIN, OUTPUT);
  pinMode(DIRDroit_PIN, OUTPUT);
  pinMode(PWMDroit_PIN, OUTPUT);
  stopMotors();
  // Rotary Encoder
  pinMode(codG_PIN, INPUT);
  attachInterrupt(0, Gauche, CHANGE); // pin 2. Appel à Gauche() à chaque interruption
  pinMode(codD_PIN, INPUT);
  attachInterrupt(1, Droit, CHANGE);  // pin 3  Appel à Droit() à chaque interruption
  pinMode(sensD_PIN, INPUT);
  pinMode(sensG_PIN, INPUT);
  impG = digitalRead(codG_PIN);
  impD = digitalRead(codD_PIN);
  sensG = digitalRead(sensG_PIN);
  sensD = digitalRead(sensD_PIN);

  DEBUG_PRINTLN("Fin setup");

  //digitalWrite(13,0);
  //delay(1000);
  //regulateInit(2000.0,0.0);
  //float data = 107.5; // 107.5 = 360 °
  //float perim = rayon * 10 * 2 * PI;
  //float dist_imp = perim / imp;
  //float dist = data * 10.0;
  //int num_imp = (int) dist / dist_imp;
  //delay(2000);
  //runMotors(0, 0, 0, 120);
  //delay(1000);
  //runMotors(0,120,0,0);
  //regulateInit(num_imp,0.0);
  //fermetureContacts();
}

/* LOOP */
void loop()
{
  if(timer){
  if(digitalRead(STOP_PIN) == 1){
    analogWrite(PWMGauche_PIN, 0);
    analogWrite(PWMDroit_PIN, 0);
    digitalWrite(EMERGENCY_PIN, 1);
    // On attend une réponse de la RPi
    while (true) if (digitalRead(RECOVER_PIN) == 1) break;
    // Recover
    digitalWrite(EMERGENCY_PIN, 0);
    regulateInit(0.0, 0.0);
  }
  if (contact) fermetureContacts();
  else regulate();
  }
  //DEBUG_PRINT("compteurDroit : ");
  //DEBUG_PRINTLN(compteurDroit);
  //DEBUG_PRINT("compteurGauche : ");
  //DEBUG_PRINTLN(compteurGauche);
  delay(25); // Définit la rapidité de la régulation
}

/* FUNCTIONS */
// I2C
void requestEvent() {
  DEBUG_PRINTLN("Sending data via I2C:");
  DEBUG_PRINT(compteurDroit);
  DEBUG_PRINT(" ; ");
  DEBUG_PRINTLN(compteurGauche);
  byte regs[] = {
    compteurDroit >> 24,
    compteurDroit >> 16,
    compteurDroit >> 8,
    compteurDroit,
    compteurGauche >> 24,
    compteurGauche >> 16,
    compteurGauche >> 8,
    compteurGauche
  };
  Wire.write(regs, 8);
}

void receiveEvent(int howMany) {
  int byteCounter = 0;
  DEBUG_PRINT("Receiving bytes via I2C:");
  DEBUG_PRINTLN(howMany);
  byte temp = 0;
  while (byteCounter < howMany) {
    byte b = Wire.read();
    byteCounter++;
    DEBUG_PRINTLN(b);
    if (byteCounter == 1) temp = b;
    else {
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
  /*
  impulsion/tour :
    512*2=1024 (2 chanel)
    1024*21=21504 (réducteur)
    imp = 2*21504/40=2*537.6= 1075.2 (div)
  perimetre roue :
    p=rayon*10*2*PI (en mm)
  dist par imp :
    dist_imp = p/imp
  dist voulue :
    dist = data*10
  imp :
    num_imp = dist/dist_imp
    
  correction angle : 107.5 = 360°
  107.5/360 = 1°
  */
  // !!! on recoit des cm ou des degrés => il faut les transformer !!!
  float perim = rayon * 10 * 2 * PI;
  float dist_imp = perim / imp;
  float dist = data * 10.0;
  float corr_angle = 107.5/360;
  float angle = data * 10.0 * corr_angle;
  int num_imp = (int) dist / dist_imp;
  int num_imp_angle = (int) angle / dist_imp;
  digitalWrite(SUCCESS_PIN, 0);
  switch (function) {
    case 1: // STOP
      DEBUG_PRINTLN("STOP");
      stopMotors();
      timer = false;
      break;
    case 2: // FORWARD
      DEBUG_PRINTLN("FORWARD");
      regulateInit(num_imp, 0.0);
      break;
    case 3: // BACKWARD
      DEBUG_PRINTLN("BACKWARD");
      regulateInit((-1)*num_imp, 0.0);
      break;
    case 4: // TURN LEFT
      DEBUG_PRINTLN("LEFT");
      regulateInit(0.0, (-1)*num_imp_angle);
      break;
    case 5: // TURN RIGHT
      DEBUG_PRINTLN("RIGHT");
      regulateInit(0.0, num_imp_angle);
      break;
    case 6: // Fermeture contacts
      DEBUG_PRINTLN("Fermeture contacts");
      contact = true;
      break;
    case 7:
      DEBUG_PRINTLN("Contacts OK");
      contact = false;
      regulateInit(0.0, 0.0);
      break;
    default:
      // Source = 0
      EmergencyStop();
      break;
  }
}

// Fermeture contacts
void fermetureContacts() {
  DEBUG_PRINTLN("Fermeturecontact");

  runMotors(0, 0, 0, PWMmin);
  delay(100);
  runMotors(0, PWMmin, 0, 0);
  delay(100);
  runMotors(0, 0, 0, 0);
  
  prevCompD = compteurDroit;
  prevCompD = compteurDroit;
}

// Regulation
void regulateInit(float Depl, float Glis) {
  digitalWrite(SUCCESS_PIN, 0);
  flushRegulation();
  ConsigneRot = Glis;
  ConsigneAvance = Depl;
  if (Glis == 0 and Depl == 0) finished = true;
  else finished = false;
  DEBUG_PRINTLN("INIT");
}

void regulate() {
  // Coeff
  float prevCMDGauche = CMDGauche;
  float prevCMDDroit = CMDDroit;

  // Calcul des erreurs
  // Rotation
  ErreurRot = ConsigneRot - (compteurGauche - compteurDroit) / 2;
  if (ConsigneRot == 0 and abs(ErreurRot) > 200) {
    EmergencyStop();
  }
  //Avance
  ErreurAvance = ConsigneAvance - (compteurGauche + compteurDroit) / 2;
  if (ConsigneAvance == 0 and abs(ErreurAvance) > 200) {
    EmergencyStop();
  }
  // Sum
  if (ErreurAvance < 300) {
    SumErreurAvance += ErreurAvance;
  }
  if (ErreurRot < 200){
    SumErreurRot += ErreurRot;
  }

  DEBUG_PRINT("ErreurRot : ");
  DEBUG_PRINTLN(ErreurRot);
  DEBUG_PRINT("ErreurAvance : ");
  DEBUG_PRINTLN(ErreurAvance);

  // Calcul des gains intermédiaires
  RegulRot = kiRot * SumErreurRot;
  if (abs(RegulRot) > AntiEmballementRot) {
    if (RegulRot < 0) RegulRot = - AntiEmballementRot;
    else RegulRot = AntiEmballementRot;
  }
  RegulAvance = kiAvance * SumErreurAvance;
  if (abs(RegulAvance) > AntiEmballementAvance) {
    if (RegulAvance < 0) RegulAvance = - AntiEmballementAvance;
    else RegulAvance = AntiEmballementAvance;
  }
  RegulRot += kpRot * ErreurRot;
  RegulAvance += kpAvance * ErreurAvance;

  // Commande moteur
  CMDDroit = RegulAvance - RegulRot;
  CMDGauche = RegulAvance + RegulRot;

  // Empêcher les commandes négatives
  if (CMDGauche < 0) {
    CMDGauche = abs(CMDGauche);
    DIRG = false;
  }
  else DIRG = true;
  if (CMDDroit < 0) {
    CMDDroit = abs(CMDDroit);
    DIRD = false;
  }
  else DIRD = true;

  // Démarrage progressif
  if ((CMDDroit - prevCMDDroit) > 3) CMDDroit = prevCMDDroit + 3;
  if ((CMDGauche - prevCMDGauche) > 3) CMDGauche = prevCMDGauche + 3;

  // Empêcher des commandes trop grande tout en n'empêchant pas la rotation
  int MaxSpeedGauche = MaxSpeedAvance;
  int MaxSpeedDroit = MaxSpeedAvance;
  if (ConsigneRot == 0 and abs(CMDDroit - CMDGauche) > deltaCMD) {
    if (CMDGauche > CMDDroit) MaxSpeedGauche += 20;
    else MaxSpeedDroit += 20;
  }
  if (CMDDroit > MaxSpeedDroit) CMDDroit = MaxSpeedDroit;
  if (CMDGauche > MaxSpeedGauche) CMDGauche = MaxSpeedGauche;

  if (abs(ErreurAvance) <= 15 and abs(ErreurRot) <= 15) { // Si 5 : précision +/- 2mm si 500 imp/tour
    if (!finished) {
      DEBUG_PRINTLN("SUCCES");
      digitalWrite(SUCCESS_PIN, 1);
      // On attend une réponse de la RPi
      while (true) if (digitalRead(RECOVER_PIN) == 1) break;
      // Recover
      digitalWrite(SUCCESS_PIN, 0);
      finished = true;
      regulateInit(0.0, 0.0);
      DEBUG_PRINTLN("Succes recover");
    }
    return;
  }

  DEBUG_PRINTLN("Cmd gauche + dir : ");
  DEBUG_PRINT(DIRG);
  DEBUG_PRINT(" ; ");
  DEBUG_PRINTLN(CMDGauche);
  DEBUG_PRINTLN("Cmd droit + dir : ");
  DEBUG_PRINT(DIRD);
  DEBUG_PRINT(" ; ");
  DEBUG_PRINTLN(CMDDroit);

  // Envoi des commandes
  runMotors(DIRG, byte(CMDGauche), DIRD, byte(CMDDroit));
}

void flushRegulation() {
  ErreurRot = 0;
  ErreurAvance = 0;
  RegulRot = 0;
  RegulAvance = 0;
  CMDDroit = 0;
  CMDGauche = 0;
  DIRD = true;
  DIRG = true;
  compteurDroit = 0;
  compteurGauche = 0;
  SumErreurRot = 0;
  SumErreurAvance = 0;

  DEBUG_PRINTLN("Flush");
}

// Rotary encoders interruptions
void Gauche() {
  // Le HIGH permet de convertir la valeur en booléen
  impG = digitalRead(codG_PIN) == HIGH;
  sensG = digitalRead(sensG_PIN) == HIGH; // sens = 0 -> décrémente, sens = 1 -> incrémente
  compteurGauche += (sensG == 1) ? +1 : -1;

  DEBUG_PRINT("compteurGauche : ");
  DEBUG_PRINTLN(compteurGauche);
}

// !!!!! LES 2 MOTEURS TOURNENT EN SENS INVERSE
void Droit() {
  impD = digitalRead(codD_PIN) == HIGH;
  sensD = digitalRead(sensD_PIN) == HIGH; // sens = 0 -> décrémente, sens = 1 -> incrémente
  compteurDroit += (sensD == 1) ? +1 : -1; // !! inverse si codeur moteur

  DEBUG_PRINT("compteurDroit : ");
  DEBUG_PRINTLN(compteurDroit);
}

// Motor management
void runMotors(boolean dirG, byte PWMG, boolean dirD, byte PWMD) {
  digitalWrite(DIRGauche_PIN, dirG); // mettre un - devant DirGauche
  digitalWrite(DIRDroit_PIN, !dirD); // ou DirDroit
  analogWrite(PWMGauche_PIN, PWMG);
  analogWrite(PWMDroit_PIN, PWMD);
}

void stopMotors() {
  regulateInit(0.0, 0.0);
  analogWrite(PWMGauche_PIN, 0);
  analogWrite(PWMDroit_PIN, 0);
}

// EmergencyStop management
void EmergencyStop() { // !! MODIFS !!
  // Arrêt d'urgence, quelle que soit la cause
  DEBUG_PRINTLN("Arrêt d'urgence");
  analogWrite(PWMGauche_PIN, 0);
  analogWrite(PWMDroit_PIN, 0);
  digitalWrite(EMERGENCY_PIN, 1);
  // On attend une réponse de la RPi
  while (true) if (digitalRead(RECOVER_PIN) == 1) break;
  // Recover
  digitalWrite(EMERGENCY_PIN, 0);
  regulateInit(0.0, 0.0);
  DEBUG_PRINTLN("Emergency recover");
}
