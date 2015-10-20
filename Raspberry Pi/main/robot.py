#!/usr/bin/python
# -*- coding: Utf8 -*-
"""
@author: Louis Defauw
@date: 04.03.2015
@note: Main du robot
@todo: A tester (sur la RPi)
@version: 0.3
"""

import RPi.GPIO as GPIO
import time
import logging
import multiprocessing

import param
import initialisation
import sys

# Niveaux des log possibles avec logging:
#   logging.debug()
#   logging.info()
#   logging.warning()
#   logging.error()
#   logging.critical()

logging.basicConfig(
    filename='history.log',
    level=logging.DEBUG,
    format='%(asctime)s %(levelname)s - %(message)s',
    datefmt='%d/%m/%Y %H:%M:%S',)


class MyRobot(object):
    def __init__(self):
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(param.pinInit, GPIO.IN)
        if not(param.debug):
            while GPIO.input(param.pinInit) == 1:
                pass
        # Initialisation
        initialisation.init()

        # Attente du demarrage
        self.waitToRun()

    def waitToRun(self):
        logging.info("Attente du signal de demarrage")

        # Attente du changement d etat de la pin Start
        if not(param.debug):
            while GPIO.input(param.pinStart) == 1:
                pass
            param.start = True
        else:
            logging.warning("Mode debug : demarrage direct")

        # Lancement du run du robot
        self.tache = param.Tache
        run(self.tache)


def run(task):
    logging.info("Demarrage du robot")
    # Demarrage d un process qui va durer tempsMatch
    p = multiprocessing.Process(name="running", target=duringRun, args=(task,))
    logging.info("Demarrage du timer de %f" % param.tempsMatch)
    p.start()
    time.sleep(param.tempsMatch)
    if p.is_alive:
        p.terminate()
    logging.info("Fin du timer, arret du robot")
    stop()


def duringRun(task):
    tache = task
    listeTaches = tache.getTasksList()
    i = 0
    while i < len(listeTaches):
        logging.info("Nouvelle tache : %s" % listeTaches[i].getName())
        tache.runTask(i)
        i += 1


def stop():
    # Arret des moteurs et des servos
    param.MotorsI2C.stop()
    logging.info("Le robot est arrete")


if __name__ == '__main__':
    logging.info("---------------------------------------")
    logging.info("Demarrage du programme")
    logging.info("---------------------------------------")

    BetterWithMottor = MyRobot()

    logging.info("---------------------------------------")
    logging.info("Fin du programme")
    logging.info("---------------------------------------")
    sys.exit(0)
