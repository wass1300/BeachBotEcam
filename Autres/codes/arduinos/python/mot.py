#!/usr/bin/env python3
"""
Auteur : Bouzanih Mounime 
Date : 13/07/2014

Script pour piloter un moteur DC
Il faut rajouter le script pigpio.py dans le même dossier que ce sript
et l'importer pour pouvoir générer un signal PWM
Test: ok 
"""
import RPi.GPIO as GPIO
import time
import pigpio

enable=18 # pin qui fournit la PWM

GPIO.setmode(GPIO.BCM)
GPIO.setup(23, GPIO.OUT)
GPIO.setup(24, GPIO.OUT)
GPIO.setup(enable, GPIO.OUT)

# Sens du moteur soit :
# (23, 0) et (24, 1) ou 
# (23, 1) et (24, 0)
GPIO.output(23, 0)
GPIO.output(24, 1)

#GPIO.output(enable, 1)
pi = pigpio.pi()
pi.set_PWM_range(enable, 255)
pi.set_PWM_frequency(enable, 1000)
i=0
vitesse=0
# Acceleration progressive jusque vitesse max
while i < 255:
   pi.set_PWM_dutycycle(enable, i)
   vitesse = 100*i/255
   print(vitesse)
   time.sleep(0.2)
   i+=5

#time.sleep(2)
#i=255
while i > 1:
   pi.set_PWM_dutycycle(enable, i)
   vitesse = 100*i/255
   print(vitesse)
   time.sleep(0.2)
   i-=5


GPIO.output(enable, 0)

GPIO.cleanup()
