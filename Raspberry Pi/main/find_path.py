#!/usr/bin/python
# -*- coding: Utf8 -*-
"""
@author: Louis Defauw
@date: 06.03.2015
@note: Recherche du meilleur chemin permettant d'atteindre l'objectif
@todo: Tester et implémenter les manoeuvre d'évitement, et voir ce qu'il faut
       faire si on recoit une Emergency
"""

import logging
import math
# import RPi.GPIO as GPIO
# import time

import param


# Recherche et parcourt du chemin
def findPath(wantedXYA):
    while True:
        # Rotation pour être en face de l'objectif
        currentXYA = whereAreWe(param.oldXYA)
        distXYhyp = hyp(currentXYA, wantedXYA)
        newcurrenta = angleToXY([distXYhyp[0], distXYhyp[1], currentXYA[2]])

        # S'il y a la place, on avance vers l'objectif
        currentXYA = whereAreWe(param.oldXYA)
        distXYhyp = hyp(currentXYA, wantedXYA)
        distancesUS = checkUS()
        # !! dist max = 160cm
        if [distancesUS[0], distancesUS[1], distancesUS[2]] > distXYhyp[2]:
            param.MotorsI2C.forward(distXYhyp[2])
            logging.info("IC2 : forward(%f)" % distXYhyp[2])
            param.MotorsI2C.waitNews()
            break
        # Sinon, on avance le + possible, puis on évite l'obstacle
        else:
            logging.info("Il y a un obstacle dans le chemin")
            # Manoeuvre d'évitement
            m = max(distancesUS[0], distancesUS[1], distancesUS[2])
            avoid(m)

    if wantedXYA[2] is not None:
        if newcurrenta < wantedXYA[2]:
            angle = wantedXYA[2] - newcurrenta
        else:
            angle = newcurrenta - wantedXYA[2]
        turn(angle)

    logging.info("Arrivé à destination !")


def avoid(m):
    # 10, 15, 30 à regler
    param.MotorsI2C.forward(m - 10)
    logging.info("IC2 : forward(%f)" % (m - 10))
    param.MotorsI2C.waitNews()
    turn(30)
    param.MotorsI2C.waitNews()
    distancesUS = checkUS()
    if [distancesUS[0], distancesUS[1], distancesUS[2]] > 15:
        param.MotorsI2C.forward(15)
        logging.info("IC2 : forward(%f)" % 15)
        param.MotorsI2C.waitNews()
    # else ?


def turn(angle):
    if angle < 180:
        param.MotorsI2C.turnRight(angle)
        logging.info("IC2 : turnLeft(%f)" % angle)
    else:
        param.MotorsI2C.turnLeft(angle - 180)
        logging.info("IC2 : turnRight(%f)" % angle)
    # On attend d'avoir fini de tourner
    news = param.MotorsI2C.waitNews()
    return news


def hyp(currentXYA, wantedXYA):
    currentX = currentXYA[0]
    currentY = currentXYA[1]
    wantedX = wantedXYA[0]
    wantedY = wantedXYA[1]

    distX = -(currentX - wantedX)
    distY = -(currentY - wantedY)
    distHyp = math.sqrt(distX ^ 2 + distY ^ 2)
    if distHyp > 160:
        distHyp = 160

    return [distX, distY, distHyp]


def angleToXY(XYA):
    X = XYA[0]
    Y = XYA[1]
    currenta = XYA[2]

    if Y == 0:
        Y = 0.000000000000001
    a = math.degrees(math.atan(abs(X/Y)))

    if X < 0:
        a = 180 - a
    if Y < 0:
        a = 360 - a

    if a < currenta:
        angle = currenta - a
    else:
        angle = a - currenta

    turn(angle)
    return angle

# Renvoie un array [compteurDroit, compteurGauche]
def checkRC():
    RC = param.MotorsI2C.getRC()
    return RC


def checkAngle(RC):
    Difference = RC[0]-RC[1]
    angle = math.atan2(Difference, param.DistanceRouesTics)
    return angle

def whereAreWe():
    oldXYA = param.oldXYA
    RC = checkRC()
    RCM = (RC[0] + RC[1])/2
    XYA = 0
    XYA[2] = checkAngle(RC) + param.oldXYA[2]
    XYA[0] = (oldXYA[0]+(RCM*(math.cos(oldXYA[2])+math.cos(XYA[2]))/2)*param.CmParTics)
    XYA[1] = (oldXYA[1]+(RCM*(math.sin(oldXYA[2])+math.sin(XYA[2]))/2)*param.CmParTics)
    param.oldXYA = XYA
    return XYA

def areWeArived(XYA, wantedXYA):
    if abs(wantedXYA[0] - XYA[0]) < 6
        if abs(wantedXYA[1] - XYA[1]) < 6
            if abs(wantedXYA[2] - XYA[2]) < 0.01745
                return True
    return False

def goToRightPosition(wantedXYA):
    XYA = whereAreWe()
    if !areWeArived(XYA, wantedXYA)
        logging.warning("We are not at the right position ...")
        h = math.sqrt(XYA[0]*XYA[0] + XYA[1]*XYA[1])
        a = XYA[2]
        if a < - 0.01745
            param.MotorsI2C.turnRight(abs(a))
            whereAreWe()
        if a > 0.01745
            param.MotorsI2C.turnLeft(abs(a))
            whereAreWe()
        param.MotorsI2C.forward(h)
        whereAreWe()
        param.MotorsI2C.turnLeft(wantedXYA[2]-a)
        whereAreWe()
    return True


    