# 
# Alexis Paques's Real-time driver
# Projet Robot 2014
#

import RPi.GPIO as GPIO
import time, os, pygame

pygame.init()

GPIO.setwarnings(False)
os.system('clear')
GPIO.setmode(GPIO.BCM)

# M as motor
# A for motor A (GAUCHE)
# B for motor B (DROITE)
# 1 for 1

MA1=25
MA2=24
MB1=17
MB2=22

GPIO.setup(MA1, GPIO.OUT)
GPIO.setup(MA2, GPIO.OUT)
GPIO.setup(MB1, GPIO.OUT)
GPIO.setup(MB2, GPIO.OUT)

def RUN() :
  GPIO.output(MA1,True)
  GPIO.output(MB1,True)
  GPIO.output(MA2,False)
  GPIO.output(MB2,False)

def BACK() :
  GPIO.output(MA1,False)
  GPIO.output(MA2,True)
  GPIO.output(MB1,False)
  GPIO.output(MB2,True)

def STOP() :
  GPIO.output(MA1,False)
  GPIO.output(MA2,False)
  GPIO.output(MB1,False)
  GPIO.output(MB2,False)

def RIGHT() :
  GPIO.output(MA1,True)
  GPIO.output(MA2,False)
  GPIO.output(MB1,False)
  GPIO.output(MB2,True)

def LEFT() :
  GPIO.output(MA1,False)
  GPIO.output(MA2,True)
  GPIO.output(MB1,True)
  GPIO.output(MB2,False)

try:
  while True:
    for event in pygame.event.get():
      if event.type == pygame.KEYDOWN:
        if event.key == pygame.K_UP:
          print 'GO'
          RUN()
        elif event.key == pygame.K_DOWN:
          print 'BACK'
          BACK() 
        elif event.key == pygame.K_LEFT:
          print 'LEFT'
          LEFT()
        elif event.key == pygame.K_RIGHT:
          print 'RIGHT'
          RIGHT() 
        else:
          print 'STOP'
          STOP()
except KeyboardInterrupt:
  STOP()
  print("EMERGENCY STOP")