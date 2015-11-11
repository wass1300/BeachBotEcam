# Test de communication I2C entre la Raspberry et l'Arduino
## Préambule
Ce dossier permet de réaliser un test de communication entre la Raspberry Pi (maitre) et l'Arduino (esclave).
Ci-dessous seront détaillés les détails des fichiers à utiliser et de certaines fonctions utiles à la compréhension du code.

## Raspberry Pi
### Introduction
La Raspberry Pi est connectée en tant que maitre à l'Arduino grâce aux pins SCL et SDA de la carte.

### Le fichier testi2c.py
Le fichier testi2c.py contient les méthodes qui permettent d'envoyer et de recevoir des instructions via une communication I2C. Ce fichier contient également la déclaration de la classe *MotorI2CFunctions* définissant les différentes actions que peut réaliser la carte esclave.

C'est ce fichier qu'il faut exécuter sur la Raspberry Pi.

### Comment ça marche ?
La communication se réalise sous 16 bits :

* Les 4 MSB indiquent l'action à exécuter
    * 1 : Arrêt du moteur
    * 2 : Avancer
    * 3 : Reculer
    * 4 : Rouner à gauche
    * 5 : Tourner à droite
    * 6 : Récupérer les coordonnées sous forme de tableau [x, y]
* Les 12 autres bits (LSB) contiennent la donnée à transmettre (si besoin, il y a). Les données doivent être écrites en centimètres (ou en degré pour les rotations). Un maximum de 4,095 mètres peuvent être parcouru en une seule communication (correspondant aux 12 LSB restant --> 2^12 = 4096)

Par exemple, pour aller tout droit sur une distance de 10cm, il suffit d'écrire 
```python
mo.forward(10)
```
après avoir instancié la classe 
```python
MotorsI2CFunctions()
```
## Arduino
### Introduction
L'Arduino est connecté en tant qu'esclave à la Raspberry Pi afin de commander les moteurs.

### Le fichier I2C_Slave.ino
Le fichier I2C_Slave.ino permet de "décortiquer" les données reçues et de les exécuter.

La fonction principale *loop()* fait clignoter des LEDs plus ou moins rapidement en fonction de l'action qu'elle a reçue à exécuter.

Ce fichier doit être transversé sur l'Arduino.

## Connexion entre les 2 cartes
Avant d'exécuter les 2 fichiers, il ne faut pas oublier d'activer la communication I2C sur la Raspberry et de choisir l'adresse du communication des 2 cartes (par défaut 8).

Une fois prêt, exécuter/transverser les 2 fichiers et regarder si des données sont reçues sur l'Arduino grâce au DEBUG.

**Attention**, à ne pas oublier de brancher la masse entre les deux cartes !