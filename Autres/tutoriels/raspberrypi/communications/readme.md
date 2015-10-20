Protocols de communications sur Raspberry en Python
===================================================

Introduction
------------

Dans le cadre du projet robot, il est nécessaire de parler des communications. En effet, la raspberry seule est incapable de fournir les capacités suffisantes pour gérer à elle seule un robot. Elle aura donc besoin de composants annexes, que ce soient des Arduino ou bien une DE0nano pour les intimes.

Pour pouvoir choisir parmi les différents protocols de communications disponibles, il faut tout d'abord les connaitre. 

NOTE: Le protocole SPI n'est pas utilisable si nous utilisons le module PWM de RPIO car il utilise le système de SPI DAM (Direct access memory) pour s'exécuter. Ceci est à vérifier et à tester.

Les différents protocoles
-------------------------

| protocole | Duplex | Synchrone |Informations   |
|:---------:|:------:|:---------:|:-------------:|
|   SPI     |  FULL  |  OUI      | Trop de câbles pour plusieurs esclaves |
| I²C       | HALF   | OUI       | ONE-WIRE, 10-100KB/s, 112 arduino's MAX |
| UART      | FULL   | NON       | Architecture à revoir pour plusieurs esclaves (Hardocoded component adresses)|

De ce petit tableau, je pencherais vers du I²C. D'une part, c'est du One-Wire, donc pour communiquer avec plusieurs esclaves, c'est facile. D'autre part, ce protocole permet un vitesse de transfert, bien que maigre, suffisante pour notre application.
Si quelqu'un trouve une autre solution, il est libre de partager son avis et de compléter le petit tutoriel explicant sa proposition.

Un tutoriel pour l'utilisation du I²C est disponible sur 
http://www.instructables.com/id/Raspberry-Pi-I2C-Python/ en attendant d'en compléter le tutoriel.

Crédits
--------
Alexis Paques