/*
 * Nouvelle gestion des capteurs ultrasons 
 *  -> Plus de pulseIn()
 * 
 * Crédits :
 *  https://code.google.com/p/arduino-new-ping/
 *  Louis Defauw
 * TESTS : OK
 */

/* LIBRARY */
#include "NewPing.h"


/* DEFINES */
#define DEBUG true
// SENSORS
#define SONAR_NUM 3
#define MAX_DISTANCE 300 // To change? Maximum distance we want to ping for (in centimeters)
#define NO_ECHO 0 // To change? Value returned if there's no ping echo within the specified MAX_SENSOR_DISTANCE or max_cm_distance.
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
// US SENSORS
NewPing sonar[SONAR_NUM] = {
  NewPing(22,23,MAX_DISTANCE),
  NewPing(24,25,MAX_DISTANCE),
  NewPing(26,27,MAX_DISTANCE)};


void setup() {
  // DEBUG
  DEBUG_BEGIN(9600);
  DEBUG_PRINTLN("You started a debug session");
  DEBUG_PRINTLN("To disable it, change de DEFINE DEBUG to false.");
}

void loop() { 
  checkSensors();                  
  delay(1000); // délai minimum de 29ms 
}

// Sensors
void checkSensors(){
  byte detected;
  DEBUG_PRINTLN("Checking Sensors: ");
  for (int i = 0; i < SONAR_NUM; i++){
    DEBUG_PRINT("Sonar");
    DEBUG_PRINT(i);
    DEBUG_PRINT(":");
    DEBUG_PRINTLN(sonar[i].ping_cm());
    //detected = 0;
    //detected = (int) sonar[i].ping();
    //DEBUG_PRINTLN(detected);
    //if (detected) DEBUG_PRINTLN("Emergency STOP"); // Emergency stop
  }
}

