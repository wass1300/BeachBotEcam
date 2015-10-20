// ---------------------------------------------------------------------------
// This example code was used to successfully communicate with 15 ultrasonic sensors. You can adjust
// the number of sensors in your project by changing SONAR_NUM and the number of NewPing objects in the
// "sonar" array. You also need to change the pins for each sensor for the NewPing objects. Each sensor
// is pinged at 33ms intervals. So, one cycle of all sensors takes 495ms (33 * 15 = 495ms). The results
// are sent to the "oneSensorCycle" function which currently just displays the distance data. Your project
// would normally process the sensor results in this function (for example, decide if a robot needs to
// turn and call the turn function). Keep in mind this example is event-driven. Your complete sketch needs
// to be written so there's no "delay" commands and the loop() cycles at faster than a 33ms rate. If other
// processes take longer than 33ms, you'll need to increase PING_INTERVAL so it doesn't get behind.
// ---------------------------------------------------------------------------

/*  Script Arduino permettant le guidage du robot UNIQUEMENT  
 *  pour suivre les lignes tracées en noir sur le terrain.
 *  Ce guidage a pour but d'amener le robot aux clapets pour
 *  que celui-ci les actionne.
 *  Deux capteurs sont utilisées : - TCRT5000 (phototransistor)
 *                                 - Capteur ultrason
 *  Auteur : M. Bouzanih
 *  Version 1.0 [17/02/2015]
 */
 
#include <NewPing.h>

#define SONAR_NUM     2 // Number of sensors.
#define MAX_DISTANCE 200 // Maximum distance (in cm) to ping.
#define PING_INTERVAL 43 // Milliseconds between sensor pings (29ms is about the min to avoid cross-sensor echo). defaut : 33

unsigned long pingTimer[SONAR_NUM]; // Holds the times when the next ping should happen for each sensor.
unsigned int cm[SONAR_NUM];         // Where the ping distances are stored.
uint8_t currentSensor = 0;          // Keeps track of which sensor is active.
NewPing sonar[SONAR_NUM] = {     // Sensor object array.
  NewPing(5, 4, MAX_DISTANCE), // Each sensor's trigger pin, echo pin, and max distance to ping.
  NewPing(3, 2, MAX_DISTANCE)
};

// moteur gauche
int motor1Pin1 = 8;    // pin 3 (Input 1)  du L293D
int motor1Pin2 = 9;    // pin 4 (Input 2) du L293D
int enable1 = 10;     // pin 2 (Enable 1) du L293D

//moteur droit
int motor2Pin1 = 12;    // pin 12 (Input 1)  du L293D 
int motor2Pin2 = 13;    // pin 13 (Input 2) du L293D
int enable2 = 11;     // pin 11 (Enable 2) du L293D

int seuil_D = 610; // max = 900
int seuil_G = 770; // max = 915
int color = 1; // 1 pour jaune et 0 pour vert

// Sensor
int ir_right;
int ir_left;



void setup() 
{
      Serial.begin(115200);
      pinMode(motor1Pin1, OUTPUT);
      pinMode(motor1Pin2, OUTPUT);
      pinMode(enable1, OUTPUT);
    
      pinMode(motor2Pin1, OUTPUT);
      pinMode(motor2Pin2, OUTPUT);
      pinMode(enable2, OUTPUT);
      // Mettre la broche Enable a high
      digitalWrite(enable1, HIGH);
      digitalWrite(enable2, HIGH);
      pingTimer[0] = millis() + 75;           // First ping starts at 75ms, gives time for the Arduino to chill before starting.
      for (uint8_t i = 1; i < SONAR_NUM; i++) // Set the starting time for each sensor.
        pingTimer[i] = pingTimer[i - 1] + PING_INTERVAL;
}

void loop() 
{
    ir_right = analogRead(A0); // lecture data capteur droit
    delay(2);
    ir_left = analogRead(A1); // gauche

    for (uint8_t i = 0; i < SONAR_NUM; i++) 
    { // Loop through all the sensors.
        if (millis() >= pingTimer[i]) 
        {         // Is it this sensor's time to ping?
            pingTimer[i] += PING_INTERVAL * SONAR_NUM;  // Set next time this sensor will be pinged.
            if (i == 0 && currentSensor == SONAR_NUM - 1) oneSensorCycle(); // Sensor ping cycle complete, do something with the results.
            sonar[currentSensor].timer_stop();          // Make sure previous timer is canceled before starting a new ping (insurance).
            currentSensor = i;                          // Sensor being accessed.
            cm[currentSensor] = 150;                      // Make distance zero in case there's no ping echo for this sensor.
            sonar[currentSensor].ping_timer(echoCheck); // Do the ping (processing continues, interrupt will call echoCheck to look for echo).
          }
    }
    // Other code that *DOESN'T* analyze ping results can go here.
/*
      Serial.print("droite:");
      Serial.print(ir_right);
      Serial.print("\t gauche:");
      Serial.println(ir_left); 
 */ 
    /* Les 4 variables qui suivent représentent des vitesses qui 
     * varient en fonction de la valeur analogique des capteurs. 
     * Cela demande bcp d'énergie, à tester avec le robot principal.
     */
    int vit_D = (ir_left/1023)*260 ;
    int vit_DC = (ir_left/1023)*150 ;
    int vit_G = (ir_right/1023)*260 ;
    int vit_GC = (ir_right/1023)*150 ;
    
    if((ir_right > seuil_D) and (ir_left > seuil_G) ) 
    { // Si les 2 capteurs voient noir
        if(color == 1) // si le robot commence en zone jaune
        {
            //tourner à droite
            turnRight(255, 120 );
            stop(200);
        }
        else
        {
            //tourner à droite
            turnLeft(255, 120 );
            stop(200);
        }
        
    }
    else if((ir_right < seuil_D) and (ir_left > seuil_G))
    { // Si le capteur gauche détecte le noir
        //tourner à gauche
        turnRight( 255 , 120);      
    }
    else if((ir_right > seuil_D) and (ir_left < seuil_G))
    { // Si le capteur droit détecte le noir
        //tourner à gauche
        turnLeft( 255 , 120);      
    }
    else
    {
        //aller tout droit
        goStraight(180);
    }
}

/***********************************************************************************/
/********************************** Fonctions **************************************/
/***********************************************************************************/
void turnLeft(int maxi, int mini)
{
      analogWrite(motor1Pin1, maxi); //255
      analogWrite(motor1Pin2, 0);  
    
      analogWrite(motor2Pin1, 0);
      analogWrite(motor2Pin2, mini); //80
}

void turnRight(int maxi, int mini)
{
      analogWrite(motor1Pin1, 0);
      analogWrite(motor1Pin2, mini); //80 
      
      analogWrite(motor2Pin1, 0);   
      analogWrite(motor2Pin2, maxi); //255
}

void goStraight(int mean)
{
      analogWrite(motor1Pin1, mean); //150
      analogWrite(motor1Pin2, 0);  

      analogWrite(motor2Pin1, 0);   
      analogWrite(motor2Pin2, mean); //150
}

void stop(int temps)
{
      analogWrite(motor1Pin1, 0);
      analogWrite(motor1Pin2, 0);  
      
      analogWrite(motor2Pin1, 0);   
      analogWrite(motor2Pin2, 0);
      delay(temps); 
}

void echoCheck() 
{ // If ping received, set the sensor distance to array.
  if (sonar[currentSensor].check_timer())
    cm[currentSensor] = sonar[currentSensor].ping_result / US_ROUNDTRIP_CM;
}

void oneSensorCycle() 
{ // Sensor ping cycle complete, do something with the results.
  // The following code would be replaced with your code that does something with the ping results.
  for (uint8_t i = 0; i < SONAR_NUM; i++) 
  {
    Serial.print(i);
    Serial.print("=");
    Serial.print(cm[i]);
    Serial.print("cm ");
  }
  Serial.println();
  
}
