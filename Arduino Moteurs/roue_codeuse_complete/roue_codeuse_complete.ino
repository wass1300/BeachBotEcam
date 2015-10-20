/*
 * Roues codeuses, nous avons 2 roues codeuses devant être gérée.
 * Cela se fait avec des interruptions. Nous devons donc utiliser
 * l'Arduino MEGA 2560 pour avoir accès à assez de pins d'interruption.
 * 
 * Nous utiliserons :
 * - Roue codeuse gauche ; 
 *            Pin 2 : vert => INT0 -- A
 *            Pin 3 : jaune => INT1 -- B
 * - Roue codeuse droite ; 
 *            Pin 19 : vert => INT4 -- A
 *            Pin 18 : jaune => INT5 -- B
 * 
 * Alexis Paques
 * Louis Defauw
 */

#define DEBUG true
#if DEBUG
#define DEBUG_BEGIN(x);  Serial.begin(x);
#define DEBUG_PRINT(x);  Serial.print(x);
#define DEBUG_PRINTLN(x);  Serial.println(x);
#else
#define DEBUG_BEGIN(x);
#define DEBUG_PRINT(x);
#define DEBUG_PRINTLN(x);
#endif

// Définition des variables globales d'interruptions.
// NOTE: Volatile est nécessaire lorsque l'on parle de variables 
// modifiées par des interruptions. En effet, volatile permet à la 
// variable d'être modifiée par un processus externe.
volatile unsigned long compteurGauche = 0;
volatile unsigned long compteurDroit = 0;
volatile boolean sensD = 0;
volatile boolean impD = 0;
volatile boolean sensG = 0;
volatile boolean impG = 0;

void setup(){
	DEBUG_BEGIN(9600);
	pinMode(2, INPUT);
	pinMode(3, INPUT);
	pinMode(4, INPUT);
	pinMode(5, INPUT);

	attachInterrupt(0, Gauche, CHANGE);
	attachInterrupt(1, Droit, CHANGE);

	// État initial
	impG = digitalRead(3);
	sensG = digitalRead(5);
	impD = digitalRead(2);
	sensD = digitalRead(4);
}

void loop(){
	DEBUG_PRINT("Compteur gauche: ");
	DEBUG_PRINT(compteurGauche);
	DEBUG_PRINT(" Compteur droit: ");
	DEBUG_PRINTLN(compteurDroit);
	delay(1000);
}

void Gauche(){
	// Le HIGH permet de convertir la valeur en booléen
	impG = digitalRead(3) == HIGH;
	sensG = digitalRead(5) == HIGH; // sens = 0 -> décrémente, sens = 1 -> incrémente
	compteurGauche += (sensG == 1) ? +1 : -1;
}

void Droit(){
	impD = digitalRead(2) == HIGH;
	sensD = digitalRead(4) == HIGH; // sens = 0 -> décrémente, sens = 1 -> incrémente
	compteurDroit += (sensD == 1) ? +1 : -1;
}
