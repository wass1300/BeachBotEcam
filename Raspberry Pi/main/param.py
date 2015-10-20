#!/usr/bin/python
"""
@author: Louis Defauw
@date: 04.03.2015
@note: Parametres globaux du robot
@todo: Assigner les pins de la RPi
"""

import math
# from multiprocessing import Queue

# General
debug = False
tempsMatch = 80
start = False
colorTeam = None

# Objet a creer
Tache = None

# Position et angle de depart
posXinit = 0
posYinit = 0
angleInit = 0
oldXYa = [0, 0, 0]
colCor = 1

# Communication
MotorsI2C = None
BrasI2C = None

# Capteurs US
debugUS = False
distanceUsMin = 14

# Process
# queue = Queue.LifoQueue()

# Definition des pins de la RPi (attention au setmode  BOARD pour l instant)
# 3 => sda
# 5 => scl

pinMotorSuccess = 18
pinMotorEmergency = 16
pinMotorRecover = 12
pinMotorStop = 11
pinBrasSuccess = 13
pinBrasRecover = 15

pinTrigAr = 19
pinEchoAr = 21

pinTrigG = 7
pinEchoG = 23

pinTrigAvG = 32
pinEchoAvG = 24

pinTrigAvD = 29
pinEchoAvD = 22

pinTrigD = 36
pinEchoD = 26

pinStart = 33
pinColor = 37
pinInit = 35
pinStrategie = 31

pinContactD = 40
pinContactG = 38

# Definition des adresses I2C
addressMotorsArduino = 0x08
addressBrasArduino = 0x04

# Caracteristiques geometriques (cm)
DistanceRoues = 33.3
TicsParTour = 409.6
DiametreRoue = 8.045

# Caracteristiques calculees
PerimetreRoue = math.pi * DiametreRoue
CmParTics = PerimetreRoue / TicsParTour
DistanceRouesTics = DistanceRoues * TicsParTour
