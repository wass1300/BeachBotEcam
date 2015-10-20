#!/usr/bin/python
# -*- coding: Utf8 -*-
"""
@author: Louis Defauw
@date: 19.03.2015
@note: Test des capteurs à ultrasons
@todo: Fonctionne, vérifier s'il ne faut pas raccourcir les délais
"""

# Aide disponible sur : http://www.raspberrypi-spy.co.uk/2013/01/ultrasonic-distance-measurement-using-python-part-2/

import RPi.GPIO as GPIO
import time
import param

GPIO.setmode(GPIO.BOARD)
trig = [param.pinTrigAvD]
echo = [param.pinEchoAvD]
i = 0
while i < len(trig):
    GPIO.setup(trig[i], GPIO.OUT)
    GPIO.setup(echo[i], GPIO.IN)
    GPIO.output(trig[i], False)
    i += 1


def run():
    print("Lancement des capteurs US en mode debug !")
    distance = [0]
    while True:
        i = 0
        while i < len(trig):
            distance[i] = measure(trig[i], echo[i])
            # changer en measure() si trop long
            i += 1
        string = "SONAR:" + str(distance[0])
        print(string)
        time.sleep(0.5)


def measure(trig, echo):
    time.sleep(0.0001)
    GPIO.output(trig, True)
    time.sleep(0.000001)
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
    return distance1


print("run")
run()
