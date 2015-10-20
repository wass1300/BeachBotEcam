#!/usr/bin/python
#
# Script principal de la RPi
#
# Etat: le multiprocessing et Queue() fonctionnent!
#
# Auteur : Louis Defauw

from multiprocessing import Queue,Lock
import multiprocessing, time
import sonar, path


if __name__ == '__main__':
	queue = Queue()
	lock = Lock()
	print "Appel de sonar.run()"
	print "Appel de path.run()"
	s = multiprocessing.Process(name='sonar',target=sonar.run,args=(queue,lock,True))
	p = multiprocessing.Process(name='path',target=path.run,args=(queue,lock))
	s.start()
	p.start()

	time.sleep(5)

	queue.put('STOP')

	time.sleep(1)
	if s.is_alive:
		s.terminate()
	if p.is_alive:
		p.terminate()