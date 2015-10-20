Intégration du code sur l'arduino 1 (```integration.ino```)
=======================================================

Code de la première Arduino que nous allons employée. Celle-ci s'occupe (pour l'instant) de la gestion des moteurs, du (ou des) capteur(s) ultrason (US), et des roues codeuse. On peut trouver des exemples de code en python (principalement) dans les sous dossiers.

Reste à faire 
-------------

* Gestion des moteurs (voir codes/arduinos/moteurs/readme.md et http://arduino.cc/en/Tutorial/PWM)
* Définition de ce qu'il y aura dans dataIn et dans dataOut
* Gestion des roues codeuses
* Définition des pins qui restent à faire (voir codes/gpio.md)
* Gestion de l'arrêt d'urgence
  
A vérifier avant d'utiliser (sans compter la RPi) 
-------------------------------------------------

* L'assignation des pins
* L'adresse de l'arduino
* Le délai de ```loop()```
* Le nombre de bytes à envoyer lors de ```Wire.write()```

Credits
=======

Louis Defauw

http://arduino.cc/en/Tutorial/PWM