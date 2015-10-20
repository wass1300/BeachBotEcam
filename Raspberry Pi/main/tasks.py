# /usr/bin/python
# -*- coding: Utf8 -*-
"""
@author: Louis Defauw
@date: 28.02.2015
@note: Choix de l objectif a effectuer et lancement de la tache
@todo: a tester (verifier les posX,posY,angle de chaque tache)
                (verifier l ordre les taches)
"""

import logging
import time

import param
import subtask


class Task(object):
    def __init__(self, name, cat, posX, posY, angle):
        cor = param.colCor
        self.name = name
        self.cat = cat
        self.posX = posX*cor
        self.posY = posY
        self.angle = angle
        logging.info("Creation de la tache %s" % self.name)

    def getName(self):
        return self.name

    def getCat(self):
        return self.cat

    def getXYa(self):
        return [self.posX, self.posY, self.angle]


class Tasks(object):
    def __init__(self):
        angleInit = param.angleInit
        self.tasksList = [
            #Task("Calibrate", "Calibrate", 0, 0, 0)
            Task("Plot1", "Plot1", 630, 645, None),
            #Task("Clap1", "Claps", 630, 645, None),
            # Task("Plot2", "Plot", 200, 600, None),
            # Task("Plot3", "Plot", 400, 230, None),
            # Task("Release1", "Release", 150, 25, 270),
            # Task("Glass1", "Glass", 1250, 250, None),
            # Task("Release2", "Release", 1150, 875, -angleInit),
            # Task("Plot4", "Plot", 1410, 250, None),
            # Task("Plot5", "Plot", 1410, 150, None),
            # Task("Clap1", "Clap", 1250, 0, angleInit),
            # Task("Clap3", "Clap", 650, 0, angleInit),
            # Task("Release3", "Release", 1150, 950, -angleInit),
            # Task("Plot6", "Plot", 1410, 1800, None),
            # Task("Plot7", "Plot", 650, 1800, None),
            # Task("Plot8", "Plot", 650, 1900, None),
            # Task("Release4", "Release", 1150, 1050, -angleInit),
            # Task("Glass2", "Glass", 590, 1170, None),
            # Task("Release6", "Release", -1250, 700, -angleInit),
            # Task("Clap2", "Clap", -950, 0, angleInit),
            # Task("Glass5", "Glass", 0, 350, None),
            # Task("Release7", "Release", -1250, 1300, -angleInit),
            ]
        logging.info("Creation de la liste de taches")

    def getTasksList(self):
        return self.tasksList

    def runTask(self, num):
        logging.info("Tache %s (%d)" % (self.tasksList[num].getName(), num))
        time.sleep(0.5)
        options[self.tasksList[num].getCat()](self.tasksList[num].getXYa())

options = {
    "Plot1": subtask.plot1,
    "Claps": subtask.clap,
    "Plot": subtask.plot1,
    "Glass": subtask.glass,
    "Release": subtask.release,
    "Clap": subtask.clap,
}
