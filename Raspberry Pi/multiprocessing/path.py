#!/usr/bin/python
#
# Script trouvant le chemin du robot
#
# Etat: on peut seulement aller chercher la valeur du sonar
#
# Auteur : Louis Defauw

import multiprocessing
import time,sys

def run(queue,lock):
	p = multiprocessing.current_process()
	print 'Starting:', p.name, p.pid
	sys.stdout.flush()
	#
	# Put code here
	#
	
	while True:
		time.sleep(1)
		queue.put('SONAR?')
		msg = queue.get()
		if(msg.split(':')[0] == 'SONAR'):
			distance = float(msg.split(':')[1])
			
			lock.acquire()
			print 'Message recu :', distance
			lock.release()

	print 'Exiting:', p.name, p.pid
	sys.stdout.flush()