#!/usr/bin/python
#
# Script allant chercher la valeur de distance devant le robot (capteur ultra sons) et
# la renvoyant lorsqu'il y a une demande sur la queue
#
# Etat: a tester (pas sur que ca ira, j'ai pas reussi autrement qu'en mettant tout 
#       dans 1 seule boucle...)
#
# Auteurs: Louis Defauw, Alexis Paques, Arnaud Iserantant

import RPi.GPIO as GPIO
import multiprocessing
import time,sys
from multiprocessing.sharedctypes import Value
from ctypes import c_double
from multiprocessing import Queue,Lock

distance = 1
# Settings
GPIO.setmode(GPIO.BCM)
TRIG = 7
ECHO = 8
GPIO.setup(TRIG,GPIO.OUT)
GPIO.setup(ECHO,GPIO.IN)
GPIO.output(TRIG,False)


def run(queue,lock,debug=False):
	if debug:
		p = multiprocessing.current_process()
		print 'Starting:', p.name, p.pid
		sys.stdout.flush()

	while True:
		# Send trigger
		GPIO.output(TRIG,True)
		time.sleep(0.00003) # 10micro seconds
		GPIO.output(TRIG,False)  
		 Wait for a return
		while GPIO.input(ECHO) == 0:
			start = time.time()
		while GPIO.input(ECHO) == 1:
			stop = time.time()
		elapsed = stop-start
		distance = elapsed*1000000/48

		if debug:
			lock.acquire()
			print "Distance : %.2f cm" % distance
			lock.release()

		msg = queue.get()
		if(msg == 'SONAR?'):
			string = 'SONAR:' + str(distance)
			queue.put(string)

			if debug:
				lock.acquire()
				print string
				lock.release()

		elif(msg == 'STOP'):
			break
			
	if debug:
		print 'Exiting:', p.name, p.pid
		sys.stdout.flush()
