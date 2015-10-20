I²C sur Raspberry en Python
===========================

Introduction
------------
L'I²C est un protocole de communication facile à mettre en oeuvre car d'une part il n'utilise qu'un fil unique afin de communiquer avec les autres cartes et d'autre part parce qu'il est intégré à la majorité des cartes auxquelles ont pourrait penser... sauf la DE0-nano où il faudrait hardcoder le protocole.

Installation préalable
----------------------
Comme d'habitude, il faut installer les prérequis & gérer les configuration afin que l'I²C fonctionne.

La première chose à faire est d'activer le module I²C. La seconde est d'ajouter les programmes et librairies nécessaires et enfin, nous pourrons coder. Cela dit deux méthodes sont possibles. Le choix d'une de ces méthodes est encore à préciser. Il faudrait idéalement les *TESTER* toutes les deux.

### NodeJS - I²C
NodeJS est un logiciel permettant de créer un serveur en Javascript. Son avantage principal se situe dans son principe même, c'est un moteur évènementiel qui ne réagira donc que lors d'évènements. En dehors de ces évènements, le CPU ne sera pas surchargé!

RaspberryPi => Python => NodeJS => Arduino's

### I²C Hardware
Utiliser l'I²C Hardware, directement via une librairie python, permetrait d'éviter d'avoir trop de langages entremellés, mais d'autre part rendrait le code python plus compliqué. Il faudrait faire une librairie à inclure à chaque fichier nécéssitant une communication à la place de directement faire les fonctions en Javascript que l'on appellera en python.

RaspberryPi => Python => Arduino's

Crédits
--------
Alexis Paques

http://www.instructables.com/id/Raspberry-Pi-I2C-Python/

http://www.instructables.com/id/I2C-between-Arduinos/

https://www.npmjs.org/package/python-shell

http://alexandre.alapetite.fr/doc-alex/raspberrypi-nodejs-arduino/

http://www.pihomeserver.fr/2013/08/13/raspberry-pi-home-server-arduino-lier-les-deux-via-bus-i2c/