#!/usr/bin/python
# -*- coding: Utf8 -*-
"""
@author: Louis Defauw
@date: 04.03.2015
@note: Initialisation avant le demarrage du robot
@todo: A tester (sur la RPi)
"""

import RPi.GPIO as GPIO
import logging
import time

import math
import param
import tasks
import communication


def init():
    if param.debug:
        logging.warning("Lancement du programme en mode debug")
    else:
        logging.warning("Lancement de l initialisation")

    # Initialisation des pins de la RPi importantes pour l initialisation
    GPIO.setup(param.pinColor, GPIO.IN)
    GPIO.setup(param.pinStart, GPIO.IN)
    GPIO.setup(param.pinStrategie, GPIO.IN)
    
    GPIO.setup(param.pinMotorSuccess, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(param.pinMotorEmergency, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(param.pinMotorRecover, GPIO.OUT)
    GPIO.setup(param.pinMotorStop, GPIO.OUT)
    GPIO.output(param.pinMotorRecover, False)
    GPIO.output(param.pinMotorStop, False)

    GPIO.setup(param.pinBrasSuccess, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(param.pinBrasRecover, GPIO.OUT)
    GPIO.output(param.pinBrasRecover, True)

    GPIO.setup(param.pinContactD, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    GPIO.setup(param.pinContactG, GPIO.IN, pull_up_down=GPIO.PUD_UP)

    # Initialisation des communications
    logging.warning("Lancement des communications")
    param.MotorsI2C = communication.MotorsI2CFunctions()
    param.BrasI2C = communication.BrasI2CFunctions()

    # Test de la communication avec les differents modules
    testComm()

    # Creation de la liste des taches a faire
    param.Tache = tasks.Tasks()

    # Verification du temps avant l arret du robot
    if param.tempsMatch != 90:
        logging.warning("Le timer est initialise a %fs" % param.tempsMatch)

    # Initialisation du positionnement
    # if not(param.debug):
        # posInit()

    # Configuration de la couleur et consequences
    colorConfig()

    # Initialisation des dynamixels
    param.BrasI2C.fermeTube()
    time.sleep(0.5)
    param.BrasI2C.amorcagePince()
    time.sleep(2)
    param.BrasI2C.grabBall()
    time.sleep(2)
    param.BrasI2C.upPlot()
    time.sleep(2)


def posInit():
    logging.info("posInit")
    while True:
        logging.info("pos")
        param.MotorsI2C.joinEdge()
        isTouching()
        newsForward = param.MotorsI2C.forward(20)
        if newsForward[0]:
            logging.info("posInit : join1")
            break

    param.posXinit = 1300
    param.posYinit = 1000
    param.angleInit = math.pi
    param.oldXYa = [param.posXinit, param.posYinit, param.angleInit]


def isTouching():
    while True:
        contactD = GPIO.input(param.pinContactD)
        contactG = GPIO.input(param.pinContactG)
        if contactD == 0 and contactG == 0:
            logging.info("Touching")
            break
    param.MotorsI2C.touchingEdge()


def colorConfig():
    color = GPIO.input(param.pinColor)

    # Parametres a changer en fonction de la couleur (place de depart et angle)
    if color == 1:
        logging.info("Le robot est jaune")
        param.teamColor = "Yellow"
        param.posXinit = -param.posXinit
        param.colCor = -1
        param.angleInit = 0
        param.oldXYa = [param.posXinit, param.posYinit, param.angleInit]
    else:
        logging.info("Le robot est vert")
        param.teamColor = "Green"


def testComm():
    pass
