# IMPORT
import RPi.GPIO as GPIO
import time
import os

# SETTINGS
os.system('clear')
GPIO.setmode(GPIO.BCM)
TRIG=7
ECHO=8
GPIO.setup(TRIG,GPIO.OUT)
GPIO.setup(ECHO,GPIO.IN)
GPIO.output(TRIG,False)

# BEGIN
print "************************************************"
print "**                 Raspi Spy                  **"
print "************************************************"
print "**   By Alexis Paques & Arnaud Isenrentant    **"
print "************************************************"

# WAIT THE ECHO DEVICE TO SETTLE
time.sleep(0.5)

while True:
 # SEND TRIGGER
 GPIO.output(TRIG,True)
 time.sleep(0.00003) # 10micro seconds
 GPIO.output(TRIG,False)  

 while GPIO.input(ECHO) == 0:
  start = time.time()
 while GPIO.input(ECHO) == 1:
  stop = time.time()

 elapsed = stop-start
 distance = elapsed*1000000/48
 os.system('clear')
 print "Distance : %.2f cm" % distance

 time.sleep(0.7)