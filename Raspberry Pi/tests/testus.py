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

# Configure GPIO
GPIO.setmode(GPIO.BCM)
trig = 27
echo = 21

GPIO.setup(trig, GPIO.OUT)
GPIO.setup(echo, GPIO.IN)
GPIO.output(trig, False)

# Run the test
def run():
    print("Lancement des capteurs US en mode debug !")
    while True:
		distance = measure(trig, echo)
        string = "SONAR:" + str(distance)
        print(string)
        time.sleep(0.5)

# Returns the measured distance
def measure(trig, echo):
	# Prepare the signal
    time.sleep(0.0001)
    GPIO.output(trig, True)
    time.sleep(0.000001)
    GPIO.output(trig, False)
    start = time.time()
	# Wait for the signal to be send
    while GPIO.input(echo) == 0:
        start = time.time()
	# Wait for the signal to come back
    while GPIO.input(echo) == 1:
        elapsed = time.time() - start
        if elapsed > 0.001: # Detect max 17cm (0.001*34.300) 
            break
    stop = time.time()
	
    totaltime = stop-start
    distance = (totaltime*34300)/2
    return distance

# Returns the average distance of 3 signals
def measure_average(trig, echo):
    distance1 = measure(trig, echo)
    distance2 = measure(trig, echo)
    distance3 = measure(trig, echo)
    return (distance1 + distance2 + distance3)/3

print("run")
run()
