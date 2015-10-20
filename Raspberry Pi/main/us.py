#!/usr/bin/python
# -*- coding: Utf8 -*-
"""
@author: Louis Defauw
@date: 19.03.2015
@note: Gestion des capteurs a ultrasons
@todo: Fonctionne (p-e mettre l initialisation des pins dans initialisation.py)
"""
# Aide disponible sur :


import RPi.GPIO as GPIO
import logging
import time

import param


class USsensor():
    def __init__(self, trig, echo):
        self.trig = trig
        self.echo = echo

        self.debug = param.debugUS
        if self.debug:
            logging.warning("Capteurs US en mode debug !")

        GPIO.setup(self.trig, GPIO.OUT)
        GPIO.setup(self.echo, GPIO.IN)
        GPIO.output(self.trig, False)
        if self.debug:
            logging.info("Capteur initialise")

    def run(self):
        self.distance = measure(self.trig, self.echo)
        if self.debug:
            logging.info("Distance : %.1f" % self.distance)
        return self.distance


def measure(trig, echo):
    time.sleep(0.01)
    GPIO.output(trig, True)
    time.sleep(0.00001)
    GPIO.output(trig, False)
    start = time.time()
    while GPIO.input(echo) == 0:
        start = time.time()
    while GPIO.input(echo) == 1:
        elapsed = time.time() - start
        if elapsed > 0.001:
            break
    stop = time.time()
    # stop = time.time()
    totaltime = stop-start
    distance = (totaltime*34300)/2
    # print(elapsed)
    return distance


def measure_average(trig, echo):
    distance1 = measure(trig, echo)
    distance2 = measure(trig, echo)
    distance3 = measure(trig, echo)
    distance = distance1 + distance2 + distance3
    distance = distance/3
    return distance
