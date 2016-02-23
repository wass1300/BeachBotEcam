
#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
@author: Gauthier Linard & Guillaume Verfaille
@date: 02.11.2015
@note: Test of the i2c communication
"""

from struct import *
import time
import sys
import quick2wire.i2c as i2c

def send(data,self):
	d = liste(data)
	print("Envoi de donnees (%d,%d) a l'adresse %i" % (d[0], d[1], self.address))
	self.bus.transaction(i2c.writing_bytes(self.address,d[0],d[1]))

def read(self):
	print("Lecture de donnees a l'adresse %i" % (self.address))
	data = self.bus.transaction(i2c.reading(self.address,4))
	print(data)
	return data

def liste(xy):
	x = xy >> 8 # take the MSB
	y = xy & 255 # take the rest
	return [x,y]

# x is the type of action and y is the data to be send
# return 16 bits
def pack(x, y): 
	if x <= 15 and x >= 0:
		x = x << 12 # add 12 times 0
	else:
		x = 0
	if y > 4095 or y < 0:
		y = 0
	return (x + y) # concatenate x and y

def unPack(data): 
	d = unpack('bbbb',data[0])
	x = (d[0] << 8) + d[1]
	y = (d[2] << 8) + d[3]
	return [x,y]

class MotorsI2CFunctions():
	def __init__(self):
		self.address = 8 # address of the slave card you can find it with the command i2cdetect -y 1
		self.bus = i2c.I2CMaster()

	def stop(self):
		data = pack(1,0)
		send(data,self)

	def forward(self, length):
		data = pack(2,length)
		send(data,self)

	def backward(self, length):
		data = pack(3,length)
		send(data,self)

	def turnLeft(self, angle):
		data = pack(4,angle)
		send(data,self)

	def turnRight(self, angle):
		data = pack(5,angle)
		send(data,self)

	def getXY(self):
		data = read(self)
		XY = unPack(data)
		return XY


if sys.argv[1] == 1 :
	mo.stop()
	
elif sys.argv[1] == 2 : 
	mo.forward(50)
	
elif sys.argv[1] == 3 :
	mo.backward(50)
	
elif sys.argv[1] == 4 :
	mo.turnRight(10)
	
elif sys.argv[1] == 5 :
	mo.turnRight(10)
	
# mo = MotorsI2CFunctions()

# mo.forward(50)

# time.sleep(5)

# mo.forward(50)

# time.sleep(5)

# mo.turnRight(10)

# time.sleep(5)

# mo.backward(50)

# time.sleep(5)

# mo.turnLeft(60)

# time.sleep(5)

# mo.stop()
