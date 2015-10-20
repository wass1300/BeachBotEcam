# 
# Alexis Paques's NoEvent driver
# Projet Robot 2014
#

import RPi.GPIO as GPIO
import time
import os

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
RUN()

try:
 while True:
  key = raw_input("ENTREZ VOTRE TEST:")
  if(key == "]]A" or key == "Z" or key == "z"):
   RUN()
   print('RUN')
  elif(key == "]]D" or key == "Q" or key == "q"):
   LEFT()
   print("LEFT")
  elif(key == "]]C" or key == "D" or key == "d"):
   RIGHT()
   print("RIGHT")
  elif(key == "]]B" or key == "S" or key == "s"):
   BACK()
   print("BACK")
  else:
   STOP()
   print("STOP")
except KeyboardInterrupt:
 STOP()
 print("EMERGENCY STOP")