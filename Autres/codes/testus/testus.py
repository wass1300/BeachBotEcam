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
import logging
import time

GPIO.setmode(GPIO.BOARD)
trig = [13,11,15]
echo = [18,12,16]
i = 0
while i < len(trig):
	GPIO.setup(trig[i],GPIO.OUT)  
	GPIO.setup(echo[i],GPIO.IN)     
	GPIO.output(trig[i], False)
	i += 1
		
def run():
	print("Lancement des capteurs US en mode debug !")
	distance = [0,0,0]
	while True:
		i = 0
		while i < len(trig):
			distance[i] = measure_average(trig[i],echo[i]) # changer en measure() si trop long
			i += 1
		
		string = "SONAR:" + str(distance[0]) + ";" + str(distance[1]) + ";" + str(distance[2])
		print(string)
		time.sleep(0.1) # A changer !

def measure(trig,echo):
	time.sleep(0.1)
	GPIO.output(trig, True)
	time.sleep(0.00001)
	GPIO.output(trig, False)
	start = time.time()
	while GPIO.input(echo) == 0:
		start = time.time()
	while GPIO.input(echo) == 1: 
		elapsed = time.time() - start
		if elapsed > 0.01:
			break
	stop = time.time()#	stop = time.time()
	totaltime = stop-start
	distance = (totaltime*34300)/2
	#print(elapsed)
	return distance

def measure_average(trig,echo):
	distance1 = measure(trig,echo)
	distance2 = measure(trig,echo)
	distance3 = measure(trig,echo)
	distance = distance1 + distance2 + distance3
	distance = distance/3
	return distance

print("run")
run()