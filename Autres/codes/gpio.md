GPIO des cartes utilisées
=================================
Ce fichier a pour but de préciser quels GPIO chaque projet a besoin. Autant pour éviter les conflits de communication que pour faire un compte rendu de comment *brancher* les câbles.

Raspberry Pi
--------------

Révision 1 de la Raspberry : 

**/!\ Nous utiliserons la carte permettant de faire passer du 5V sur les GPIO de la RPi. /!\**

![alt text](http://elinux.org/images/2/2a/GPIOs.png "Pinout RPi")

(Délosé pour ton tableau Alexis, mais c'est quand même plus clair une image.)

### Pins déjà utilisées

* Général :
	+ 5V Power
	+ Ground
* I2C : 
 	+ GPIO 0 (ou 2 fonction de la révision - SDA)
 	+ GPIO 1 (ou 3 fonction de la révision - SCL)
 	+ Ground (commun à toutes les cartes liées à l'I2C)
* Interruption :
	+ *À définir* (pour l'interruption provenant de l'arduino 1)
* Moteurs :
    + *À définir* (au moins une pin PWM par moteur)

Arduino Pro Mini
----------------

Pinout de l'arduino que nous utiliserons :

**/!\ Nous prendrons la version 5V. /!\**

![alt text](http://giltesa.com/wp-content/uploads/2014/02/arduino-pinouts.jpg "Pinout Arduino Pro Mini")

### Pins de l'arduino 1 déjà utilisées

* Général :
	+ VCC (5V)
	+ GND
* I2C :
	+ A4 (SDA)
	+ A5 (SCL)
	+ GND (commun à toutes les cartes liées à l'I2C)
* Capteur ultrasons :
	+ *À définir* (Trig - Digital)
	+ *À définir* (Echo - Digital)
	+ VCC (5V - peut être pris en dehors de l'arduino)
	+ GND (Peut être pris en dehors de l'arduino)

Crédits
--------------
Alexis Paques

Louis Defauw

http://elinux.org/images/2/2a/GPIOs.png

http://giltesa.com/wp-content/uploads/2014/02/arduino-pinouts.jpg