#!/usr/bin/python
# -*- coding: Utf8 -*-
"""
@author: Louis Defauw  Alexis Paques
@date: 18.03.2015
@note: Communications entre les modules
@todo: L i2c fonctionne, verifier le module
"""

import logging
from struct import unpack
import quick2wire.i2c as i2c
import RPi.GPIO as GPIO
import time

import us
import param


def send(data, self):
    d = liste(data)
    logging.info("Sending (%d,%d) a l adresse %i" % (d[0], d[1], self.address))
    self.bus.transaction(i2c.writing_bytes(self.address, d[0], d[1]))
    time.sleep(0.001)


def read(howMany, self):
    logging.info("Reading a l adresse %i" % self.address)
    data = self.bus.transaction(i2c.reading(self.address, howMany))
    logging.info(data)
    return data


def liste(xy):
    x = xy >> 8
    y = xy & 255
    return [x, y]


def pack(x, y):
    if x <= 15 and x >= 0:
        x = x << 12
    else:
        x = 0
    if y > 4095 or y < 0:
        y = 0
    return (x + y)


def unPack(data):
    d = unpack('BBBBBBBB', data[0])
    x = int.from_bytes([d[0], d[1], d[2], d[3]], byteorder='big', signed=True)
    y = int.from_bytes([d[4], d[5], d[6], d[7]], byteorder='big', signed=True)
    return [x, y]


class MotorsI2CFunctions():
    def __init__(self):
        self.address = param.addressMotorsArduino
        self.bus = i2c.I2CMaster()

    def stop(self):
        data = pack(1, 0)
        send(data, self)

    def forward(self, dist):
        param.distanceUsMin = 14 
        data = pack(2, dist)
        send(data, self)
        sensor1 = us.USsensor(param.pinTrigAvD, param.pinEchoAvD)
        sensor2 = us.USsensor(param.pinTrigAvG, param.pinEchoAvG)
        news = self.waitNews(sensor1, sensor2)
        if news[0] == False:
            news = self.retryForward(dist, news[1], news[2])
        return news

    def backward(self, dist):
        pram.distanceUsMin = 6
        data = pack(3, dist)
        send(data, self)
        sensor = us.USsensor(param.pinTrigAr, param.pinEchoAr)
        news = self.waitNews(sensor, 0)
        if news[0] == False:
            news = self.retryBackward(dist, news[1], news[2])
        return news

    def turnLeft(self, angle):
        param.distanceUsMin = 8
        data = pack(4, angle)
        send(data, self)
        sensor = us.USsensor(param.pinTrigG, param.pinEchoG)
        news = self.waitNews(sensor, 0)
        if news[0] == False:
            news = self.retryTurnLeft(angle, news[1], news[2])
        return news

    def turnRight(self, angle):
        param.distanceUsMin = 8
        data = pack(5, angle)
        send(data, self)
        sensor = us.USsensor(param.pinTrigD, param.pinEchoD)
        news = self.waitNews(sensor, 0)
        if news[0] == False:
            news = self.retryTurnRight(angle, news[1], news[2])
        return news

    def joinEdge(self):
        data = pack(6, 0)
        send(data, self)

    def touchingEdge(self):
        data = pack(7, 0)
        send(data, self)

    def pinStop(self):
        GPIO.output(param.pinMotorStop, True)
        time.sleep(0.1)
        GPIO.output(param.pinMotorStop, False)

    def getRC(self):
        # [compteurDroit, compteurGauche]
        data = read(8, self)
        RC = unPack(data)
        logging.info("Compteur droit : %i" % RC[0])
        logging.info("Compteur gauche : %i" % RC[1])
        return RC

    def retryForward(self, dist, RCD, RCG):
        time.sleep(2)
        imp_parcourues = (RCD + RCG)/2
        dist_parcourue = imp_parcourues*param.CmParTics
        dist_a_parcourir = dist_parcourue - dist
        return self.forward(int(dist_a_parcourir))
        # return [True, RCD, RCG]

    def retryBackward(self, dist, RCD, RCG):
        time.sleep(2)
        imp_parcourues = (RCD + RCG)/2
        dist_parcourue = imp_parcourues*param.CmParTics
        dist_a_parcourir = dist_parcourue - dist
        return self.backward(int(dist_a_parcourir))

    def retryTurnLeft(self, dist, RCD, RCG):
        time.sleep(2)
        imp_parcourues = (RCD + RCG)/2
        dist_parcourue = imp_parcourues*param.CmParTics
        dist_a_parcourir = dist_parcourue - dist
        corr_angle = dist_a_parcourir*107.5/360
        return self.turnLeft(int(dist_a_parcourir))

    def retryTurnRight(self, dist, RCD, RCG):
        time.sleep(2)
        imp_parcourues = (RCD + RCG)/2
        dist_parcourue = imp_parcourues*param.CmParTics
        dist_a_parcourir = dist_parcourue - dist
        corr_angle = dist_a_parcourir*107.5/360
        return self.turnRight(int(dist_a_parcourir))

    def waitNews(self, sensor1, sensor2):
        start = time.time()
        while (time.time() - start) < 5.0:
            news = False
            distance1 = sensor1.run()
            if distance1 < param.distanceUsMin:
                logging.warning("US : obstacle ")
                self.pinStop()
                break
            if sensor2 != 0:
                distance2 = sensor2.run()
                if distance2 < param.distanceUsMin:
                    logging.warning("US : obstacle ")
                    self.pinStop()
                    break
            if GPIO.input(param.pinMotorSuccess) == 1:
                logging.info("Success de l arduino moteurs")
                news = True
                break
            if GPIO.input(param.pinMotorEmergency) == 1:
                logging.warning("Emergency de l arduino moteurs ")
                break
        RC = self.recover(news)
        return [news, RC[0], RC[1]]

    def recover(self, news):
        RC = self.getRC()
        GPIO.output(param.pinMotorRecover, True)
        while True:
            if news:
                statePin = GPIO.input(param.pinMotorSuccess)
            else:
                statePin = GPIO.input(param.pinMotorEmergency)
            if statePin == 0:
                logging.info("Recover de l arduino moteurs")
                break
        GPIO.output(param.pinMotorRecover, False)
        return RC


class BrasI2CFunctions():
    def __init__(self):
        self.address = param.addressBrasArduino
        self.bus = i2c.I2CMaster()

    def amorcagePince(self):
        data = pack(0, 0)
        send(data, self)
        self.waitNews()

    def grabPlot(self):
        data = pack(1, 0)
        send(data, self)
        self.waitNews()

    def upPlot(self):
        data = pack(2, 0)
        send(data, self)
        self.waitNews()

    def grabGlass(self):
        data = pack(3, 0)
        send(data, self)
        self.waitNews()

    def upTransport(self):
        data = pack(4, 0)
        send(data, self)
        self.waitNews()

    def grabBall(self):
        data = pack(5, 0)
        send(data, self)
        self.waitNews()

    def upBall(self):
        data = pack(6, 0)
        send(data, self)
        self.waitNews()

    def down(self):
        data = pack(7, 0)
        send(data, self)
        self.waitNews()

    def release(self):
        data = pack(8, 0)
        send(data, self)
        self.waitNews()

    def fermeTube(self):
        data = pack(9, 0)
        send(data, self)
        self.waitNews()

    def ouvrirTube(self):
        data = pack(10, 0)
        send(data, self)
        self.waitNews()

    def hitClap(self, side):
        # side = 1 -> cote jaune
        if side == 1:
            data = pack(11, 1)
            send(data, self)
        else:
            data = pack(11, 0)
            send(data, self)
        self.waitNews()

    def prepaClap(self, side):
        # side = 1 -> cote jaune
        if side == 1:
            data = pack(12, 1)
            send(data, self)
        else:
            data = pack(12, 0)
            send(data, self)
        self.waitNews()

    def waitNews(self):
        start = time.time()
        while (time.time() - start) < 5.0:
            if GPIO.input(param.pinBrasSuccess) == 1:
                logging.info("Success de l arduino bras")
                break
        self.recover()

    def recover(self):
        GPIO.output(param.pinBrasRecover, False)
        while True:
            statePin = GPIO.input(param.pinBrasSuccess)
            if statePin == 0:
                logging.info("Recover de l arduino bras")
                break
        GPIO.output(param.pinBrasRecover, True)
        time.sleep(0.01)
