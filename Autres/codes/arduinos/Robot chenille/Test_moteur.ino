#include <DynamixelSerial.h>
// functional connections
//Moteur chenille
#define iA_gauche 0 // Motor A IA
#define iB_gauche 1 // Motor A IB
#define iA_droite 2 // Motor B IA
#define iB_droite 3 // Motor B IB
//Dynamixel
#define Rx 5  
#define Tx 4
#define DataControl 6 
//Setup
#define initpos 7  //Switch slide : Position initiale sur table : L à gauche et H à droite
#define start 8 // Switch de démarage lié au bouton d'arrêt d'urgence
//Moteur pas à pas
#define Demux 9 //Demux control
#define IN1 10 
#define IN2 11 
#define IN3 12 
#define IN4 13
//Capteur ultrason
#define Trig A4
#define Echo A5

//variable du parcours : trajet jusqu'à l'escalier, rotation, escalade de l'escalier, déroulement du tapis
int trajet = 80; //valeur dans une boucle for
int RotationTime = 2400; //valeur dans un delay

int Deroul = 80; 
// étape de la séquence (8 en tout)
int _step = 0; 
// direction
boolean dir = false;
// vitesse
int _speed = 1;
int over = 0;
//Capteur ultrason
int minimumRange = 10; // Minimum range needed
long duration, distance; // Duration used to calculate distance
//Driver L9110
//  IA   IB    Description
//  L    L    Off
//  H    L    Forward
//  L    H    Reverse
//  H    H    Off

void setup()
{
  Serial.begin( 9600 );
  pinMode(iA_gauche,OUTPUT);
  pinMode(iB_gauche,OUTPUT);
  pinMode(iA_droite, OUTPUT );
  pinMode(iB_droite, OUTPUT );
  pinMode(Rx, INPUT);
  pinMode(Tx, OUTPUT);
  pinMode(DataControl, OUTPUT);  
  pinMode(initpos, INPUT);
  pinMode(start, INPUT);
  pinMode(Demux, OUTPUT);
  pinMode(IN1, OUTPUT);  
  pinMode(IN2, OUTPUT);  
  pinMode(IN3, OUTPUT);  
  pinMode(IN4, OUTPUT);
  pinMode(Trig, OUTPUT);
  pinMode(Echo, INPUT);
  
  digitalWrite( iA_gauche, LOW );
  digitalWrite( iB_gauche, LOW );
  digitalWrite( iA_droite, LOW );
  digitalWrite( iB_droite, LOW );
  Dynamixel.begin(1000000, 7); 
  Dynamixel.move(2,17);
  Dynamixel.move(7,1000);
 }
 
void loop()
{
  if ((digitalRead(start==0)) && (fini==0))
  {
    Serial.print("\nwait");
    delay(3000);
    Serial.print("\ngo");
   //go forward
   //on vérifié durant le trajet si un obstacle apparait 
    for (int i=0; i<=trajet; i++){
      digitalWrite( iA_gauche, HIGH );
      digitalWrite( iA_droite, HIGH );
      obstacle = CalculDistance();
      while(obstacle){
       digitalWrite( iA_gauche, LOW );
       digitalWrite( iA_droite, LOW );
       delay(1000);
       obstacle = CalculDistance();
       }
     } 
    //On est arrivé : on s'arrête
    digitalWrite( iA_gauche, LOW );
    digitalWrite( iA_droite, LOW );
    Serial.print("\nwait 2");
    delay(1000);
    
   //rotation de 90°
    if (digitalRead(initpos)) 
    {
      Serial.print("\ndroite"); 
      digitalWrite(iA_gauche, HIGH);
      digitalWrite(iB_gauche, LOW);
      digitalWrite(iA_droite, LOW); 
      digitalWrite(iB_droite, HIGH);
    }
    else
    {
      Serial.print("\ngauche"); 
      digitalWrite(iA_gauche, LOW);
      digitalWrite(iB_gauche, HIGH);
      digitalWrite(iA_droite, HIGH); 
      digitalWrite(iB_droite, LOW);
    }
    delay(RotationTime);
    digitalWrite(iA_gauche, LOW);
    digitalWrite(iB_gauche, LOW);
    digitalWrite(iA_droite, LOW); 
    digitalWrite(iB_droite, LOW);
    
    //On abaisse le bras via Dynamixel
    if (digitalRead(initpos)){Dynamixel.move(7,512);}
    else{Dynamixel.move(2,512);}
    delay(3000);
 
    //On gravit l'escalier en faisant tourner le rouleau
    Serial.print("\non grimpe");
 
    digitalWrite(iA_gauche, HIGH);
    digitalWrite(iB_gauche, LOW);
    digitalWrite(iA_droite, HIGH); 
    digitalWrite(iB_droite, LOW);
    for (int i=0; i<=Deroul; i++){
      _step = StepperMotor(_step,dir, _speed);
      }
     //on a fini de dérouler, mais on avance encore un peu 
    delay(2000);
  
    //It's over
    digitalWrite(iA_gauche, LOW);
    digitalWrite(iA_droite, LOW); 
    over = 1;
    }
  delay(2000);  
}

//Controle du moteur de déroulement
int StepperMotor(int _step, int dir, int _speed)
{
  
 switch(_step){ 
   case 0: 
     digitalWrite(IN1, LOW);  
     digitalWrite(IN2, LOW); 
     digitalWrite(IN3, LOW); 
     digitalWrite(IN4, HIGH); 
   break;  
   case 1: 
     digitalWrite(IN1, LOW);  
     digitalWrite(IN2, LOW); 
     digitalWrite(IN3, HIGH); 
     digitalWrite(IN4, HIGH); 
   break;  
   case 2: 
     digitalWrite(IN1, LOW);  
     digitalWrite(IN2, LOW); 
     digitalWrite(IN3, HIGH); 
     digitalWrite(IN4, LOW); 
   break;  
   case 3: 
     digitalWrite(IN1, LOW);  
     digitalWrite(IN2, HIGH); 
     digitalWrite(IN3, HIGH); 
     digitalWrite(IN4, LOW); 
   break;  
   case 4: 
     digitalWrite(IN1, LOW);  
     digitalWrite(IN2, HIGH); 
     digitalWrite(IN3, LOW); 
     digitalWrite(IN4, LOW); 
   break;  
   case 5: 
     digitalWrite(IN1, HIGH);  
     digitalWrite(IN2, HIGH); 
     digitalWrite(IN3, LOW); 
     digitalWrite(IN4, LOW); 
   break;  
     case 6: 
     digitalWrite(IN1, HIGH);  
     digitalWrite(IN2, LOW); 
     digitalWrite(IN3, LOW); 
     digitalWrite(IN4, LOW); 
   break;  
   case 7: 
     digitalWrite(IN1, HIGH);  
     digitalWrite(IN2, LOW); 
     digitalWrite(IN3, LOW); 
     digitalWrite(IN4, HIGH); 
   break;  
   default: 
     digitalWrite(IN1, LOW);  
     digitalWrite(IN2, LOW); 
     digitalWrite(IN3, LOW); 
     digitalWrite(IN4, LOW); 
   break;  
   } 
 if(dir){ 
   _step++; 
  }
 else{ 
   _step--; 
  } 
 if(_step>7){ 
   _step=0; 
 } 
 if(_step<0){ 
   _step=7; 
  } 
 delay(_speed); 
 return _step;
}


boolean CalculDistance(){
  digitalWrite(Trig, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance = duration/58.2;
 if (distance <= minimumRange){
  obstacle = true;
 }
 else {obstacle = false;}
  return obstacle;  
}



//http://savageelectronics.blogspot.it/2011/01/arduino-y-dynamixel-ax-12.html
    