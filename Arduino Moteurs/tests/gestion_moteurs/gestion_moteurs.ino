/*
 * Fichier de gestion des moteurs
 * 
 */


// DEBUG
#define DEBUG true
#if DEBUG
#define msg(m) Serial.print(m)
#define dbg(d) Serial.begin(d)
#else
#define msg(m)
#define dbg(d)
#endif


// Motors
#define DIR1 52 // motor B first
#define PWM1 11 // motor B second
#define DIR2 53 // motor A first
#define PWM2 12 // motor A second
#define FORWARD 'f'
#define BACKWARD 'b'
#define LEFT  'l'
#define RIGHT 'r'
#define STOP 's'


// Setup
void setup(){
  //Debug
  dbg(9600);
  
  // Motors
  pinMode(DIR1,OUTPUT);
  pinMode(PWM1,OUTPUT);
  pinMode(DIR2,OUTPUT);
  pinMode(PWM2,OUTPUT);
}


// Main loop
void loop(){
  char loopAll[] ={FORWARD, BACKWARD, RIGHT, LEFT};
  for(int i = 0; i < sizeof(loopAll); i++){
  	msg("Instruction: ");
  	msg(loopAll[i]);
  	msg("\n");
  	motorManagement(loopAll[i]);
  	delay(3000);
  	msg(STOP);
  	msg("\n");
  	motorManagement(STOP);
  	delay(1000);
  }
}


// Motor management
void motorManagement(char instruction){
  switch(instruction){
    case FORWARD: // forward
      digitalWrite(DIR1, 1);
      digitalWrite(DIR2, 1);
      digitalWrite(PWM1, 0);
      digitalWrite(PWM2, 0);
      break;
    case LEFT: // left
      digitalWrite(DIR1, 1);
      digitalWrite(DIR2, 0);
      digitalWrite(PWM1, 0);
      digitalWrite(PWM2, 1);
      break;
    case RIGHT: // right
      digitalWrite(DIR1, 0);
      digitalWrite(DIR2, 1);
      digitalWrite(PWM1, 1);
      digitalWrite(PWM2, 0);
      break;
    case BACKWARD: // backward
      digitalWrite(DIR1, 0);
      digitalWrite(DIR2, 0);
      digitalWrite(PWM1, 1);
      digitalWrite(PWM2, 1);
      break;
    default: // stop if default
      digitalWrite(DIR1, 0);
      digitalWrite(DIR2, 0);
      digitalWrite(PWM1, 0);
      digitalWrite(PWM2, 0);
      break;
  }
}
