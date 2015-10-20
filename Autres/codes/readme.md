Stucture du code
================

Introduction
------------
Je vous propose d'inscrire ici votre idée de structure du code. Celle-ci pourra être modifiée, mais de façon limitée. Pour spécifier le programme utilisé dans les scripts, indiquez ".py" pour python, ".js" pour nodeJS ou ".ino" pour les codes de l'arduino.

Pour les visuels, voici ce que donne les interractions entre le nodeJS et le phyton :

![alt text](https://scontent-b.xx.fbcdn.net/hphotos-xfp1/v/t1.0-9/s720x720/10015156_10203502687341024_1267078838754172907_n.jpg?oh=ca0398877fc1b0d4ebc1dc350638e15c&oe=54CAAC1A "py_js")

**/!\ L'image n'est plus à jour, désormais les éléments moteurs, PWM, roues codeuse et ultrasons sont regroupés dans l'arduino 1. Il n'y a rien dans l'arduino 2 pour l'instant.**

Structure et éléments à intégrer
--------------------------------

### Éléments de base (sur la RPi)
Camera => camera.opencv.py

Routine pour aller rechercher ```dataOut[]``` sur l'arduino 1.

Routine de gestion des interruptions provenant des arduinos.

### Éléments de l'arduino 1
Les moteurs, les roues codeuses et les capteurs ultrasons sont directement codés en ```.ino```. Pour demander leurs états, il faudra passer par l'I2C. 
Leurs états sont regroupés dans un array ```dataOut[]```. 

Lorsque la RPi demande quelque chose à l'arduino (via l'I2C), on écrit dans ```dataIn[]```, c'est à partir de ce dernier qu'il faudra gérer les moteurs (entre autres).

S'il y a un arrêt d'urgence, une pin d'interruption sera mise à 1 sur la RPi (connexion directe en dehors de l'I2C).

### Éléments avancées (voir dans quelle partie les mettre)
Action1 : Clap des claps de cinéma



Crédits
-------
Alexis Paques

Louis Defauw

http://thefloppydisk.wordpress.com/2013/06/06/raspberry-pi-gpio-inputoutput-in-javascript/

https://github.com/ni-c/node-rasp2c

https://www.npmjs.org/package/python-shell